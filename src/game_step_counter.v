//==================================================================================================
//  Filename      : game_step_counter.v
//  Created On    : 2017-07-11 00:23:16
//  Last Modified : 2017-07-11 00:28:36
//  Revision      : 
//  Author        : Lnyan
//  Company       : College of Information Science and Electronic Engineering, Zhejiang University
//  Email         : lkwq007@gmail.com or i@llonely.com
//
//  Description   : 
//
//
//==================================================================================================
module game_step_counter(clk,inc,dec,rst,q);
	parameter N=255,CounterBits=8;
	input clk,inc,dec,rst;
	output reg[CounterBits-1:0] q=0;
	always @(posedge clk) begin
		if(rst) begin
			q=0;		
		end
		else begin
			if(inc) begin
				if(q==N-1) begin
					q=0;
				end
				else begin
					q=q+1;
				end
			end
			else if(dec) begin
				if(q==0) begin
					q=N-1;
				end
				else begin
					q=q-1;
				end
			end
			else begin
				q=q;
			end
		end
	end
endmodule