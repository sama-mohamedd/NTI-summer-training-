module FA_GATE_LEVEL_1BIT (


  input wire A, 
  input  wire B,
  input  wire Cin,
  
  output wire sum,
  output wire Cout

);
wire s1 , c1 , c2 ;


xor (s1 ,A , B);
and (c1 ,A , B);

xor (sum ,s1 ,Cin);
and (c2 , s1 , Cin );

or (Cout ,c1 , c2 );

endmodule 
