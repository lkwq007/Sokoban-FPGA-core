//==================================================================================================
//  Filename      : game_dffre.v
//  Created On    : 2017-07-04 15:41:16
//  Last Modified : 2017-07-06 11:03:02
//  Revision      : 
//  Author        : Lnyan
//  Company       : College of Information Science and Electronic Engineering, Zhejiang University
//  Email         : lkwq007@gmail.com or i@llonely.com
//
//  Description   : D Flip Flop with enable port
//
//
//==================================================================================================
module dffre(d,en,r,clk,q);
	parameter N=134;
	input en,r,clk;
	input[N-1:0] d;
	output[N-1:0] q;
	reg[N-1:0] q=0;
	always @(posedge clk) begin
		if(r==1) begin
			q=0;
		end
		else begin
			if(en==1) begin
				q=d;
			end
			else begin
				q=q;
			end
		end
	end
endmodule