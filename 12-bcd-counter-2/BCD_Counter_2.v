module BCD_Counter_2(
  input wire clk
  , input wire rst
  , output reg[6:0] Digit1
  , output reg[6:0] Digit2
);

integer d1_counter;
integer d2_counter;

initial begin
  d1_counter = 0;
  d2_counter = 0;
end

always @(posedge clk, negedge rst)
begin
  if(!rst) begin
    d1_counter <= 0;
	 d2_counter <= 0;
  end
  else begin
    if(d1_counter == 9) begin
      d1_counter <= 0;
		if(d2_counter == 9)
        d2_counter <= 0;
      else
        d2_counter <= d2_counter + 1;
    end
    else
      d1_counter <= d1_counter + 1;
  end
end

always @(d1_counter) begin
  case(d1_counter)
    0: Digit1 = 7'b1000000;
	 1: Digit1 = 7'b1111001;
	 2: Digit1 = 7'b0100100;
	 3: Digit1 = 7'b0110000;
	 4: Digit1 = 7'b0011001;
	 5: Digit1 = 7'b0010010;
	 6: Digit1 = 7'b0000010;
	 7: Digit1 = 7'b1111000;
	 8: Digit1 = 7'b0000000;
	 9: Digit1 = 7'b0010000;
	 default: Digit1 = 7'b1111111;
  endcase
end

always @(d2_counter) begin
  case(d2_counter)
    0: Digit2 = 7'b1111111;    //do not display
	 1: Digit2 = 7'b1111001;
	 2: Digit2 = 7'b0100100;
	 3: Digit2 = 7'b0110000;
	 4: Digit2 = 7'b0011001;
	 5: Digit2 = 7'b0010010;
	 6: Digit2 = 7'b0000010;
	 7: Digit2 = 7'b1111000;
	 8: Digit2 = 7'b0000000;
	 9: Digit2 = 7'b0010000;
	 default: Digit2 = 7'b1111111;
  endcase
end

endmodule