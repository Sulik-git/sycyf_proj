restart -nowave -force
add wave -radix unsigned *

force -freeze sim:/DSP/ena 1 0
force clk 0 0, 1 20 -r 40
force rst 1 0, 0 1
run 21280000