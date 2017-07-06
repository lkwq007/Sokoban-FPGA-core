//==================================================================================================
//  Filename      : game_core_tb.v
//  Created On    : 2017-07-05 14:49:42
//  Last Modified : 2017-07-05 15:50:45
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
	reg clk,game_area,retract,retry,left,right,reset;
	wire win;
	wire[63:0] wall,way,box,destination;
	wire[5:0] man;
	wire[1:0] stage;
	game_core uut(.clk(clk),.cursor(cursor),.reset(reset),.game_area(game_area),.retract(retract),.retry(retry),.left(left),.right(right),
					.wall(wall),.way(way),.box(box),.destination(destination),.man(man),.stage(stage),.win(win));
	initial begin
		clk=0;
		game_area=0;
		retract=0;
		left=0;
		right=1;
		cursor=6'b0;
		retry=0;
		reset=0;
		#(delay)
		clk=~clk;
		right=1;
		#(delay)
		clk=~clk;
		right=0;
		#(delay)
		clk=~clk;
		#(delay)
		clk=~clk;
		cursor=6'b0;
		left=1;
		game_area=1;
		#(delay)
		clk=~clk;
		cursor={3'd0,3'd0};
		left=1;
		game_area=1;
		#(delay)
		clk=~clk;
		cursor={3'd2,3'd6};
		left=1;
		game_area=1;
		#(delay)
		clk=~clk;
		cursor={3'd2,3'd6};
		game_area=0;
		left=0;
		right=1;
		#(delay)
		clk=~clk;
		#(delay)
		clk=~clk;
	end

endmodule
