module Module_fadd_32bits (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
wire cout1;
add16 a1(.a(a[15:0]), .b(b[15:0]),.cin(1'b0), .sum(sum[15:0]), .cout(cout1)  );
add16 a2(.a(a[31:16]), .b(b[31:16]),.cin(cout1), .sum(sum[31:16]), .cout()  );
endmodule 
module add1 (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
assign sum = a ^ b ^ cin;
assign cout = (a & b) | (b & cin) | (a & cin);

endmodule