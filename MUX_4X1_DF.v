module MUX_4X1_DF
(
  input wire A,
  input wire B,
  input wire C,
  input wire D,  
  input wire [1:0] Select,
  
  output wire Y
);
  
assign Y= Select[1]?(Select[0]?D:C):(Select[0]?B:A);
endmodule 