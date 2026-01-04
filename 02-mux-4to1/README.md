## MUX 4 to 1

This MUX 4 to 1 module chooses one of the 4 inputs, i[0] to i[3], by the two selections, s[0] and s[1].

![image](https://github.com/yush2106/verilog-labs/blob/main/02-mux-4to1/img/02-mux-4to1-01.jpg)

## Truth Table

| s[1] | s[0] | y |
|---|---|---|
| 0 | 0 | i[0] |
| 0 | 1 | i[1] |
| 1 | 0 | i[2] |
| 1 | 1 | i[3] |

## Process step

Step 1: MUX 2 to 1 module

```
module mux2to1(a, b, sel, c);
  input wire a, b, sel;    //input
  output wire c;    //output
  
  wire not_sel, and_s_a, and_s_b;    //wire
  //not gate sel
  not n_g_s(not_sel, sel);
  
  //and gate: not_sel, a for input, and_s_a for output
  and a_g_a(and_s_a, not_sel, a);
  //and gate: sel, b for input, and_s_b for output
  and a_g_b(and_s_b, sel, b);
  
  //or gate: and_s_a, and_s_b for input, c for output
  or o_g(c, and_s_a, and_s_b);
endmodule

```

Step 2: MUX 4 to 1 module

This MUX 4 to 1 module includes the MUX 2 to 1 module to send one of the 4 input bits by selections.

```
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

```

Step 3: Simulation

Set count value for i[0] to i[3] every 20ns.

![image](https://github.com/yush2106/verilog-labs/blob/main/02-mux-4to1/img/02-mux-4to1-02.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/02-mux-4to1/img/02-mux-4to1-03.jpg)

Set count value for s[0] and s[1] every 60ns.

![image](https://github.com/yush2106/verilog-labs/blob/main/02-mux-4to1/img/02-mux-4to1-04.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/02-mux-4to1/img/02-mux-4to1-05.jpg)

Run Functional Simulation.

![image](https://github.com/yush2106/verilog-labs/blob/main/02-mux-4to1/img/02-mux-4to1-06.jpg)

When s[0] is **0** and s[1] is **0**, output y is i[0].

When s[0] is **1** and s[1] is **0**, output y is i[1].

When s[0] is **0** and s[1] is **1**, output y is i[2].

When s[0] is **1** and s[1] is **1**, output y is i[3].

![image](https://github.com/yush2106/verilog-labs/blob/main/02-mux-4to1/img/02-mux-4to1-07.jpg)

Step 4: Hardware Emulation

Assign pins.

![image](https://github.com/yush2106/verilog-labs/blob/main/02-mux-4to1/img/02-mux-4to1-08.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/02-mux-4to1/img/02-mux-4to1-09.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/02-mux-4to1/img/02-mux-4to1-10.jpg)

When SW4 (s[0]) is 0 (off) and SW5 (s[1]) is 0 (off), output LEDR0 (y) value is SW0 (i[0]).

![image](https://github.com/yush2106/verilog-labs/blob/main/02-mux-4to1/img/02-mux-4to1-11.jpg)

When SW4 (s[0]) is 1 (on) and SW5 (s[1]) is 0 (off), output LEDR0 (y) value is SW1 (i[1]).

![image](https://github.com/yush2106/verilog-labs/blob/main/02-mux-4to1/img/02-mux-4to1-12.jpg)

When SW4 (s[0]) is 0 (off) and SW5 (s[1]) is 1 (on), output LEDR0 (y) value is SW2 (i[2]).

![image](https://github.com/yush2106/verilog-labs/blob/main/02-mux-4to1/img/02-mux-4to1-13.jpg)

When SW4 (s[0]) is 1 (on) and SW5 (s[1]) is 1 (on), output LEDR0 (y) value is SW3 (i[3]).

![image](https://github.com/yush2106/verilog-labs/blob/main/02-mux-4to1/img/02-mux-4to1-14.jpg)