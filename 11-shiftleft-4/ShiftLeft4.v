module ShiftLeft4(
  input wire d
  , input wire clk
  , input wire rst
  , output reg[3:0] y
);

parameter length = 4;
integer i;

initial
begin
  y = 4'b0000;
end

always @(posedge clk, negedge rst)
begin
  if(!rst) begin
    y = 4'b0000;    //reset output
  end
  else
    begin
      y[0] <= d;    //data input
      //shift left register
      for(i = 0; i < length-1; i=i+1)
        y[i+1] <= y[i];
    end
end

endmodule