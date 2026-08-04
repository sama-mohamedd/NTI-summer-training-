module FA_BEHAVIORAL_1BIT (

  input wire A, 
  input wire B,
  input wire Cin,
  
  output reg sum,
  output reg cout
  
);


always@(A or B or Cin )

begin 

sum = A^B^Cin;
cout =(A&B) | (A&Cin) | (B&Cin);

end 
endmodule
