module register_file(clk, rs1, rs2, rd, write_data, write_enable, read_data1, read_data2, reset, x0,x1,x2,x4);

input wire reset;
input wire clk, write_enable;
input wire [4:0] rs1,rs2,rd;
input wire [31:0] write_data;
output wire [31:0] read_data1, read_data2;
integer k;
output wire [31:0] x0,x1,x2,x4;

reg [31:0] regfile [31:0];

//initialise regfile for testing
// initial
// begin
	// for(k=0;k<32;k++)
		// begin
			// regfile[k] = k;
		// end
// end

assign read_data1 = regfile[rs1];
assign read_data2 = regfile[rs2];
assign x0 = regfile[0];
assign x1 = regfile[1];
assign x2 = regfile[2];
assign x4 = regfile[4];
	
always@(posedge clk or posedge reset)
	begin
		if(reset)
			begin
				for(k=0;k<32;k=k+1)
					regfile[k] = 32'b0;
			end
		else
			begin
				if(write_enable)
					regfile[rd] <= write_data;
			end
	end

endmodule