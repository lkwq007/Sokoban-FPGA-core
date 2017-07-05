//==================================================================================================
//  Filename      : game_init.v
//  Created On    : 2017-07-04 14:50:45
//  Last Modified : 2017-07-05 09:48:53
//  Revision      : 
//  Author        : Lnyan
//  Company       : College of Information Science and Electronic Engineering, Zhejiang University
//  Email         : lkwq007@gmail.com or i@llonely.com
//
//  Description   : init the game stage, may use rom to improve this module
//
//
//==================================================================================================
module game_init(stage,wall,destination,game_state_int);
	// temporarily using the design described in the textbook, may using rom for improve
	input[1:0] stage;
	output[63:0] wall,destination;
	output[163:0] game_state_int;
	reg[63:0] wall,destination;
	reg[163:0] game_state_int;
	always @(*) begin
		case(stage)
			0: begin
				wall=64'h3828_2fe1_87f4_141c;
				destination=64'h0010_0002_4000_0800;
				game_state_int={64'h0010_001A_5008_0800,64'h0000_1004_2800_0000,3'o4,3'o4};
			end
			1: begin
				wall=64'h7e42_4246_6622_263c;
				destination=64'h003c_0400_0000_0000;
				game_state_int={64'h002c_3428_1014_1800,64'h0010_0810_0808_0000,3'o2,3'o2};
			end
			default: begin
				wall=64'h3828_2fe1_87f4_141c;
				destination=64'h0010_0002_4000_0800;
				game_state_int={64'h0010_001A_5008_0800,64'h0000_1004_2800_0000,3'o4,3'o4};
			end
		endcase
	end
endmodule