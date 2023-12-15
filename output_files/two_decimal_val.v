module two_decimal_val (  //two_decimal_vals_w_neg
input [6:0]val,   //switches
output [6:0]ones,   ///7seg 1
output [6:0]tens    //7seg 10
);

reg [6:0] result_one_digit;  //4bit binary hex 1
reg [6:0] result_ten_digit;  //4bit binary hex 2
      



/* convert the binary value into 3 signals of negative, one and ten digit */
always @(*)
begin
	
		result_one_digit[6:0] = val % 10;
		result_ten_digit[6:0] = val / 10;
	 
	 //adder

	  

end
seven_segment lsb(result_one_digit, ones);
seven_segment msb(result_ten_digit, tens);


endmodule 