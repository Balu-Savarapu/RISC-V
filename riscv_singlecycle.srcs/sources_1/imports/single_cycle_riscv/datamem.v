module datamem(clk, we, addr, read_data, write_data, reset);

input wire reset;
input wire clk,we;
input wire [5:0] addr; //6 bit address for 64 memory locations
input wire [31:0] write_data;
output wire [31:0] read_data;
integer k;

reg [31:0] datamemory [63:0];

//initialise dmem for testing
// initial begin
// for(k=0;k<64;k++)
	// begin
		// datamemory[k] = k;
	// end
// end

always@(posedge clk or posedge reset)
	begin
		if(reset)
			begin
				for(k=0;k<63;k=k+1)
					datamemory[k] = 0;
			end
		else
			begin
				if(we)
					datamemory[addr] <= write_data;
			end
	end

assign read_data = datamemory[addr];

endmodule