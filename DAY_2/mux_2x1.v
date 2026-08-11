module mux_2x1 (
    
    input A,
    input B,
    input sel,
	output reg y
);
 always@(*)
 begin
      if(sel)
	  y = B;
	  else
	  y = A;
	  end  
endmodule 