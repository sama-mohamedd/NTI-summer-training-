
module block_parity_gen (
  input  wire clk,
  input  wire reset,
  input  wire serial_in,
  output reg  parity_out
);

  reg [7:0] shift_reg;
  reg [2:0] count;

  always @(posedge clk) begin
    if (reset) begin
      shift_reg  <= 8'b0000_0000;
      count      <= 3'b000;
      parity_out <= 1'b0;
    end else begin
      shift_reg <= {shift_reg[6:0], serial_in};
      count     <= count + 1'b1;

      if (count == 3'd7) begin
        parity_out <= ^{shift_reg[6:0], serial_in};
      end
    end
  end

endmodule