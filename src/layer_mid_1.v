//==================================================================================================
//  Filename      : layer_mid_1.v
//  Created On    : 2017-07-06 09:26:40
//  Last Modified : 2017-07-09 22:37:23
//  Revision      : 
//  Author        : Lnyan
//  Company       : College of Information Science and Electronic Engineering, Zhejiang University
//  Email         : lkwq007@gmail.com or i@llonely.com
//
//  Description   : 
//
//
//==================================================================================================
module layer_mid_1(/*autoport*/
//output
			RqFlag1,
			Red1,
			Blue1,
			Green1,
//input
			clk,
			man,
			box,
			way,
			wall,
			destination,
			x_pos,
			y_pos);
	input clk;
	input[5:0] man;
	input[63:0] box,way,wall,destination; 
	input[9:0] x_pos,y_pos;
	output RqFlag1;
	output[7:0] Red1,Blue1,Green1;
	reg[7:0] Red1,Blue1,Green1;
	reg flag=0,mask=0;
	wire[11:0] addr;
	wire[9:0] x_offset,y_offset;
	wire[5:0] cursor;
	parameter TOP=10'd100,LEFT=10'd200,WIDTH=10'd64*8,HEIGHT=10'd64*8;
	assign x_offset=x_pos-LEFT;
	assign y_offset=y_pos-TOP;
	// assume 64*64 block
	assign addr={y_offset[5:0],x_offset[5:0]};
	assign cursor={y_offset[8:6],x_offset[8:6]};
	assign RqFlag1=mask&flag;
	wire rom_en;
	assign rom_en=(x_pos>=LEFT)&&(x_pos<LEFT+WIDTH)&&(y_pos>=TOP)&&(y_pos<TOP+HEIGHT);
	wire[7:0] box_dst_red,box_dst_blue,box_dst_green;
	wire[7:0] box_red,box_blue,box_green;
	wire[7:0] dst_red,dst_blue,dst_green;
	wire[7:0] way_red,way_blue,way_green;
	wire[7:0] wall_red,wall_blue,wall_green;
	always @(*) begin
		if(x_pos<LEFT||y_pos<TOP||x_pos>=LEFT+WIDTH||y_pos>=TOP+HEIGHT) begin
			mask<=0;
		end
		else begin
			mask<=1;
		end
		if(box[cursor]==1&&destination[cursor]==1) begin
			Red1<=box_dst_red;
			Blue1<=box_dst_blue;
			Green1<=box_dst_green;
			flag<=1;
		end
		else if(box[cursor]==1) begin
			Red1<=box_red;
			Blue1<=box_blue;
			Green1<=box_green;
			flag<=1;
		end
		else if(destination[cursor]==1) begin
			Red1<=dst_red;
			Blue1<=dst_blue;
			Green1<=dst_green;
			flag<=1;
		end
		else if(way[cursor]==1) begin
			Red1<=way_red;
			Blue1<=way_blue;
			Green1<=way_green;
			flag<=1;
		end
		else if(wall[cursor]==1) begin
			Red1<=wall_red;
			Blue1<=wall_blue;
			Green1<=wall_green;
			flag<=1;
		end
		else begin
			Red1<=0;
			Blue1<=0;
			Green1<=0;
			flag<=0;
		end
	end
	boxRom box_inst(
		.addr(addr),
		.clk(clk),
		.dout({box_red,box_blue,box_green}),
		.en(rom_en));
	dstRom dst_inst(
		.addr(addr),
		.clk(clk),
		.dout({dst_red,dst_blue,dst_green}),
		.en(rom_en));
	boxDstRom box_dst_inst(
		.addr(addr),
		.clk(clk),
		.dout({box_dst_red,box_dst_blue,box_dst_green}),
		.en(rom_en));
	wayRom way_inst(
		.addr(addr),
		.clk(clk),
		.dout({way_red,way_blue,way_green}),
		.en(rom_en));
	wallRom wall_inst(
		.addr(addr),
		.clk(clk),
		.dout({wall_red,wall_blue,wall_green}),
		.en(rom_en));
endmodule