module controller(op,funct3,funct7b5,zero,pcsrc,resultsrc,memwrite,alucontrol,alusrc,immsrc,regwrite);

input wire [6:0] op;
input wire [2:0] funct3;
input wire funct7b5, zero;
output wire pcsrc,resultsrc,memwrite,alusrc,regwrite;
output wire [1:0] alucontrol;
output wire [1:0] immsrc;

wire branch;
wire [1:0] aluop;
assign pcsrc = zero & branch;

maindecoder md(op,branch,resultsrc,memwrite,alusrc,immsrc,regwrite,aluop);
aludecoder ad(op,aluop,funct3,funct7b5,alucontrol);

endmodule