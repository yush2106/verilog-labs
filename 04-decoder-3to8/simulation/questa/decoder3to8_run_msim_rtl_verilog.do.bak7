transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog  -work work +incdir+D:/FPGA/verilog-labs/04-decoder-3to8 {D:/FPGA/verilog-labs/04-decoder-3to8/decoder3to8.v}

vlog  -work work +incdir+D:/FPGA/verilog-labs/04-decoder-3to8 {D:/FPGA/verilog-labs/04-decoder-3to8/testbench.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
