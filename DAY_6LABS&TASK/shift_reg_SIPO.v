module shift_reg_SIPO 
(
    input wire clk,
    input wire rst_n,
    input wire serial_in,
    output reg [3:0] parallel_out
);


    always @(posedge clk or negedge rst_n)
     	begin
          if (!rst_n) begin
            parallel_out <= 4'b0000;
          end else begin
            parallel_out <= {parallel_out[2:0], serial_in};
          end
    end

endmodule
