module mux #(parameter N = 32)(in0,in1,cont,muxout);

input wire [N-1:0] in0;
input wire [N-1:0] in1;
input wire cont;
output wire [N-1:0] muxout;

assign muxout = cont ? in1 : in0;

endmodule