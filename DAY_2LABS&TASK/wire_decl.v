`default_nettype none
module wire_decl(
    input wire  a,
    input  wire b,
    input wire c,
    input wire d,
    output wire out,
    output wire out_n   ); 
	wire w0  , w1 ;
	assign w0 = a& b ;
	assign w1 = c& d ;
	assign out =w0 |w1 ;
	assign out_n =~ out ;
	endmodule 