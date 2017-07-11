//==================================================================================================
//  Filename      : game_retract_tb.v
//  Created On    : 2017-07-06 10:28:47
//  Last Modified : 2017-07-10 23:54:01
//  Revision      : 
//  Author        : Lnyan
//  Email         : lkwq007@gmail.com or i@llonely.com

//
//  Description   : 
//
//
//==================================================================================================
module game_retract_tb();
	reg clk=0,game_state_en;
	reg[1:0] sel;
	reg[133:0] game_state_int,game_state_bm,game_state_mm;
	wire[133:0] game_state;
	wire real_retract;
	game_retract uut(.clk(clk),.game_state(game_state),.game_state_int(game_state_int),.game_state_bm(game_state_bm),
						.game_state_mm(game_state_mm),.game_state_en(game_state_en),.sel(sel),.real_retract(real_retract));
	initial begin
		#10
		sel=0;
		game_state_int={6'd0,{128{1'b1}}};
		game_state_mm={6'd2,{128{1'b1}}};
		game_state_bm={6'd1,{128{1'b1}}};
		game_state_en=0;
		#10
		#10
		game_state_en=1;
		#10
		game_state_en=0;
		#10
		sel=1;
		game_state_en=1;
		#10
		game_state_en=0;
		#10
		game_state_en=1;
		sel=2;
		#10
		game_state_en=0;
		sel=1;
		#10
		game_state_mm={6'd4,{128{1'b1}}};
		game_state_bm={6'd3,{128{1'b1}}};
		game_state_en=1;
		#10
		game_state_en=0;
		#10
		sel=2;
		game_state_en=1;
		#10
		game_state_en=0;
		#10
		sel=3;
		game_state_en=1;
		#60
		sel=0;
		#20
		$finish;
	end
	always #5 clk=~clk;
endmodule