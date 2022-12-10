//wip general purpose alu for r type instructions
module alu(srca,srcb,opselect,aluresult,zero);

input wire [1:0] opselect;
input wire [31:0] srca,srcb;
output reg [31:0] aluresult;
output reg zero; 

always@(opselect or srca or srcb)
	begin 
		zero = 0;
		case(opselect)
			//add
			2'b00:	aluresult <= srca + srcb;
			//sub
			2'b01:	begin
						if(srca == srcb)
							zero=1;
						aluresult <= srca - srcb;
					end
			//and
			2'b10:	aluresult <= srca | srcb;
			//or
			2'b11:	aluresult <= srca & srcb;
			//default: aluresult <= srca & srcb;
		endcase
	end
	
endmodule