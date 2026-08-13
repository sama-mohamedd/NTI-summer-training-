module MUX_4X1_Struct(
 input wire A,
 input wire B,
 input wire C,
 input wire D,  
 input wire [1:0] SEL,
  
  output wire Y
);
wire w0 , w1;
mux_2x1 m1 (.A(A) , .B(B), .sel( SEL[0]), .y(w0));
mux_2x1 m2 (.A(C) , .B(D), .sel( SEL[0]), .y(w1));
mux_2x1 m3 (.A(w0) , .B(w1) , .sel( SEL[1]) , .y(Y));
endmodule