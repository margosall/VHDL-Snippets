rm work-*.cf
rm signal.ghw

ghdl -a *.vhdl
ghdl -r ram_testbench --wave=signal.ghw --stop-time=90ns
gtkwave signal.ghw
