#!/bin/bash

rm work-*.cf
rm *.vcd
ghdl -a *.vhdl
ghdl -e multiplier_testbench
ghdl -r multiplier_testbench --vcd=signal.vcd
gtkwave signal.vcd
