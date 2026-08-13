`timescale 1ns / 1ps

module shift_reg_SIPO_tb;

    reg clk;
    reg rst_n;
    reg serial_in;
    wire [3:0] parallel_out;

    sipo_shift_reg uut (
        .clk(clk),
        .rst_n(rst_n),
        .serial_in(serial_in),
        .parallel_out(parallel_out)
    );

    always
	#10 
	clk = ~clk;

    initial 
	 begin
        clk = 0;
        rst_n = 0;
        serial_in = 0;

        #20;
        rst_n = 1;

        #20 serial_in = 1'b1; 
        #20 serial_in = 1'b1; 
        #20 serial_in = 1'b0; 
        #20 serial_in = 1'b1; 
        
        #20;
        $finish;
    end

endmodule
