module controller (
    input wire [2:0] opcode,
    input wire [2:0] phase,
    input wire zero,       
    output reg sel,        
    output reg rd,        
    output reg ld_ir,      
    output reg inc_pc,     
    output reg halt,      
    output reg ld_pc,     
    output reg data_e,     
    output reg ld_ac,      
    output reg wr          
);


    localparam [2:0] HLT = 3'b000,
                     SKZ = 3'b001,
                     ADD = 3'b010,
                     AND = 3'b011,
                     XOR = 3'b100,
                     LDA = 3'b101,
                     STO = 3'b110,
                     JMP = 3'b111;

    localparam [2:0] INST_ADDR  = 3'd0,
                     INST_FETCH = 3'd1,
                     INST_LOAD  = 3'd2,
                     IDLE       = 3'd3,
                     OP_ADDR    = 3'd4,
                     OP_FETCH   = 3'd5,
                     ALU_OP     = 3'd6,
                     STORE      = 3'd7;

    reg HALT_cond;
    reg ALUOP_cond;
    reg SKZ_cond;
    reg JMP_cond;
    reg STO_cond;

    always @(*) 
	  begin
      
        HALT_cond  = (opcode == HLT);
        ALUOP_cond = (opcode == ADD || opcode == AND || opcode == XOR || opcode == LDA);
        SKZ_cond   = (opcode == SKZ);
        STO_cond   = (opcode == STO);
        JMP_cond   = (opcode == JMP);

        sel    = 1'b0;
        rd     = 1'b0;
        ld_ir  = 1'b0;
        inc_pc = 1'b0;
        halt   = 1'b0;
        ld_pc  = 1'b0;
        data_e = 1'b0;
        ld_ac  = 1'b0;
        wr     = 1'b0;

        case (phase)
            INST_ADDR: 
			begin
                sel = 1'b1;
            end
            
            INST_FETCH:
			begin
                sel = 1'b1;
                rd  = 1'b1;
            end
            
            INST_LOAD: 
			begin
                sel   = 1'b1;
                rd    = 1'b1;
                ld_ir = 1'b1;
            end
            
            IDLE: 
			begin
                sel   = 1'b1;
                rd    = 1'b1;
                ld_ir = 1'b1;
            end
            
            OP_ADDR: 
			begin
                halt   = HALT_cond;
                inc_pc = 1'b1;
            end
            
            OP_FETCH:
			begin
                rd = ALUOP_cond;
            end
            
            ALU_OP: 
			begin
                rd     = ALUOP_cond;
                inc_pc = (SKZ_cond && zero);
                ld_pc  = JMP_cond;
                data_e = STO_cond;
            end
            
            STORE:
			begin
                ld_ac  = ALUOP_cond;
                ld_pc  = JMP_cond;
                wr     = STO_cond;
                data_e = STO_cond;
            end
            
            default:
			begin
              
                sel = 1'b0;
            end
        endcase
    end

endmodule
