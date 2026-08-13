`timescale 1ns / 1ps

module light_chaser_tb;

    reg clk;
    reg rst_n;
    reg hold_n;
    wire [3:0] sout;

    light_chaser dut (
        .clk(clk),
        .rst_n(rst_n),
        .hold_n(hold_n),
        .sout(sout)
    );

    always 
	  begin
        #10 clk = ~clk;
    end

    initial
    	begin
        clk = 0;
        rst_n = 0;
        hold_n = 1;

        #40;
        rst_n = 1;

        #80;
        hold_n = 0;

        #40;
        hold_n = 1;

        #100;
        $finish;
    end

endmodule
