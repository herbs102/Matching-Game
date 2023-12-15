///////////////////////////////////////////
//         ECE 287 Final Project         //
//      By: Aidan Herb and John Mairn    //
//         Matching Game                 //
//       FPGA Board: DE2-115             //
///////////////////////////////////////////

module Match_Game(
input wire[17:0]SW,    //Start timer, match selector,
input [2:0]KEY,        //key0 is start
output reg [6:0]LEDG,  //Go signal
output reg [17:0]LEDR, //Patterns to match
output reg [6:0] HEX0, //Ones place for timer
output reg [6:0] HEX1, //Tens place for timer
output reg[6:0] HEX2,  //Placeholder
output reg [6:0] HEX3, //Placeholder
input wire CLOCK_50,
input wire reset,
output reg [3:0] hex_digit_ones, //Signal to 7seg
output reg [3:0] hex_digit_tens  //Signal to 7seg
);
    

always@(*)
begin
////////////////////////////////////////////////
////Define all match combinations (levels)//////
////////////////////////////////////////////////
	 LEDR[17] = SW[3]||SW[2];
	 LEDR[16] = SW[2]||SW[1];
	 LEDR[15] = SW[3];
	 LEDR[14] = SW[3]||SW[2]||SW[1];
	 LEDR[13] = SW[1];
	 LEDR[12] = SW[3];
	 LEDR[11] = SW[2]||SW[1];
	 LEDR[10] = SW[3]||SW[2];
	 LEDR[9] = SW[3]||SW[2];
	 LEDR[8] = SW[3];
	 LEDR[7] = SW[2]||SW[1];
	 LEDR[6] = SW[3];
	 LEDR[5] = SW[2];
	 LEDR[4] = SW[3]||SW[1];
	 
////////////////////////////////////////////
/////Define all match functionalities///////
////////////////////////////////////////////	 
	 if (SW[17])begin
	 LEDR[17]=1'b0;
	 end
	 if (SW[16])begin
	 LEDR[16]=1'b0;
	 end
	 if (SW[15])begin
	 LEDR[15]=1'b0;
	 end
	 if (SW[14])begin
	 LEDR[14]=1'b0;
	 end
	 if (SW[13])begin
	 LEDR[13]=1'b0;
	 end
	 if (SW[12])begin
	 LEDR[12]=1'b0;
	 end
	 if (SW[11])begin
	 LEDR[11]=1'b0;
	 end
	 if (SW[10])begin
	 LEDR[10]=1'b0;
	 end
	 if (SW[9])begin
	 LEDR[9]=1'b0;
	 end
	 if (SW[8])begin
	 LEDR[8]=1'b0;
	 end
	 if (SW[7])begin
	 LEDR[7]=1'b0;
	 end
	 if (SW[6])begin
	 LEDR[6]=1'b0;
	 end
	 if (SW[5])begin
	 LEDR[5]=1'b0;
	 end	 
	 if (SW[4])begin
	 LEDR[4]=1'b0;
	 end 
end
	  
	 reg [31:0] counter; //Variables for timer
	 reg [5:0] seconds;
	 
///////////////////////////////
////Pause timer function///////
///////////////////////////////	 
	 always @(posedge CLOCK_50 or posedge SW[0]) 
begin
	if (SW[0]) begin
	LEDG[6:0] = 7'b0000000;
	counter<= 0;
	seconds<= 6'b000000;
	hex_digit_ones <= 4'b0000;
	hex_digit_tens <= 4'b0000;
	HEX3 <= 7'b1111110;
	HEX2 <= 7'b1111110;
				  end 
///////////////////////////
///Timer count sequence////
///////////////////////////	
	else if (KEY[1] ) begin

	counter <= counter + 1;
	 
	 if(counter == 50000000) begin
		LEDG[6:0] = 7'b1111111;
		counter<= 0;
		seconds <= seconds + 1;
		hex_digit_ones <= seconds[3:0];
		hex_digit_ones <= seconds[5:4];
		
		end
		else if(seconds == 60)
		begin
		seconds <= 6'b000000;
		end
		hex_digit_ones <= seconds[3:0];
		hex_digit_tens <= seconds[5:4];
		
//////////////////////////////
///Display time to display////
//////////////////////////////		
case (hex_digit_ones)
	4'd0: HEX0 <= 7'b1000000;
	4'd1: HEX0 <= 7'b1111001;
	4'd2: HEX0 <= 7'b0100100;
	4'd3: HEX0 <= 7'b0110000;
	4'd4: HEX0 <= 7'b0011001;
	4'd5: HEX0 <= 7'b0010010;
	4'd6: HEX0 <= 7'b0000010;
	4'd7: HEX0 <= 7'b1111000;
	4'd8: HEX0 <= 7'b0000000;
	4'd9: HEX0 <= 7'b0010000;
	default: HEX0 <= 7'b1000000;
	endcase
	
	case (hex_digit_tens)
	4'd0: HEX1 <= 7'b1000000;
	4'd1: HEX1 <= 7'b1111001;
	4'd2: HEX1 <= 7'b0100100;
	4'd3: HEX1 <= 7'b0110000;
	4'd4: HEX1 <= 7'b0011001;
	4'd5: HEX1 <= 7'b0010010;
	4'd6: HEX1 <= 7'b0000010;
	4'd7: HEX1 <= 7'b1111000;
	4'd8: HEX1 <= 7'b0000000;
	4'd9: HEX1 <= 7'b0010000;
	default: HEX1 <= 7'b1000000;
	endcase
	
	end 
end

endmodule


