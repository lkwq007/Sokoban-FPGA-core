//==================================================================================================
//  Filename      : game_core_tb.v
//  Created On    : 2017-07-05 14:49:42
//  Last Modified : 2017-07-05 15:08:01
//  Revision      : 
//  Author        : Lnyan
//  Company       : College of Information Science and Electronic Engineering, Zhejiang University
//  Email         : lkwq007@gmail.com or i@llonely.com
//
//  Description   : testbench for game core module
//
//
//==================================================================================================
module game_core_tb;
	parameter delay=100;
	reg[5:0] cursor;
	reg clk,game_area,retract,retry,left,right;
	wire win;
	wire[63:0] wall,way,box,destination;
	wire[5:0] man;
	wire[1:0] stage;
	game_core uut(.clk(clk),.game_area(game_area),.retract(retract),.retry(retry),.left(left),.right(right),
					.wall(wall),.way(way),.box(box),.destination(destination),.man(man),.stage(stage),.win(win));
	initial begin
		clk=0;
		game_area=0;
		retract=0;
		left=0;
		right=0;
		cursor=0;
		#delay/2
		clk=~clk;
	end

endmodule