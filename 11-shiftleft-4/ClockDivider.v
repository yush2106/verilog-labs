module ClockDivider(
  input wire clk
  , input wire rst
  , output reg clk_out
);

  reg[23:0] counter;
  
  //DE2-115 Clock 50MHz
  //for 0.5s pulse, count to 12.5Mhz to reverse signal
  localparam max_count = 12_500_000 - 1;
  
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