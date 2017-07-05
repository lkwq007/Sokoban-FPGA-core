//==================================================================================================
//  Filename      : game_controller.v
//  Created On    : 2017-07-04 15:49:11
//  Last Modified : 2017-07-05 10:58:14
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
	parameter RESET=4`h0,INIT=4'h1,WAIT=4`h2,PAUSE=4`h3,OVER=4`h4,NEXT=4`h5,INTERIM=4`h6,RETRACT=4`h7,MOVE=4`h8;
	input clk,retry,retract,left,game_area,reset,right,move_result;
	input[5:0] cursor;
	input[63:0] destination;
	input[1:0] stage;
	input[134:0] game_state;
	output game_state_en,stage_up,win;
	reg game_state_en,stage_up,win;
	output[1:0] sel;
	reg[1:0] sel
	wire[63:0] way,box;
	assign way=game_state[133:70];
	reg[3:0] state;
	always @(posedge clk) begin
			if (reset||right) begin
				state=reset;
			end
			else begin
				state=state;
			end
			case(state)
				case RESET: begin
					sel=0;
					win=0;
					stage_up=0;
					game_state_en=1;
					state=INIT;
				end
				case INIT: begin
					sel=0;
					win=0;
					stage_up=0;
					game_state_en=1;
					state=WAIT;
				end
				case WAIT: begin
					sel=0;
					win=0;
					stage_up=0;
					game_state_en=0;
					if(box==destination) begin
						if(state==2) begin
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
				case PAUSE: begin
					sel=0;
					win=0;
					stage_up=0;
					game_state_en=0;
					if(left) begin
						state=NEXT;
					end
					else begin
						state=PAUSE;
					end
				end
				case NEXT: begin
					sel=0;
					win=0;
					stage_up=1;
					game_state_en=0;
					state=INIT;
				end
				case OVER: begin
					sel=0;
					win=1;
					stage_up=0;
					game_state_en=0;
					state=OVER;
				end
				case INTERIM: begin
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
				case RETRACT: begin
					sel=3;
					win=0;
					stage_up=0;
					game_state_en=1;
					state=WAIT;
				end
				case MOVE: begin
					sel=1;
					win=0;
					stage_up=0;
					game_state_en=1;
					state=WAIT;
				end
				default: begin
					sel=0;
					win=0;
					stage_up=0;
					game_state_en=0;
					state=RESET;
				end
			endcase
		end
endmodule