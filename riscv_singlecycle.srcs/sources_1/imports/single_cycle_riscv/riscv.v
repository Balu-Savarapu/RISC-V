module riscv(clk,reset,x0,x1,x2,x4);

input wire clk, reset;
output wire [31:0] x0,x1,x2,x4;

wire [4:0] pcnext;
wire [4:0] pcout;
wire [31:0] instruction;
wire [4:0] pcplus4;

instrmem im(pcout,instruction);
program_counter pc(pcnext, pcout, clk, reset);
adder #(.N(5)) pcplus(pcout, 5'b00001, pcplus4);

wire [31:0] read_data1, read_data2;
wire regwrite;
register_file rf(clk, instruction[19:15], instruction[24:20], instruction[11:7], resultmuxout, regwrite, read_data1, read_data2, reset,x0,x1,x2,x4);

wire [31:0] immext;
wire [1:0] immsrc;
sign_extender se(instruction[31:7], immext, immsrc);

wire [31:0] aluresult;
wire alusrc;
wire [31:0] alumuxout;
wire [1:0] alucontrol;
wire zero;
mux #(.N(32)) alumux(read_data2,immext,alusrc,alumuxout);
alu alu1(read_data1, alumuxout, alucontrol, aluresult, zero);

wire memwrite;
wire [31:0] read_data;
datamem dm(clk, memwrite, aluresult, read_data, read_data2, reset);

wire [31:0] resultmuxout;
wire resultsrc;
mux #(.N(32)) resultmux(aluresult,read_data,resultsrc,resultmuxout);

wire [31:0] pctarget;
wire pcsrc;
adder #(.N(5)) pcadder(pcout, immext, pctarget);
mux #(.N(32)) pcmux(pcplus4,pctarget,pcsrc,pcnext);

controller c(instruction[6:0],instruction[14:12],instruction[30],zero,pcsrc,resultsrc,memwrite,alucontrol,alusrc,immsrc,regwrite);

endmodule