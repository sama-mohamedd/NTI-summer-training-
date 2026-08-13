module Module_addsub(


 input [31:0] a,
 input [31:0] b,
 input sub,
 output [31:0] sum

);
 wire [31:0] b_after;
 wire coutt;
  assign b_after = sub ? ~b : b ;
  add16 a1( .a(a[15:0]),.b(b_after[15:0]),.cin(sub), .sum(sum[15:0]), .cout(coutt));
add16 a2( .a(a[31:16]),.b(b_after[31:16]),.cin(coutt), .sum(sum[31:16]), .cout());
endmodule