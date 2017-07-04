//==================================================================================================
//  Filename      : game_mux_4.v
//  Created On    : 2017-07-04 15:44:59
//  Last Modified : 2017-07-04 15:48:46
//  Revision      : 
//  Author        : Lnyan
//  Company       : College of Information Science and Electronic Engineering, Zhejiang University
//  Email         : lkwq007@gmail.com or i@llonely.com
//
//  Description   : mux 4 to 1 to select game state
//
//
//==================================================================================================
module game_mux_4(sel,in_0,in_1,in_2,in_3,out);
	parameter N=134;
	input[N-1:0] in_0,in_1,in_2,in_3;
	input[1:0] sel;
	output[N-1:0] out;
	reg[N-1:0] temp;
	assign out=temp;
	always @(*) begin
		case(sel)
			0:temp=in_0;
			1:temp=in_1;
			2:temp=in_2;
			3:temp=in_3;
		endcase
	end 
endmodule