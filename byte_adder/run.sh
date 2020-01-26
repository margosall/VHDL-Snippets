#!/bin/bash
ghdl -a *.vhd
ghdl -e byte_adder_testbench
ghdl -r byte_adder_testbench --vcd=adder.vcd
gtkwave adder.vcd
