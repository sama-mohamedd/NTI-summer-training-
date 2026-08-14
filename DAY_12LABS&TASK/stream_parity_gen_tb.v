`timescale 1ns / 1ps

module block_parity_gen_tb;

  reg clk;
  reg reset;
  reg serial_in;
  wire parity_out;

  block_parity_gen dut (
    .clk(clk),
    .reset(reset),
    .serial_in(serial_in),
    .parity_out(parity_out)
  );

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    reset = 1;
    serial_in = 0;

    #20;
    reset = 0;

    // Send 8 bits: 10101010 (Even parity -> Expected 0)
    serial_in = 0; #20;
    serial_in = 1; #20;
    serial_in = 0; #20;
    serial_in = 1; #20;
    serial_in = 0; #20;
    serial_in = 1; #20;
    serial_in = 0; #20;
    serial_in = 1; #20;

    if (parity_out === 1'b0)
      $display("Test 1 PASS: Got %b", parity_out);
    else
      $display("Test 1 FAIL: Got %b", parity_out);

    // Send 8 bits: 11010000 (Odd parity -> Expected 1)
    serial_in = 0; #20;
    serial_in = 0; #20;
    serial_in = 0; #20;
    serial_in = 0; #20;
    serial_in = 1; #20;
    serial_in = 0; #20;
    serial_in = 1; #20;
    serial_in = 1; #20;

    if (parity_out === 1'b1)
      $display("Test 2 PASS: Got %b", parity_out);
    else
      $display("Test 2 FAIL: Got %b", parity_out);

    $finish;
  end

endmodule