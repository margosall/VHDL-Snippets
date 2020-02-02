rm work-*.cf
rm signal.ghw

ghdl -a *.vhdl
ghdl -e fsm_test
ghdl -r fsm_test --wave=signal.ghw --stop-time=100ns
gtkwave signal.ghw
