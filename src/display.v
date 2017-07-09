//==================================================================================================
//  Filename      : display.v
//  Created On    : 2017-07-09 20:39:46
//  Last Modified : 2017-07-09 21:00:44
//  Revision      : 
//  Author        : Lnyan
//  Company       : College of Information Science and Electronic Engineering, Zhejiang University
//  Email         : lkwq007@gmail.com or i@llonely.com
//
//  Description   : 
//
//
//==================================================================================================
module display(/*autoport*/
//output
			red,
			green,
			blue,
//input
			clk,
			win,
			x_pos,
			y_pos,
			wall,
			way,
			box,
			destination,
			man,
			arrow_x,
			arrow_y,
			stage);
	input clk,win;
	input[9:0] x_pos,y_pos;
	input[63:0] wall,way,box,destination;
	input[5:0] man;
	input[11:0] arrow_x,arrow_y;
	input[1:0] stage;
	output[7:0] red,green,blue;
	wire req_0,req_1,req_2,req_3;
	wire 
	layer_top layer_top_inst(
		.sys_clk(clk),.ArrorPosY(arrow_y),.ArrorPosX(arrow_x),
		.y_pos(y_pos),.x_pos(x_pos),
		.RqFlag3(req_3),.Red3(Red3),.Blue3(Blue3),.Green3(Green3)
		);
	layer_mid_2 layer_mid_2_inst(
		.sys_clk(clk),.y_pos(y_pos),.x_pos(x_pos),.man(man),
		.RqFlag2(req_2),.Red2(Red2),.Blue2(Blue2),.Green2(Green2)
		);
	layer_mid_1 layer_mid_1_inst(
		.sys_clk(clk),.y_pos(y_pos),.x_pos(x_pos),
		.man(man),.box(box),.way(way),.wall(wall),.destination(destination),
		.RqFlag1(req_1),.Red1(Red1),.Blue1(Blue1),.Green1(Green1)
		);
	layer_bottom layer_bottom_inst(
		.sys_clk(clk),.y_pos(y_pos),.x_pos(x_pos),.stage(stage),.win(win),
		.RqFlag0(req_0),.Red0(Red0),.Blue0(Blue0),.Green0(Green0)
		);
	layer_sel layer_sel_inst(
		.RqFlag0(req_0),.Red0(Red0),.Blue0(Blue0),.Green0(Green0),
		.RqFlag1(req_1),.Red1(Red1),.Blue1(Blue1),.Green1(Green1),
		.RqFlag2(req_2),.Red2(Red2),.Blue2(Blue2),.Green2(Green2),
		.RqFlag3(req_3),.Red3(Red3),.Blue3(Blue3),.Green3(Green3),
		.Red(red),.Blue(blue),.Green(green)
		)
endmodule
