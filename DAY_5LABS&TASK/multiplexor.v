module multiplexor#(
    parameter WIDTH = 5 
)
(
    input wire sel,                     
    input wire [WIDTH-1:0] in0,        
    input wire [WIDTH-1:0] in1,       
    output reg [WIDTH-1:0] mux_out     
);

 
    always @(*)
	begin
        if (sel == 1'b0) 
		   begin
            mux_out = in0;
           end 
		else
     		begin
            mux_out = in1;
            end
    end
    
endmodule
