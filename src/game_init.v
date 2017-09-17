//==================================================================================================
//  Filename      : game_init.v
//  Created On    : 2017-07-04 14:50:45
//  Last Modified : 2017-07-19 12:04:37
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
	output[133:0] game_state_int;
	reg[63:0] wall,destination;
	reg[133:0] game_state_int;
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
			2: begin
				wall=64'hFF9181838191FF00;
				destination=64'h0000181818000000;
				game_state_int={64'h006E5A545A6E0000,64'h0000242824000000,6'o46};
			end
			3: begin
				wall=64'hFF8189C34266243C;
				destination=64'h20101800;
				game_state_int={64'h7E46342C181800,64'h300810000000,6'o63};
			end
		endcase
	end
endmodule