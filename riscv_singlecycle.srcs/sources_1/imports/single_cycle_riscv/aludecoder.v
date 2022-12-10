module aludecoder(op,aluop,funct3,funct7b5,alucontrol);

input wire [6:0] op;
input wire [2:0] funct3;
input wire [1:0] aluop; 
input wire funct7b5;
output reg [1:0] alucontrol;

always@(*)
	case(aluop)
		2'b00: alucontrol = 2'b00;
		2'b01: alucontrol = 2'b01;
		2'b10:
			case(funct3)
				3'b000:
					case({op[5],funct7b5})
						2'b11: alucontrol = 2'b01;
						default: alucontrol = 2'b00;
					endcase
				3'b110: alucontrol = 2'b10;
				3'b111: alucontrol = 2'b11;
				default: alucontrol = 2'b00;
			endcase
		default: alucontrol = 2'b00;
	endcase;
					

endmodule