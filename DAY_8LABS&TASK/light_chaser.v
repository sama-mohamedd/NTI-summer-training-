
    module light_chaser 
	(
    input wire clk,
    input wire rst_n,
    input wire hold_n,
    output reg [3:0] sout
);

    always @(posedge clk or negedge rst_n) 
	   begin
        if (rst_n == 1'b0)
     		begin
            sout <= 4'b0001;
        end 
        else if (hold_n == 1'b0) 
		    begin
            sout <= sout;
        end 
        else 
		   begin
            sout <= {sout[2:0], sout};
        end
    end

endmodule
