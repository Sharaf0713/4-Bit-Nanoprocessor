## Clock Signal
set_property PACKAGE_PIN W5 [get_ports {Clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {Clk}]
create_clock -period 10.000 -name sys_clk -waveform {0 5} [get_ports {Clk}]

## Reset Button
set_property PACKAGE_PIN T18 [get_ports {Res}]
set_property IOSTANDARD LVCMOS33 [get_ports {Res}]

## Output LEDs (Data_tb[3:0])
set_property PACKAGE_PIN U16 [get_ports {Data[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Data[0]}]

set_property PACKAGE_PIN E19 [get_ports {Data[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Data[1]}]

set_property PACKAGE_PIN U19 [get_ports {Data[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Data[2]}]

set_property PACKAGE_PIN V19 [get_ports {Data[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Data[3]}]

## Optional: Overflow and Zero flags to LEDs
set_property PACKAGE_PIN W19 [get_ports {Overflow}]
set_property IOSTANDARD LVCMOS33 [get_ports {Overflow}]

set_property PACKAGE_PIN U14 [get_ports {Zero}]
set_property IOSTANDARD LVCMOS33 [get_ports {Zero}]