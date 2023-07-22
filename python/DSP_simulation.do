restart -nowave -force
add wave -radix unsigned *
force ena 1 0
force clk 0 0, 1 10 -r 20
force rst 1 0, 0 1

run 70000