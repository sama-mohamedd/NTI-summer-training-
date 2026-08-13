module gray_seg_wrapper (
    input wire [3:0] gray_ex,
    output wire [6:0] seg,
	 output wire seg_sel
);

  wire [3:0] gray_int;
  
  assign gray_int = ~gray_ex;
  
  assign seg_sel = 1'b0;

  gray_seg G2S (.gray(gray_int),.seg(seg));

endmodule