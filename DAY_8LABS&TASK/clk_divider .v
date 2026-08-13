module clk_divider 
(
    input wire clkin,
    input wire reset,  
    output wire clkout
);

    reg [2:0] counter;
	
    always @(posedge clkin or negedge reset) 
	   begin
        if (reset == 1'b0)
            counter <= 3'b0;
        else 
            counter <= counter + 1'b1;
    end	

    assign clkout = counter[2];

endmodule
