//==================================================================================================
//  Filename      : game_stage_counter.v
//  Created On    : 2017-07-04 14:42:57
//  Last Modified : 2017-07-10 10:40:14
//  Revision      : 
//  Author        : Lnyan
//  Company       : College of Information Science and Electronic Engineering, Zhejiang University
//  Email         : lkwq007@gmail.com or i@llonely.com
//
//  Description   : stage counter for this game
//
//
//==================================================================================================
module game_stage_counter(clk,en,rst,q);
	parameter N=4,CounterBits=2;
	input clk,en,rst;
	output reg[CounterBits-1:0] q=0;
	always @(posedge clk) begin
		if(rst) begin
			q=0;		
		end
		else begin
			if(en) begin
				if(q==N-1) begin
					q=0;
				end
				else begin
					q=q+1;
				end
			end
			else begin
				q=q;
			end
		end
	end
endmodule