module FA_data_flow_1BIT(

  input  wire A, 
  input  wire B,
  input  wire Cin,
  
  output wire sum,
  output wire Cout
  
);

assign sum = A^B^Cin ;
assign Cout = (A & B ) | ( B& Cin ) | (A & Cin ) ;
endmodule 