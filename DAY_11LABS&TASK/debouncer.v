`timescale 1ns / 1ps

module DEBOUNCER_MEALY
(
    input  wire DATA,    // Raw bouncy button input
    input  wire CLK,     // System clock
    input  wire RES,     // Active-low reset

    output reg  OUT_DATA_MEALY // Clean debounced output
);

    // Encoding for states
    localparam S0 = 1'b0; // Button is RELEASED / Resting
    localparam S1 = 1'b1; // Button is PRESSED / Counter running

    // State registers declaration
    reg PRESENT_STATE, NEXT_STATE;

    // Counter to wait for button stability (~2ms at 50MHz clock)
    reg [19:0] counter;

    // 1. State Register 
 
    always @(posedge CLK or negedge RES) begin
        if (~RES) begin
            PRESENT_STATE <= S0;
        end else begin
            PRESENT_STATE <= NEXT_STATE;
        end
    end

    // Counter Logic (Separated from FSM states)

    always @(posedge CLK or negedge RES) begin
        if (~RES) begin
            counter <= 20'd0;
        end else begin

            if (PRESENT_STATE == S1 && DATA == 1'b1) begin
                if (counter < 20'd100_000) begin
                    counter <= counter + 1'b1;
                end
            end else begin
                counter <= 20'd0; 
            end
        end
    end
	
    // 2. Next State Logic (Combinational Logic)

    always @(*) begin
        NEXT_STATE = PRESENT_STATE;

        case (PRESENT_STATE)
            S0: begin
                case (DATA)
                    1'b0: NEXT_STATE = S0;
                    1'b1: NEXT_STATE = S1; 
                endcase
            end

            S1: begin
                case (DATA)
                    1'b0: NEXT_STATE = S0; 
                    1'b1: begin
                        if (counter >= 20'd100_000)
                            NEXT_STATE = S1; 
                        else
                            NEXT_STATE = S1; 
                    end
                endcase
            end

            default: NEXT_STATE = S0;
        endcase
    end

    
    // 3. Mealy Output Logic (Combinational)
  
    always @(*) begin
        case (PRESENT_STATE)
            S0: begin
                case (DATA)
                    1'b0: OUT_DATA_MEALY = 1'b0;
                    1'b1: OUT_DATA_MEALY = 1'b0;
                endcase
            end

            S1: begin
                case (DATA)
                    1'b0: OUT_DATA_MEALY = 1'b0;
                    1'b1: begin
                        if (counter >= 20'd100_000)
                            OUT_DATA_MEALY = 1'b1;
                        else
                            OUT_DATA_MEALY = 1'b0;
                    end
                endcase
            end

            default: OUT_DATA_MEALY = 1'b0;
        endcase
    end

endmodule