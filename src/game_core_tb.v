//==================================================================================================
//  Filename      : game_core_tb.v
//  Created On    : 2017-07-05 14:49:42
//  Last Modified : 2017-07-10 15:19:05
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
	parameter DELAY=100;
	reg[5:0] cursor;
	reg clk,game_area,retract,retry,left,right,reset;
	wire win;
	wire[63:0] wall,way,box,destination;
	wire[5:0] man;
	wire[1:0] stage;
	game_core uut(.clk(clk),.cursor(cursor),.reset(reset),.game_area(game_area),.retract(retract),.retry(retry),.left(left),.right(right),
					.wall(wall),.way(way),.box(box),.destination(destination),.man(man),.stage(stage),.win(win));
	initial begin
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		game_area=0;
		retract=0;
		left=0;
		right=1;
		cursor=6'o00;
		retry=0;
		reset=0;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		right=0;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		reset=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		reset=0;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		cursor=6'o40;
		game_area=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		left=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		retract=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		retract=0;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		retry=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		retry=0;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		cursor=6'o47;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		cursor=6'o03;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		cursor=6'o73;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		cursor=6'o37;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		cursor=6'o30;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		cursor=6'o75;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		$stop;
	end

endmodule
