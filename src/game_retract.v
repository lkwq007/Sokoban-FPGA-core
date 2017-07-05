//==================================================================================================
//  Filename      : game_retract.v
//  Created On    : 2017-07-04 16:04:33
//  Last Modified : 2017-07-05 09:21:35
//  Revision      : 
//  Author        : Lnyan
//  Company       : College of Information Science and Electronic Engineering, Zhejiang University
//  Email         : lkwq007@gmail.com or i@llonely.com
//
//  Description   : 3 times retract module
//
//
//==================================================================================================
module game_retract(clk,game_state,game_state_int,game_state_bm,game_state_mm,game_state_en,sel);
	input clk,game_state_en;
	input[133:0] game_state_mm,game_state_bm,game_state_int;
	input[1:0] sel;
	output[133:0] game_state;
	wire[133:0] game_state_now,game_state_latest_1,game_state_latest_2,game_state_latest_3;
	wire[133:0] mux_state_now,mux_state_latest_1,mux_state_latest_2,mux_state_latest_3;
	
	assign game_state=game_state_now;
	
	game_mux_4 #(.N(134)) mux_now(.sel(sel),.in_1(game_state_int),.in_2(game_state_bm),.in_3(game_state_mm),.in_3(game_state_latest_1),.out(mux_state_now));
	dffre #(.N(4)) state_now(.clk(clk),.d(mux_state_now),.r(1`b0),.en(game_state_en),.q(game_state_now));

	game_mux_4 #(.N(134)) mux_now(.sel(sel),.in_1(game_state_int),.in_2(game_state_now),.in_3(game_state_now),.in_3(game_state_latest_2),.out(mux_state_latest_1));
	dffre #(.N(4)) state_now(.clk(clk),.d(mux_state_latest_1),.r(1`b0),.en(game_state_en),.q(game_state_latest_1));

	game_mux_4 #(.N(134)) mux_now(.sel(sel),.in_1(game_state_int),.in_2(game_state_latest_1),.in_3(game_state_latest_1),.in_3(game_state_latest_2),.out(mux_state_latest_2));
	dffre #(.N(4)) state_now(.clk(clk),.d(mux_state_latest_2),.r(1`b0),.en(game_state_en),.q(game_state_latest_2));
	
	game_mux_4 #(.N(134)) mux_now(.sel(sel),.in_1(game_state_int),.in_2(game_state_latest_2),.in_3(game_state_latest_2),.in_3(game_state_latest_3),.out(mux_state_latest_3));
	dffre #(.N(4)) state_now(.clk(clk),.d(mux_state_latest_3),.r(1`b0),.en(game_state_en),.q(game_state_latest_3));

endmodule