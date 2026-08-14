module seq_detector_101_moore_non_overlapping (
    input  wire clk,
    input  wire rst_n,
    input  wire in,
    output reg  out
);

    localparam S0 = 2'b00; // Reset / Search
    localparam S1 = 2'b01; // Got "1"
    localparam S2 = 2'b10; // Got "10"
    localparam S3 = 2'b11; // Got "101" (Output = 1)

    reg [1:0] state, next_state;

    // 1. State Register
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= S0;
        end else begin
            state <= next_state;
        end
    end

    // 2. Next State Logic 
    always @(*) begin
        case (state)
            S0: begin
                if (in) next_state = S1;
                else    next_state = S0;
            end

            S1: begin
                if (in) next_state = S1;
                else    next_state = S2;
            end

            S2: begin
                if (in) next_state = S3; 
                else    next_state = S0;
            end

            S3: begin
                // Non-overlapping: cannot reuse past bits
                if (in) next_state = S1; 
                else    next_state = S0; 
            end

            default: next_state = S0;
        endcase
    end

    // 3. Moore Output Logic
    always @(*) begin
        out = (state == S3);
    end

endmodule