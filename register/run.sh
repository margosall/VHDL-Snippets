#!/bin/bash
rm work-*.cf
rm *.vcd
ghdl -a *.vhd
ghdl -e register_testbench
ghdl -r register_testbench --vcd=signal.vcd --stop-time=20ns
gtkwave signal.vcd
