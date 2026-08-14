`timescale 1ns / 1ps

module tb_seq_detector_101_moore_non;

    reg clk;
    reg rst_n;
    reg in;

    wire out;

    seq_detector_101_moore_non_overlapping dut (
        .clk(clk),
        .rst_n(rst_n),
        .in(in),
        .out(out)
    );

    always #5 clk = ~clk;

    initial begin
        clk   = 0;
        rst_n = 0;
        in    = 0;

        #15;
        rst_n = 1;

        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;

        #10 in = 0;

        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;

        #30;
        $finish;
    end

   

endmodule