# System Clock (50 MHz)
set_property IOSTANDARD LVCMOS33 [get_ports {clk_50MHz}]
set_property LOC E3 [get_ports {clk_50MHz}]

# Set I/O Standard and Location for note_select ports (SW0 to SW15 for C Major scale)

# S0: C3
set_property IOSTANDARD LVCMOS33 [get_ports {note_select[0]}]
set_property LOC J15 [get_ports {note_select[0]}]

# S1: D3
set_property IOSTANDARD LVCMOS33 [get_ports {note_select[1]}]
set_property LOC L16 [get_ports {note_select[1]}]

# S2: E3
set_property IOSTANDARD LVCMOS33 [get_ports {note_select[2]}]
set_property LOC M13 [get_ports {note_select[2]}]

# S3: F3
set_property IOSTANDARD LVCMOS33 [get_ports {note_select[3]}]
set_property LOC R15 [get_ports {note_select[3]}]

# S4: G3
set_property IOSTANDARD LVCMOS33 [get_ports {note_select[4]}]
set_property LOC R17 [get_ports {note_select[4]}]

# S5: A3
set_property IOSTANDARD LVCMOS33 [get_ports {note_select[5]}]
set_property LOC T18 [get_ports {note_select[5]}]

# S6: B3
set_property IOSTANDARD LVCMOS33 [get_ports {note_select[6]}]
set_property LOC U18 [get_ports {note_select[6]}]

# S7: C4
set_property IOSTANDARD LVCMOS33 [get_ports {note_select[7]}]
set_property LOC R13 [get_ports {note_select[7]}]

# S8: D4
set_property IOSTANDARD LVCMOS33 [get_ports {note_select[8]}]
set_property LOC T8 [get_ports {note_select[8]}]

# S9: E4
set_property IOSTANDARD LVCMOS33 [get_ports {note_select[9]}]
set_property LOC U8 [get_ports {note_select[9]}]

# S10: F4
set_property IOSTANDARD LVCMOS33 [get_ports {note_select[10]}]
set_property LOC R16 [get_ports {note_select[10]}]

# S11: G4
set_property IOSTANDARD LVCMOS33 [get_ports {note_select[11]}]
set_property LOC T13 [get_ports {note_select[11]}]

# S12: A4
set_property IOSTANDARD LVCMOS33 [get_ports {note_select[12]}]
set_property LOC H6 [get_ports {note_select[12]}]

# S13: B4
set_property IOSTANDARD LVCMOS33 [get_ports {note_select[13]}]
set_property LOC U12 [get_ports {note_select[13]}]

# S14: C5
set_property IOSTANDARD LVCMOS33 [get_ports {note_select[14]}]
set_property LOC U11 [get_ports {note_select[14]}]

# S15: D5
set_property IOSTANDARD LVCMOS33 [get_ports {note_select[15]}]
set_property LOC V10 [get_ports {note_select[15]}]

# Set I/O Standard and Location for gate signal (connected to BTN C)
set_property IOSTANDARD LVCMOS33 [get_ports {gate}]
set_property LOC V17 [get_ports {gate}]

# Onboard Mono Audio Output (PWM Audio Output on Nexys A7 Board)

# Audio Output (AUDIO_PWM)
set_property IOSTANDARD LVCMOS33 [get_ports {audio_out}]
set_property LOC A14 [get_ports {audio_out}]

# LED Assignments for Debugging (Observe Internal Signals)

# LED1: Monitor SCLK
set_property IOSTANDARD LVCMOS33 [get_ports {led1}]
set_property LOC M14 [get_ports {led1}]  # Updated to LED0 pin

# LED2: Monitor LRCK
set_property IOSTANDARD LVCMOS33 [get_ports {led2}]
set_property LOC N14 [get_ports {led2}]  # Updated to LED1 pin

# LED3: Monitor SDATA
set_property IOSTANDARD LVCMOS33 [get_ports {led3}]
set_property LOC L14 [get_ports {led3}]  # Updated to LED2 pin

# Configuration Settings
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]