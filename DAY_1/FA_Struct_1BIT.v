module FA_Struct_1BIT
(
  input  wire A, 
  input  wire B,
  input  wire Cin,
  
  output wire sum,
  output wire cout
);
 wire cout0, sum0, cout1;
half_adder HA0 (.A(A), .B(B), .sum(sum0), .cout(cout0));
half_adder HA1 (.A(Cin), .B(sum0), .sum(sum), .cout(cout1));
assign cout = cout0 | cout1;
endmodule 