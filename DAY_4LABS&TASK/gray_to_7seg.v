module gray_to_7seg (
    input  wire [3:0] gray,     
    output reg  [6:0] seg       
);

    wire [3:0] binary;

   
    assign binary[3] = gray[3];
    assign binary[2] = binary[3] ^ gray[2];
    assign binary[1] = binary[2] ^ gray[1];
    assign binary[0] = binary[1] ^ gray[0];

  
    always @(*) begin
        case (binary)
            4'h0: seg = 7'b0000001; 
            4'h1: seg = 7'b1001111; 
            4'h2: seg = 7'b0010010;
            4'h3: seg = 7'b0000110; 
            4'h4: seg = 7'b1001100; 
            4'h5: seg = 7'b0100100; 
            4'h6: seg = 7'b0100000; 
            4'h7: seg = 7'b0001111; 
            4'h8: seg = 7'b0000000; 
            4'h9: seg = 7'b0000100; 
            4'hA: seg = 7'b0001000; 
            4'hB: seg = 7'b1100000; 
            4'hC: seg = 7'b0110001; 
            4'hD: seg = 7'b1000010; 
            4'hE: seg = 7'b0110000; 
            4'hF: seg = 7'b0111000; 
            default: seg = 7'b1111111; 
        endcase
    end

endmodule
