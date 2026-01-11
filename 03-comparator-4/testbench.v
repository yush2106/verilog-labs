`timescale 1ns/1ns

module testbench;
  reg [3:0] a_in;
  reg [3:0] b_in;
  wire [2:0] c_out;

  //comparator 4 bits
  comparator4 MyComparator(
    .a(a_in)
	 , .b(b_in)
	 , .c(c_out)
  );
  
  initial
  begin
    a_in = 4'b0000;
	 b_in = 4'b0000;
  
    #10;    //time 10
	 a_in = 4'b0001;
	 b_in = 4'b0000;
	 
	 #10;    //time 20
	 a_in = 4'b0000;
	 b_in = 4'b0001;
	 
	 #10;    //time 30
	 a_in = 4'b1010;
	 b_in = 4'b1010;
	 
	 #10;    //time 40
  end
endmodule