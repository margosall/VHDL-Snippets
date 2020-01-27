#!/bin/bash
rm work-*.cf
rm *.vcd
ghdl -a --ieee=synopsys -fexplicit *.vhd
# ghdl -a --ieee=synopsys -fexplicit *.vhdl

ghdl -e --ieee=synopsys -fexplicit rom_testbench
ghdl -r --ieee=synopsys -fexplicit rom_testbench --vcd=signal.vcd --stop-time=100ns
gtkwave signal.vcd

