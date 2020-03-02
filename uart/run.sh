rm work-*.cf
rm signal.ghw

ghdl -a --ieee=synopsys -fexplicit *.vhd
ghdl -e --ieee=synopsys -fexplicit uart_tb
ghdl -r --ieee=synopsys -fexplicit uart_tb --wave=signal.ghw --stop-time=7800us
gtkwave signal.ghw
