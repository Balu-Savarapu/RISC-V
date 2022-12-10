//extend imm to 32 bits
//imm always found somewhere in instruction[31:7]
//immsrc will tell where exactly it is
module sign_extender(instr, immext, immsrc);

input wire [1:0] immsrc;
// for I type immsrc = 00 --------> imm = instruction[31:20]
// for S type immsrc = 01 --------> imm = instruction[31:25]+instruction[11:7]
// for B type immsrc = 10 --------> imm = instruction[31]+instruction[7]+instruction[30:25]+instruction[11:8]+1'b0;

input wire [31:7] instr;
output reg [31:0] immext;

always@(instr or immsrc)
	begin
		case(immsrc)
			// I type
			2'b00: immext = {{20{instr[31]}},instr[31:20]};
			// S type
			2'b01: immext = {{20{instr[31]}},instr[31:25],instr[11:7]};
			// B type
			2'b10: immext  = {{20{instr[31]}},instr[31],instr[7],instr[30:25],instr[11:8]};
			
			default: immext = {{20{instr[31]}},instr[31:20]};
		endcase
	end
endmodule