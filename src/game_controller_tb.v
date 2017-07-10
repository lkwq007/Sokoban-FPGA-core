//==================================================================================================
//  Filename      : game_controller_tb.v
//  Created On    : 2017-07-08 09:00:34
//  Last Modified : 2017-07-10 14:44:01
//  Revision      : 
//  Author        : Lnyan
//  Company       : College of Information Science and Electronic Engineering, Zhejiang University
//  Email         : lkwq007@gmail.com or i@llonely.com
//
//  Description   : game controller testbench
//
//
//==================================================================================================
module game_controller_tb();
	parameter DELAY=10; 
	reg clk,retry,retract,left,game_area,reset,right,move_result;
	reg[5:0] cursor,man;
	reg[63:0] destination,way,box;
	wire[1:0] stage;
	wire[133:0] game_state;
	wire game_state_en,stage_up,win;
	wire[1:0] sel;
	assign game_state={way,box,man};
	game_controller controller(
		.clk(clk),.game_state(game_state),.move_result(move_result),
		.destination(destination),.cursor(cursor),.retry(retry),.retract(retract),
		.left(left),.game_area(game_area),.reset(reset),.right(right),
		.stage(stage),.stage_up(stage_up),.game_state_en(game_state_en),.sel(sel),.win(win)
		);
	game_stage_counter counter_inst(.clk(clk),.en(stage_up),.rst(reset),.q(stage));
	initial begin
		#(DELAY)
		clk=0;
		retry=0;
		retract=0;
		left=0;
		game_area=0;
		right=0;
		reset=0;
		move_result=0;

		way=0;
		box=1;
		man=0;
		destination=2;
		cursor=1;
		//stage=0;

		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		reset=1;
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
		reset=0;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		right=1;
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
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		left=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		left=0;
		retry=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		retry=0;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		left=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		left=0;
		retract=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		retract=0;
		left=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		//left=0;
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
		game_area=1;
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
		move_result=1;
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
		destination=1;
		left=0;
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
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
		reset=1;
		#(DELAY)
		clk=0;
		#(DELAY)
		clk=1;
	end
endmodule