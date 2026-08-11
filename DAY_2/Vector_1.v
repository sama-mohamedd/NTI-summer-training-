module Vector_1 (

input wire [15:0] inp ,
output wire [7:0]  upp,
output wire  [7:0] lower


);
assign upp =inp[15:8];
assign lower =inp[7:0];
endmodule 