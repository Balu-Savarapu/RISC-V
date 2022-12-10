module instrmem(addr, read_data);

input wire [4:0] addr;
output wire [31:0] read_data;

wire [31:0] imwire [31:0]; //for testing purposes

reg [31:0] imem [31:0]; //word addressed instruction memory. 32 memory locations.

initial $readmemh("looping_fibo.mem", imem);

assign read_data = imem[addr];

endmodule