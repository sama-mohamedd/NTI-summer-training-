module MUX_4X1_GL
(
    input wire i0,
    input wire i1,
    input wire i2,
    input wire i3,
    input wire [1:0] S,
    output wire out
);

wire s1n, s0n;
wire y0, y1, y2, y3;

not n1 (s1n, S[1]);
not n2 (s0n, S[0]);

and a1 (y0, i0, s1n, s0n);
and a2 (y1, i1, s1n, S[0]);
and a3 (y2, i2, S[1], s0n);
and a4 (y3, i3, S[1], S[0]);

or o1 (out, y0, y1, y2, y3);

endmodule