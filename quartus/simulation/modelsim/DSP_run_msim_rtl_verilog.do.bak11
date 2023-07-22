transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/REPO/SYF_PROJ/quartus {D:/REPO/SYF_PROJ/quartus/DSP.v}
vlog -vlog01compat -work work +incdir+D:/REPO/SYF_PROJ/quartus {D:/REPO/SYF_PROJ/quartus/MULTIPLIER.v}
vlog -vlog01compat -work work +incdir+D:/REPO/SYF_PROJ/quartus {D:/REPO/SYF_PROJ/quartus/ADDER.v}
vlog -vlog01compat -work work +incdir+D:/REPO/SYF_PROJ/quartus {D:/REPO/SYF_PROJ/quartus/SOLVER.v}
vlog -vlog01compat -work work +incdir+D:/REPO/SYF_PROJ/quartus {D:/REPO/SYF_PROJ/quartus/rom.v}

vlog -vlog01compat -work work +incdir+D:/REPO/SYF_PROJ/quartus {D:/REPO/SYF_PROJ/quartus/DSP_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  DSP_tb

add wave *
view structure
view signals
run -all
