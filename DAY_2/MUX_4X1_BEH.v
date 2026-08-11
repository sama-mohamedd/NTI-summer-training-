module MUX_4X1_BEH (

input A ,
input B,
input C,
input D,
input [1:0] select,
output reg Y


);
always @(*)
  begin
  case(select)
   2'b00:Y = A ;
   2'b01:Y = B ;
   2'b10:Y = C ;
   2'b11:Y = D ;
   default:Y = 0;
   endcase
   end 
   endmodule 