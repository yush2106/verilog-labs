module ALU_4 #(parameter width = 4)
(
  input wire[width-1:0] A
  , input wire[width-1:0] B
  , input wire[width-1:0] Sel
  , output reg[width-1:0] Y
  , output reg carry
  , output reg overflow
);

reg[width:0] temp = {(width+1){1'b0}};

always @(*)
begin
  carry = 1'b0;
  overflow = 1'b0;
  
  case(Sel)
    //add
    4'b0000: begin
      temp = {1'b0, A} + {1'b0, B};
      Y = temp[width-1:0];
      carry = temp[width];
      //when A and B both are positive, but Y is negative.
      //when A and B both are negative, but Y is positive.
      overflow = (~(A[width-1] ^ B[width-1])) & (A[width-1] ^ Y[width-1]);
    end
    //sub
    4'b0001: begin
      temp = {1'b0, A} - {1'b0, B};
      Y = temp[width-1:0];
      carry = temp[width];    //borrow
      //when A is positive and B is negative, but Y is negative.
      //when A is negative and B is positive, but Y is positive.
      overflow = (A[width-1] ^ B[width-1]) & (A[width-1] ^ Y[width-1]);
    end
    4'b0010: Y = A & B;    //and
    4'b0011: Y = A | B;    //or
    4'b0100: Y = A ^ B;    //xor
    4'b0101: Y = ~(A & B);    //not and
    4'b0110: Y = ~(A | B);    //not or
    4'b0111: Y = ~(A ^ B);    //not xor
    4'b1000: Y = ~A;    //not A
    4'b1001: Y = A << 1;    //shift left
    4'b1010: Y = A >> 1;    //shift right
    default: Y = {width{1'b0}};    //default value
  endcase
end
 
endmodule