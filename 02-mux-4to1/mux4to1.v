module mux4to1(i, s, y);
  input wire [3:0]i;    //input bit
  input wire [1:0]s;    //input select
  output wire y;    //output bit

  wire tmp_y0, tmp_y1;    //internal output
  //when s[0]=0, select i[0]. when s[0]=1, select i[1]
  mux2to1 mux_tmp0(.a(i[0]), .b(i[1]), .sel(s[0]), .c(tmp_y0));
  //when s[0]=0, select i[2]. when s[0]=1, select i[3]
  mux2to1 mux_tmp1(.a(i[2]), .b(i[3]), .sel(s[0]), .c(tmp_y1));
  //when s[1]=0, select tmp_y0. when s[1]=1, select tmp_y1
  mux2to1 mux_tmp2(.a(tmp_y0), .b(tmp_y1), .sel(s[1]), .c(y));
endmodule
