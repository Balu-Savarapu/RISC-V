module maindecoder(op,branch,resultsrc,memwrite,alusrc,immsrc,regwrite,aluop);

input wire [6:0] op;
output reg branch,resultsrc,memwrite,alusrc,regwrite;
output reg [1:0] immsrc,aluop;

always@(op)
	case(op)
		//R type
		7'b0110011: begin
						branch = 0;
						resultsrc = 0;
						memwrite = 0;
						alusrc = 0;
						regwrite = 1;
						immsrc = 2'bxx;
						aluop = 2'b10;
					end
		//I type
		7'b0010011: begin
						branch = 0;
						resultsrc = 0;
						memwrite = 0;
						alusrc = 1;
						regwrite = 1;
						immsrc = 2'b00;
						aluop = 2'b10;
					end
		//lw
		7'b0000011: begin
						branch = 0;
						resultsrc = 1;
						memwrite = 0;
						alusrc = 1;
						regwrite = 1;
						immsrc = 2'b00;
						aluop = 2'b00;
					end
		//sw
		7'b0100011: begin
						branch = 0;
						resultsrc = 1'bx;
						memwrite = 1;
						alusrc = 1;
						regwrite = 0;
						immsrc = 2'b01;
						aluop = 2'b00;
					end
		//beq
		7'b1100011: begin
						branch = 1;
						resultsrc = 1'bx;
						memwrite = 0;
						alusrc = 0;
						regwrite = 0;
						immsrc = 2'b10;
						aluop = 2'b01;
					end
					
		default:	begin
						branch = 0;
						resultsrc = 1'b0;
						memwrite = 0;
						alusrc = 0;
						regwrite = 0;
						immsrc = 2'b00;
						aluop = 2'b00;
					end
	endcase

endmodule