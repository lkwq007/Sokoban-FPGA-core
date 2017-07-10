//==================================================================================================
//  Filename      : game_controller.v
//  Created On    : 2017-07-04 15:49:11
//  Last Modified : 2017-07-10 11:28:52
//  Revision      : 
//  Author        : Lnyan
//  Company       : College of Information Science and Electronic Engineering, Zhejiang University
//  Email         : lkwq007@gmail.com or i@llonely.com
//
//  Description   : a tedious controller for this game
//
//
//==================================================================================================
module game_controller(clk,game_state,move_result,destination,cursor,retry,retract,left,game_area,reset,right,stage,stage_up,game_state_en,sel,win);
	parameter RESET=4'h0,INIT=4'h1,WAIT=4'h2,PAUSE=4'h3,OVER=4'h4,NEXT=4'h5,INTERIM=4'h6,RETRACT=4'h7,MOVE=4'h8;
	input clk,retry,retract,left,game_area,reset,right,move_result;
	input[5:0] cursor;
	input[63:0] destination;
	input[1:0] stage;
	input[133:0] game_state;
	output game_state_en,stage_up,win;
	output[1:0] sel;
	wire[63:0] way,box;
	assign way=game_state[133:70];
	assign box=game_state[69:6];
	reg[3:0] state=0;
	assign sel[0]=(state==RETRACT)||(state==MOVE);
	assign sel[1]=(state==RETRACT);
	assign game_state_en=(state==RESET)||(state==INIT)||(state==RETRACT)||(state==MOVE);
	assign stage_up=(state==NEXT);
	assign win=(state==OVER);
	always @(posedge clk) begin
			if (reset||right) begin
				state=RESET;
			end
			else begin
				case(state)
					RESET: begin
						state=INIT;
					end
					INIT: begin
						state=WAIT;
					end
					WAIT: begin
						if(box==destination) begin
							if(stage==2) begin
								state=OVER;
							end
							else begin
								state=PAUSE;
							end
						end
						else begin
							if(left) begin
								state=INTERIM;
							end
							else begin
								state=WAIT;
							end
						end
					end
					PAUSE: begin
						if(left) begin
							state=NEXT;
						end
						else begin
							state=PAUSE;
						end
					end
					NEXT: begin
						state=INIT;
					end
					OVER: begin
						state=OVER;
					end
					INTERIM: begin
						if(retry) begin
							state=INIT;
						end
						else if(retract) begin
							state=RETRACT;
						end
						else if(game_area&&move_result) begin
							state=MOVE;
						end
						else begin
							state=WAIT;
						end
					end
					RETRACT: begin
						state=WAIT;
					end
					MOVE: begin
						state=WAIT;
					end
					default: begin
						state=RESET;
					end
				endcase
			end
		end
endmodule