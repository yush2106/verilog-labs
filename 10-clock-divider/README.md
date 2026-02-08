## Clock Divider

The Altera DE2-115 development board has a 50Mhz clock.

In this project, convert 50Mhz clock to 2Hz output clock (two pulse per second).

![image](https://github.com/yush2106/verilog-labs/blob/main/10-clock-divider/img/10-clock-divider-01.jpg)

## Process Step

Step 1: Clock Divider

```
module ClockDivider(
  input wire clk
  , input wire rst
  , output reg clk_out
);

  reg[23:0] counter;
  
  //DE2-115 Clock 50Mhz
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
```

Step 2: Block Diagram

Set CLOCK_50 (50Mhz) for input clock, KEY[0] for reset, and LEDG[0] for output clock.

![image](https://github.com/yush2106/verilog-labs/blob/main/10-clock-divider/img/10-clock-divider-02.jpg)

Step 3: Hardware Emulation

The LEDG[0] flash 2 times per second (2Hz).

When KEY0 is clicked, LEDG[0] will be turned off.

![image](https://github.com/yush2106/verilog-labs/blob/main/10-clock-divider/img/10-clock-divider-03.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/10-clock-divider/img/10-clock-divider-04.jpg)