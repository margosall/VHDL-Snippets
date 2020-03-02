rm work-*.cf
rm signal.ghw

ghdl -a --ieee=synopsys encoder.vhd
ghdl -a --ieee=synopsys bcd_encoder_tb.vhd

ghdl -e --ieee=synopsys bcd_encoder_tb
ghdl -r --ieee=synopsys bcd_encoder_tb --wave=signal.ghw --stop-time=100ns
gtkwave signal.ghw
