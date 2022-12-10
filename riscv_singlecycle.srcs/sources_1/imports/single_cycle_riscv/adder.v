module adder #(parameter N = 32)(op1, op2, out);

input wire [N-1:0] op1,op2;
output wire [N-1:0] out;

assign out = op1 + op2; 

endmodule