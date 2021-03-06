//==================================================================================================
//  Filename      : game_core.v
//  Created On    : 2017-07-04 14:33:01
//  Last Modified : 2017-07-11 00:35:35
//  Revision      : 
//  Author        : Lnyan
//  Company       : College of Information Science and Electronic Engineering, Zhejiang University
//  Email         : lkwq007@gmail.com
//
//  Description   : The core module for game progress control
//
//
//==================================================================================================
module game_core(/*autoport*/
//output
           win,
           stage,
           man,
           wall,
           destination,
           box,
           way,
           step,
//input
           clk,
           game_area,
           retract,
           retry,
           left,
           right,
           reset,
           cursor);
	input clk,game_area,retract,retry,left,right,reset;
    input[5:0] cursor;
    output win;
    output[1:0] stage;
    output[5:0] man;
    output[63:0] wall,destination,box,way;
    output[7:0] step;
    wire game_state_en,stage_up,win,move_result,rst;
    wire[133:0] game_state,game_state_int,game_state_next;
    wire[1:0] sel;
    wire real_retract;

    assign way=game_state[133:70];
    assign box=game_state[69:6];
    assign man=game_state[5:0];
    assign rst=reset|right;
    wire step_inc,step_dec;
    
    game_controller controller(
        .clk(clk),.game_state(game_state),.move_result(move_result),
        .destination(destination),.cursor(cursor),.retry(retry),.retract(retract),
        .left(left),.game_area(game_area),.reset(reset),.right(right),.stage(stage),
        .stage_up(stage_up),.game_state_en(game_state_en),.sel(sel),.win(win),
        .real_retract(real_retract),.step_inc(step_inc),.step_dec(step_dec));
	
	game_man_move move_next(.game_state(game_state),.cursor(cursor),.game_state_next(game_state_next),.result(move_result));

	game_stage_counter stage_counter(.clk(clk),.en(stage_up),.rst(rst),.q(stage));

	game_init init(.stage(stage),.wall(wall),.destination(destination),.game_state_int(game_state_int));

	game_retract retracter(
        .clk(clk),.game_state(game_state),
        .game_state_int(game_state_int),.game_state_bm(game_state_next),.game_state_mm(game_state_next),
        .game_state_en(game_state_en),.sel(sel),.real_retract(real_retract));

    game_step_counter step_counter(.clk(clk),.inc(step_inc),.dec(step_dec),.rst(rst|retry),.q(step));

endmodule