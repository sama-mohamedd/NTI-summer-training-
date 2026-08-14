`timescale 1ns / 1ps

module tb_DEBOUNCER_MEALY;

    reg DATA;
    reg CLK;
    reg RES;

    wire OUT_DATA_MEALY;

    DEBOUNCER_MEALY dut (
        .DATA(DATA),
        .CLK(CLK),
        .RES(RES),
        .OUT_DATA_MEALY(OUT_DATA_MEALY)
    );

    always #5 CLK = ~CLK;

    initial begin
        CLK  = 0;
        RES  = 0;
        DATA = 0;

        #20;
        RES = 1;
        #10;


        #20 DATA = 1;
        #30 DATA = 0;
        #20 DATA = 1;
        #10 DATA = 0;

        #20 DATA = 1;
        $display("hold", $time);

        #1_000_050;

        $display("OUT_DATA_MEALY = %b ", $time, OUT_DATA_MEALY);
      
        #100;
        DATA = 0;
        #50;
        $display("OUT_DATA_MEALY = %b ", $time, OUT_DATA_MEALY);


        #100;
        $finish;
    end

endmodule