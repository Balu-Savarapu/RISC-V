module program_counter(pcnext, pcout, clk, reset);

input wire clk,reset;
input wire [4:0] pcnext;
output reg [4:0] pcout;

always@(posedge clk or posedge reset)
	begin
		if(reset)
			pcout <= 5'b0;
		else
			pcout <= pcnext;
	end

endmodule