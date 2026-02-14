module DigitalClock(
  input wire clk
  , input wire rst
  , input wire add_minute
  , input wire subtract_minute
  , input wire add_hour
  , input wire subtract_hour
  , output reg[6:0] second_1
  , output reg[6:0] second_2
  , output reg[6:0] minute_1
  , output reg[6:0] minute_2
  , output reg[6:0] hour_1
  , output reg[6:0] hour_2
);

reg[1:0] hr_digit2;
reg[3:0] hr_digit1;
reg[2:0] min_digit2;
reg[3:0] min_digit1;
reg[2:0] sec_digit2;
reg[3:0] sec_digit1;

reg[25:0] counter;
reg clk_out;
  
//DE2-115 Clock 50MHz
//1s pulse
localparam max_count = 50_000_000 - 1;

always @(posedge clk, negedge rst) begin
  if (!rst) begin
    counter <= 0;    //reset counter
    clk_out <= 0;    //set low position
  end
  else begin
    if(counter >= max_count) begin
      counter <= 0;    //reset counter
      clk_out <= 1;
    end
    else begin
      counter <= counter + 1;    //add counter
      clk_out <= 0;
    end
  end
end

//decode 7 segment digit
function [6:0] DecodeDigit;
  input [3:0] num;
  begin
    case(num)
      4'd0: DecodeDigit = 7'b1000000;
      4'd1: DecodeDigit = 7'b1111001;
      4'd2: DecodeDigit = 7'b0100100;
      4'd3: DecodeDigit = 7'b0110000;
      4'd4: DecodeDigit = 7'b0011001;
      4'd5: DecodeDigit = 7'b0010010;
      4'd6: DecodeDigit = 7'b0000010;
      4'd7: DecodeDigit = 7'b1111000;
      4'd8: DecodeDigit = 7'b0000000;
      4'd9: DecodeDigit = 7'b0010000;
      default: DecodeDigit = 7'b1111111;
    endcase
  end
endfunction

reg add_minute_sync_0, add_minute_sync_1, add_minute_flag;

always @(posedge clk, negedge rst) begin
  if (!rst) begin
    add_minute_sync_0 <= 1'b1;
    add_minute_sync_1 <= 1'b1;
    add_minute_flag <= 1'b0;
  end else begin
    add_minute_sync_0 <= add_minute;
    add_minute_sync_1 <= add_minute_sync_0;
    add_minute_flag <= add_minute_sync_1 & ~add_minute_sync_0;
  end
end

reg sub_minute_sync_0, sub_minute_sync_1, sub_minute_flag;

always @(posedge clk, negedge rst) begin
  if (!rst) begin
    sub_minute_sync_0 <= 1'b1;
    sub_minute_sync_1 <= 1'b1;
    sub_minute_flag <= 1'b0;
  end else begin
    sub_minute_sync_0 <= subtract_minute;
    sub_minute_sync_1 <= sub_minute_sync_0;
    sub_minute_flag <= sub_minute_sync_1 & ~sub_minute_sync_0;
  end
end

reg add_hour_sync_0, add_hour_sync_1, add_hour_flag;

always @(posedge clk, negedge rst) begin
  if (!rst) begin
    add_hour_sync_0 <= 1'b1;
    add_hour_sync_1 <= 1'b1;
    add_hour_flag <= 1'b0;
  end else begin
    add_hour_sync_0 <= add_hour;
    add_hour_sync_1 <= add_hour_sync_0;
    add_hour_flag <= add_hour_sync_1 & ~add_hour_sync_0;
  end
end

reg sub_hour_sync_0, sub_hour_sync_1, sub_hour_flag;

always @(posedge clk, negedge rst) begin
  if (!rst) begin
    sub_hour_sync_0 <= 1'b1;
    sub_hour_sync_1 <= 1'b1;
    sub_hour_flag <= 1'b0;
  end else begin
    sub_hour_sync_0 <= subtract_hour;
    sub_hour_sync_1 <= sub_hour_sync_0;
    sub_hour_flag <= sub_hour_sync_1 & ~sub_hour_sync_0;
  end
end

always @(posedge clk, negedge rst) begin
  if(!rst) begin
    hr_digit2 <= 2'd1;
    hr_digit1 <= 4'd2;
    min_digit2 <= 3'd3;
    min_digit1 <= 4'd0;
    sec_digit2 <= 3'd4;
    sec_digit1 <= 4'd5;
  end
  else begin
    //add minute
    if(add_minute_flag) begin
      if(min_digit1 == 4'd9) begin
        min_digit1 <= 4'd0;
        if(min_digit2 == 3'd5)
          min_digit2 <= 3'd0;
        else
          min_digit2 <= min_digit2 + 3'd1;
      end
      else
        min_digit1 <= min_digit1 + 4'd1;
    end
    //subtract minute
    else if(sub_minute_flag) begin
      if(min_digit1 == 4'd0) begin
        min_digit1 <= 4'd9;
        if(min_digit2 == 3'd0)
          min_digit2 <= 3'd5;
        else
          min_digit2 <= min_digit2 - 3'd1;
      end
      else
        min_digit1 <= min_digit1 - 4'd1;
    end
    //add hour
    else if(add_hour_flag) begin
      if(hr_digit2 == 2'd2 && hr_digit1 == 4'd3) begin
        hr_digit2 <= 2'd0;
        hr_digit1 <= 4'd0;
      end
      else begin
        if(hr_digit1 == 4'd9) begin
          hr_digit1 <= 4'd0;
          hr_digit2 <= hr_digit2 + 2'd1;
        end
        else
          hr_digit1 <= hr_digit1 + 4'd1;
      end
    end
    //subtract hour
    else if(sub_hour_flag) begin
      if(hr_digit2 == 2'd0 && hr_digit1 == 4'd0) begin
        hr_digit2 <= 2'd2;
        hr_digit1 <= 4'd3;
      end
      else begin
        if(hr_digit1 == 4'd0) begin
          hr_digit1 <= 4'd9;
          hr_digit2 <= hr_digit2 - 2'd1;
        end
        else
          hr_digit1 <= hr_digit1 - 4'd1;
      end
    end
	 //add digit numbers every second
    if(clk_out) begin
      if(sec_digit1 == 4'd9) begin
        sec_digit1 <= 4'd0;
        if(sec_digit2 == 3'd5) begin
          sec_digit2 <= 3'd0;
          if(min_digit1 == 4'd9) begin
            min_digit1 <= 4'd0;
            if(min_digit2 == 3'd5) begin
              min_digit2 <= 3'd0;
              if(hr_digit2 == 2'd2 && hr_digit1 == 4'd3) begin
                hr_digit2 <= 2'd0;
                hr_digit1 <= 4'd0;
              end
              else if(hr_digit2 != 2'd2 && hr_digit1 == 4'd9) begin
                hr_digit1 <= 4'd0;
                hr_digit2 <= hr_digit2 + 2'd1;
              end
              else
                hr_digit1 <= hr_digit1 + 4'd1;
            end
            else
              min_digit2 <= min_digit2 + 3'd1;
          end
          else
            min_digit1 <= min_digit1 + 4'd1;
        end
        else
          sec_digit2 <= sec_digit2 + 3'd1;
      end
      else
          sec_digit1 <= sec_digit1 + 4'd1;
	 end
	 
	 //hr_digit2
    hour_2 = DecodeDigit(hr_digit2);
    //hr_digit1
    hour_1 = DecodeDigit(hr_digit1);
    //min_digit2
    minute_2 = DecodeDigit(min_digit2);
    //min_digit1
    minute_1 = DecodeDigit(min_digit1);
    //sec_digit2
    second_2 = DecodeDigit(sec_digit2);
    //sec_digit1
    second_1 = DecodeDigit(sec_digit1);
  end
end

endmodule