//==================================================================================================
//  Filename      : layer_selv
//  Created On    : 2017-07-09 21:01:03
//  Last Modified : 2017-07-09 21:07:23
//  Revision      : 
//  Author        : Lnyan
//  Company       : College of Information Science and Electronic Engineering, Zhejiang University
//  Email         : lkwq007@gmailcom or i@llonelycom
//
//  Description   : 
//
//
//==================================================================================================
module layer_sel(/*autoport*/
//output
			Red,
			Blue,
			Green,
//input
			RqFlag0,
			Red0,
			Blue0,
			Green0,
			RqFlag1,
			Red1,
			Blue1,
			Green1,
			RqFlag2,
			Red2,
			Blue2,
			Green2,
			RqFlag3,
			Red3,
			Blue3,
			Green3);
	input RqFlag0,Red0,Blue0,Green0;
	input RqFlag1,Red1,Blue1,Green1;
	input RqFlag2,Red2,Blue2,Green2;
	input RqFlag3,Red3,Blue3,Green3;
	output Red,Blue,Green;
	always @(*) begin
		if(RqFlag3==1) begin
			Red<=Red3;
			Green<=Green3;
			Blue<=Blue3;
		end
		else if (RqFlag2==1) begin
			Red<=Red2;
			Green<=Green2;
			Blue<=Blue2;
		end
		else if (RqFlag1==1) begin
			Red<=Red1;
			Green<=Green1;
			Blue<=Blue1;
		end
		else begin
			Red<=Red0;
			Green<=Green0;
			Blue<=Blue0;			
		end
	end
endmodule