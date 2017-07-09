//==================================================================================================
//  Filename      : layer_mid_2.v
//  Created On    : 2017-07-06 09:26:43
//  Last Modified : 2017-07-09 22:48:28
//  Revision      : 
//  Author        : Lnyan
//  Company       : College of Information Science and Electronic Engineering, Zhejiang University
//  Email         : lkwq007@gmail.com or i@llonely.com
//
//  Description   : 
//
//
//==================================================================================================
module layer_mid_2(/*autoport*/
//output
			RqFlag2,
			Red2,
			Blue2,
			Green2,
//input
			clk,
			x_pos,
			y_pos,
			man);
	parameter TOP=10'd100,LEFT=10'd200,WIDTH=10'd64*8,HEIGHT=10'd64*8;
	input clk;
	input[9:0] x_pos,y_pos;
	input[5:0] man;
	output RqFlag2;
	reg RqFlag2=0;
	output[7:0] Red2,Blue2,Green2;
	reg[7:0] Red2,Blue2,Green2;
	wire rom_en;
	assign rom_en=(x_pos>=LEFT)&&(x_pos<LEFT+WIDTH)&&(y_pos>=TOP)&&(y_pos<TOP+HEIGHT);
	assign x_offset=x_pos-LEFT;
	assign y_offset=y_pos-TOP;
	// assume 64*64 block
	assign addr={y_offset[5:0],x_offset[5:0]};
	assign cursor={y_offset[8:6],x_offset[8:6]};
	always @(*) begin
		if(rom_en&&cursor==man&&man_red~=8'hff&&man_green~=8'hff&&man_blue~=8'hcc) begin
			Red2<=man_red;
			Blue2<=man_blue;
			Green2<=man_green;
			RqFlag2<=1;
		end
		else begin
			Red2<=0;
			Blue2<=0;
			Green2<=0;
			RqFlag2<=0;
		end
	end
	manRom man_inst(
		.addr(addr),
		.clk(clk),
		.dout({man_red,man_blue,man_green}),
		.en(rom_en));
endmodule