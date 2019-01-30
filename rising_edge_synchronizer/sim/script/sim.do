vlib work
vcom -93 -work work ../../src/rising_edge_synchronizer.vhd
vcom -93 -work work ../src/rising_edge_synchronizer_tb.vhd
vsim -novopt rising_edge_synchronizer_tb
do wave.do
run 300 ns
