transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/FPGA/verilog-labs/14-adder-4 {D:/FPGA/verilog-labs/14-adder-4/FullAdder4.v}

vlog -vlog01compat -work work +incdir+D:/FPGA/verilog-labs/14-adder-4 {D:/FPGA/verilog-labs/14-adder-4/testbench.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
