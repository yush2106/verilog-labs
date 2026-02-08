module ClockDivider(
  input wire clk
  , input wire rst
  , output reg clk_out
);

  reg[24:0] counter;
  
  //DE2-115 Clock 50Mhz
  //for 1s pulse, count to 25Mhz to reverse signal
  localparam max_count = 25_000_000 - 1;
  
  initial begin
    counter = 0;
  end
  
  always @(posedge clk, negedge rst)
  begin
	 if (!rst) begin
      counter <= 0;    //reset counter
      clk_out <= 0;    //set low position
    end
    else begin
      if(counter >= max_count) begin
		  counter <= 0;    //reset counter
		  clk_out <= ~clk_out;    //reverse signal
      end
		else  begin
		  counter <= counter + 1;    //add counter
		end
	 end
  end

endmodule