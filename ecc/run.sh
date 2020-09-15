rm work-*.cf
rm signal.ghw

ghdl -a *.vhd
ghdl -e ecc_tb
ghdl -r ecc_tb --wave=signal.ghw
gtkwave signal.ghw