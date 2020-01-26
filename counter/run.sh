#!/bin/bash
rm work-*.cf
rm *.vcd
ghdl -a --ieee=synopsys -fexplicit *.vhd
ghdl -e --ieee=synopsys -fexplicit counter_testbench
ghdl -r --ieee=synopsys -fexplicit counter_testbench --vcd=signal.vcd --stop-time=110ns
gtkwave signal.vcd

