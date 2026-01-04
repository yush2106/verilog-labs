module mux2to1(a, b, sel, c);
  input wire a, b, sel;    //input
  output wire c;    //output
  
  wire not_sel, and_s_a, and_s_b;    //wire
  //not sel
  not n_g_s(not_sel, sel);
  
  //and gate: not_sel, a for input, and_s_a for output
  and a_g_a(and_s_a, not_sel, a);
  //and gate: sel, b for input, and_s_b for output
  and a_g_b(and_s_b, sel, b);
  
  //or gate: and_s_a, and_s_b for input, c for output
  or o_g(c, and_s_a, and_s_b);
endmodule
