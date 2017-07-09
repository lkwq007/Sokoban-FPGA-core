//==================================================================================================
//  Filename      : top.v
//  Created On    : 2017-07-09 20:15:48
//  Last Modified : 2017-07-09 20:43:08
//  Revision      : 
//  Author        : Lnyan
//  Company       : College of Information Science and Electronic Engineering, Zhejiang University
//  Email         : lkwq007@gmail.com or i@llonely.com
//
//  Description   : top module for sokoban
//
//
//==================================================================================================
module top(clk,reset_n,red,green,blue,pixel_clk,vga_comp_synch,vga_blank_z,hsync,vsync,ps2_clk,ps2_data);
	input clk,reset_n;
	output[7:0] red,green,blue;
	output pixel_clk,vga_comp_synch,vga_blank_z,hsync,vsync,ps2_data,ps2_clk;
	wire reset;
	assign reset=~reset_n;
	
	wire sys_clk;
	dcm dcm_inst(.CLKIN_IN(clk),.CLKIN_OUT(clk),.CLKIN_IBUFG_OUT(),.CLK0_OUT(),.LOCKED_OUT());
	
	wire[10:0] arrow_x,arrow_y;
	wire[5:0] cursor;
	wire game_area,retract,retry,left,right;
	ps2_interface ps2(.clk(sys_clk),.reset(reset),.ps2_clk(ps2_clk),.ps2_data(ps2_data),
					  .ArrowPosX(arrow_x),.ArrowPosY(arrow_y),.cursor(cursor),.GameArea(game_area),
					  .retract(retract),.retry(retry),.left(left),.right(right));
	
	wire[63:0] wall,way,box,destination;
	wire[5:0] man;
	wire[1:0] stage;
	wire win;
	game_core sokoban(.clk(sys_clk),.game_area(game_area),.retract(retract),.retry(retry),
					  .left(left),.right(right),.wall(wall),.way(way),.box(box),
					  .destination(destination),.man(man),.stage(stage),.win(win),.reset(reset));

	wire[9:0] x_pos,y_pos;
	assign pixel_clk=sys_clk;
	display display_inst(.clk(sys_clk),.arrow_y(arrow_y),.arrow_x(arrow_x),.wall(wall),.way(way),
						 .box(box),.destination(destination),.man(man),.stage(stage),.win(win),
						 .x_pos(x_pos),.y_pos(y_pos));
	
endmodule