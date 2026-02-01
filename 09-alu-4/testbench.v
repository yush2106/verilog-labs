`timescale 1ns/1ns

module testbench();
reg[3:0] a_in;
reg[3:0] b_in;
reg[3:0] sel_in;
wire[3:0] y_out;
wire carry_out;
wire overflow_out;

ALU_4 myUUT(
  .A(a_in)
  , .B(b_in)
  , .Sel(sel_in)
  , .Y(y_out)
  , .carry(carry_out)
  , .overflow(overflow_out)
);

initial
begin

a_in = 4'b0110;    //set a is 6
b_in = 4'b1011;    //set b value, unsigned type is 11, signed type is -5
sel_in = 4'b0000;    //add

#10;
sel_in = 4'b0001;    //sub

#10;
sel_in = 4'b0010;    //and

#10;
sel_in = 4'b0011;    //or

#10;
sel_in = 4'b0100;    //xor

#10;
sel_in = 4'b0101;    //not and

#10;
sel_in = 4'b0110;    //not or

#10;
sel_in = 4'b0111;    //not xor

#10;
sel_in = 4'b1000;    //not A

#10;
sel_in = 4'b1001;    //A shift left

#10;
sel_in = 4'b1010;    //A shift right

#10;

end

endmodule