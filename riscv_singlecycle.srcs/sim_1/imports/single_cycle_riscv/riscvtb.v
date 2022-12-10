`timescale 10ns/1ns
module riscvtb();

reg clk,reset;
wire [31:0] x0,x1,x2,x4;

riscv rs1(clk,reset,x0,x1,x2,x4);

initial
begin
	clk = 0;
	forever #1 clk = ~clk;
end

initial
begin
	$dumpfile("waveforms.vcd");
	$dumpvars(2,riscvtb);
	reset = 0;
	#1 reset = 1;
	#1 reset = 0;
	
	#10000 $finish;
end

endmodule