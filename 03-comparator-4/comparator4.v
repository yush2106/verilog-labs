module comparator4(
  input wire [3:0] a
  , input wire [3:0] b
  , output reg [2:0] c
);

  always @(a or b) begin
    if(a > b)    //greater than
	   c = 3'b001;
	 else if (a == b)    //equal
	   c = 3'b010;
	 else    //less than
	   c = 3'b100;
  end
endmodule