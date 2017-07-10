//==================================================================================================
//  Filename      : game_man_move_tb.v
//  Created On    : 2017-07-07 10:49:13
//  Last Modified : 2017-07-10 09:51:35
//  Revision      : 
//  Author        : Lnyan
//  Company       : College of Information Science and Electronic Engineering, Zhejiang University
//  Email         : lkwq007@gmail.com or i@llonely.com
//
//  Description   : normal testbench, I'll use cocotb instead
//
//
//==================================================================================================
`timescale 1ns / 1ps
module game_man_move_tb();
	parameter DELY=10; 
	reg[133:0] game_state;
	reg[5:0] cursor;
	wire result;
	wire[133:0] game_state_next;
	reg[133:0] temp;
	game_man_move uut(.game_state(game_state),.cursor(cursor),.game_state_next(game_state_next),.result(result));
	initial begin
		game_state={8'h00,{6{8'b00000110}},8'h00,{8{8'h00}},3'o1,3'o1};
		cursor=0;
		#(DELY)
		cursor={3'o2,3'o7};
		#(DELY)
		temp=game_state_next;
		#(DELY)
		game_state=temp;
		#(DELY)
		temp=game_state_next;
		#(DELY)
		game_state=temp;
		cursor={3'o0,3'o0};
		#(DELY)
		game_state=temp;
		#(DELY)
		temp=game_state_next;
		#(DELY)
		game_state=temp;
		#(DELY)
		game_state=temp;
		#(DELY)
		temp=game_state_next;
		#(DELY)
		game_state=temp;
		cursor={3'o0,3'o0};
		#(DELY)
		temp=game_state_next;
		#(DELY)
		game_state=temp;
		cursor={3'o7,3'o0};
		#(DELY)
		temp=game_state_next;
		#(DELY)
		game_state=temp;
		#(DELY)
		temp=game_state_next;
		#(DELY)
		game_state=temp;
		#(DELY)
		temp=game_state_next;
		#(DELY)
		game_state=temp;
		#(DELY)
		temp=game_state_next;
		#(DELY)
		game_state=temp;
		$stop;
		#(DELY)
		game_state={8'h00,{3{16'b0111111001010110}},8'h00,8'h00,{3{16'b0000000000101000}},8'h00,3'o1,3'o1};
		cursor=0;
		#(DELY)
		cursor={3'o2,3'o7};
		#(DELY)
		temp=game_state_next;
		#(DELY)
		game_state=temp;
		#(DELY)
		temp=game_state_next;
		#(DELY)
		game_state=temp;
		#(DELY)
		game_state=temp;
		#(DELY)
		temp=game_state_next;
		#(DELY)
		game_state=temp;
		#(DELY)
		game_state=temp;
		#(DELY)
		temp=game_state_next;
		#(DELY)
		game_state=temp;
		#(DELY)
		temp=game_state_next;
		#(DELY)
		game_state=temp;
		cursor={3'o7,3'o0};
		#(DELY)
		temp=game_state_next;
		#(DELY)
		game_state=temp;
		#(DELY)
		temp=game_state_next;
		#(DELY)
		game_state=temp;
		#(DELY)
		temp=game_state_next;
		#(DELY)
		game_state=temp;
		#(DELY)
		temp=game_state_next;
		#(DELY)
		game_state=temp;
		$stop;
	end
endmodule