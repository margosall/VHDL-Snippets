ghdl -a *.vhdl
ghdl -e comparator_testbench
ghdl -r comparator_testbench --vcd=signal.vcd
gtkwave signal.vcd
