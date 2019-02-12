vlib work
vcom -93 -work work ../../src/blink.vhd
vcom -93 -work work ../src/blink_tb.vhd
vsim -voptargs=+acc blink_tb
do wave.do
run 500 ns
