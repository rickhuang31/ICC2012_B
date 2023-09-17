###################################################################

# Created by write_sdc on Thu Sep 14 23:42:39 2023

###################################################################
set sdc_version 1.5
current_design CHIP

set_load -pin_load 1 [get_ports O_done]
set_load -pin_load 1 [get_ports {IO_F_IO_A[7]}]
set_load -pin_load 1 [get_ports {IO_F_IO_A[6]}]
set_load -pin_load 1 [get_ports {IO_F_IO_A[5]}]
set_load -pin_load 1 [get_ports {IO_F_IO_A[4]}]
set_load -pin_load 1 [get_ports {IO_F_IO_A[3]}]
set_load -pin_load 1 [get_ports {IO_F_IO_A[2]}]
set_load -pin_load 1 [get_ports {IO_F_IO_A[1]}]
set_load -pin_load 1 [get_ports {IO_F_IO_A[0]}]
set_load -pin_load 1 [get_ports O_F_CLE_A]
set_load -pin_load 1 [get_ports O_F_ALE_A]
set_load -pin_load 1 [get_ports O_F_REN_A]
set_load -pin_load 1 [get_ports O_F_WEN_A]
set_load -pin_load 1 [get_ports {IO_F_IO_B[7]}]
set_load -pin_load 1 [get_ports {IO_F_IO_B[6]}]
set_load -pin_load 1 [get_ports {IO_F_IO_B[5]}]
set_load -pin_load 1 [get_ports {IO_F_IO_B[4]}]
set_load -pin_load 1 [get_ports {IO_F_IO_B[3]}]
set_load -pin_load 1 [get_ports {IO_F_IO_B[2]}]
set_load -pin_load 1 [get_ports {IO_F_IO_B[1]}]
set_load -pin_load 1 [get_ports {IO_F_IO_B[0]}]
set_load -pin_load 1 [get_ports O_F_CLE_B]
set_load -pin_load 1 [get_ports O_F_ALE_B]
set_load -pin_load 1 [get_ports O_F_REN_B]
set_load -pin_load 1 [get_ports O_F_WEN_B]
create_clock [get_ports I_clk] -name clk -period 20  -waveform {10 20}
set_clock_latency 1  [get_clocks clk]
set_input_delay -clock clk  -max 1  [get_ports I_clk]
set_input_delay -clock clk  -min 0.2  [get_ports I_clk]
set_input_delay -clock clk  -max 1  [get_ports {IO_F_IO_A[6]}]
set_input_delay -clock clk  -min 0.2  [get_ports {IO_F_IO_A[6]}]
set_input_delay -clock clk  -max 1  [get_ports {IO_F_IO_B[7]}]
set_input_delay -clock clk  -min 0.2  [get_ports {IO_F_IO_B[7]}]
set_input_delay -clock clk  -max 1  [get_ports {IO_F_IO_B[2]}]
set_input_delay -clock clk  -min 0.2  [get_ports {IO_F_IO_B[2]}]
set_input_delay -clock clk  -max 1  [get_ports {I_KEY[0]}]
set_input_delay -clock clk  -min 0.2  [get_ports {I_KEY[0]}]
set_input_delay -clock clk  -max 1  [get_ports {IO_F_IO_B[4]}]
set_input_delay -clock clk  -min 0.2  [get_ports {IO_F_IO_B[4]}]
set_input_delay -clock clk  -max 1  [get_ports {IO_F_IO_B[6]}]
set_input_delay -clock clk  -min 0.2  [get_ports {IO_F_IO_B[6]}]
set_input_delay -clock clk  -max 1  [get_ports {IO_F_IO_A[1]}]
set_input_delay -clock clk  -min 0.2  [get_ports {IO_F_IO_A[1]}]
set_input_delay -clock clk  -max 1  [get_ports {I_KEY[3]}]
set_input_delay -clock clk  -min 0.2  [get_ports {I_KEY[3]}]
set_input_delay -clock clk  -max 1  [get_ports {IO_F_IO_A[3]}]
set_input_delay -clock clk  -min 0.2  [get_ports {IO_F_IO_A[3]}]
set_input_delay -clock clk  -max 1  [get_ports {I_KEY[1]}]
set_input_delay -clock clk  -min 0.2  [get_ports {I_KEY[1]}]
set_input_delay -clock clk  -max 1  [get_ports {IO_F_IO_A[5]}]
set_input_delay -clock clk  -min 0.2  [get_ports {IO_F_IO_A[5]}]
set_input_delay -clock clk  -max 1  [get_ports I_rst]
set_input_delay -clock clk  -min 0.2  [get_ports I_rst]
set_input_delay -clock clk  -max 1  [get_ports I_F_RB_A]
set_input_delay -clock clk  -min 0.2  [get_ports I_F_RB_A]
set_input_delay -clock clk  -max 1  [get_ports {IO_F_IO_A[0]}]
set_input_delay -clock clk  -min 0.2  [get_ports {IO_F_IO_A[0]}]
set_input_delay -clock clk  -max 1  [get_ports I_F_RB_B]
set_input_delay -clock clk  -min 0.2  [get_ports I_F_RB_B]
set_input_delay -clock clk  -max 1  [get_ports {IO_F_IO_B[1]}]
set_input_delay -clock clk  -min 0.2  [get_ports {IO_F_IO_B[1]}]
set_input_delay -clock clk  -max 1  [get_ports {IO_F_IO_A[7]}]
set_input_delay -clock clk  -min 0.2  [get_ports {IO_F_IO_A[7]}]
set_input_delay -clock clk  -max 1  [get_ports {IO_F_IO_B[3]}]
set_input_delay -clock clk  -min 0.2  [get_ports {IO_F_IO_B[3]}]
set_input_delay -clock clk  -max 1  [get_ports {IO_F_IO_A[2]}]
set_input_delay -clock clk  -min 0.2  [get_ports {IO_F_IO_A[2]}]
set_input_delay -clock clk  -max 1  [get_ports {IO_F_IO_A[4]}]
set_input_delay -clock clk  -min 0.2  [get_ports {IO_F_IO_A[4]}]
set_input_delay -clock clk  -max 1  [get_ports {IO_F_IO_B[5]}]
set_input_delay -clock clk  -min 0.2  [get_ports {IO_F_IO_B[5]}]
set_input_delay -clock clk  -max 1  [get_ports {IO_F_IO_B[0]}]
set_input_delay -clock clk  -min 0.2  [get_ports {IO_F_IO_B[0]}]
set_input_delay -clock clk  -max 1  [get_ports {I_KEY[2]}]
set_input_delay -clock clk  -min 0.2  [get_ports {I_KEY[2]}]
set_output_delay -clock clk  -max 1  [get_ports {IO_F_IO_A[6]}]
set_output_delay -clock clk  -min 0.1  [get_ports {IO_F_IO_A[6]}]
set_output_delay -clock clk  -max 1  [get_ports {IO_F_IO_B[7]}]
set_output_delay -clock clk  -min 0.1  [get_ports {IO_F_IO_B[7]}]
set_output_delay -clock clk  -max 1  [get_ports {IO_F_IO_B[2]}]
set_output_delay -clock clk  -min 0.1  [get_ports {IO_F_IO_B[2]}]
set_output_delay -clock clk  -max 1  [get_ports {IO_F_IO_B[4]}]
set_output_delay -clock clk  -min 0.1  [get_ports {IO_F_IO_B[4]}]
set_output_delay -clock clk  -max 1  [get_ports {IO_F_IO_B[6]}]
set_output_delay -clock clk  -min 0.1  [get_ports {IO_F_IO_B[6]}]
set_output_delay -clock clk  -max 1  [get_ports {IO_F_IO_A[1]}]
set_output_delay -clock clk  -min 0.1  [get_ports {IO_F_IO_A[1]}]
set_output_delay -clock clk  -max 1  [get_ports {IO_F_IO_A[3]}]
set_output_delay -clock clk  -min 0.1  [get_ports {IO_F_IO_A[3]}]
set_output_delay -clock clk  -max 1  [get_ports {IO_F_IO_A[5]}]
set_output_delay -clock clk  -min 0.1  [get_ports {IO_F_IO_A[5]}]
set_output_delay -clock clk  -max 1  [get_ports {IO_F_IO_A[0]}]
set_output_delay -clock clk  -min 0.1  [get_ports {IO_F_IO_A[0]}]
set_output_delay -clock clk  -max 1  [get_ports {IO_F_IO_B[1]}]
set_output_delay -clock clk  -min 0.1  [get_ports {IO_F_IO_B[1]}]
set_output_delay -clock clk  -max 1  [get_ports {IO_F_IO_A[7]}]
set_output_delay -clock clk  -min 0.1  [get_ports {IO_F_IO_A[7]}]
set_output_delay -clock clk  -max 1  [get_ports {IO_F_IO_B[3]}]
set_output_delay -clock clk  -min 0.1  [get_ports {IO_F_IO_B[3]}]
set_output_delay -clock clk  -max 1  [get_ports {IO_F_IO_A[2]}]
set_output_delay -clock clk  -min 0.1  [get_ports {IO_F_IO_A[2]}]
set_output_delay -clock clk  -max 1  [get_ports {IO_F_IO_A[4]}]
set_output_delay -clock clk  -min 0.1  [get_ports {IO_F_IO_A[4]}]
set_output_delay -clock clk  -max 1  [get_ports {IO_F_IO_B[5]}]
set_output_delay -clock clk  -min 0.1  [get_ports {IO_F_IO_B[5]}]
set_output_delay -clock clk  -max 1  [get_ports {IO_F_IO_B[0]}]
set_output_delay -clock clk  -min 0.1  [get_ports {IO_F_IO_B[0]}]
set_output_delay -clock clk  -max 1  [get_ports O_F_WEN_B]
set_output_delay -clock clk  -min 0.1  [get_ports O_F_WEN_B]
set_output_delay -clock clk  -max 1  [get_ports O_F_ALE_A]
set_output_delay -clock clk  -min 0.1  [get_ports O_F_ALE_A]
set_output_delay -clock clk  -max 1  [get_ports O_F_ALE_B]
set_output_delay -clock clk  -min 0.1  [get_ports O_F_ALE_B]
set_output_delay -clock clk  -max 1  [get_ports O_done]
set_output_delay -clock clk  -min 0.1  [get_ports O_done]
set_output_delay -clock clk  -max 1  [get_ports O_F_CLE_A]
set_output_delay -clock clk  -min 0.1  [get_ports O_F_CLE_A]
set_output_delay -clock clk  -max 1  [get_ports O_F_REN_A]
set_output_delay -clock clk  -min 0.1  [get_ports O_F_REN_A]
set_output_delay -clock clk  -max 1  [get_ports O_F_CLE_B]
set_output_delay -clock clk  -min 0.1  [get_ports O_F_CLE_B]
set_output_delay -clock clk  -max 1  [get_ports O_F_REN_B]
set_output_delay -clock clk  -min 0.1  [get_ports O_F_REN_B]
set_output_delay -clock clk  -max 1  [get_ports O_F_WEN_A]
set_output_delay -clock clk  -min 0.1  [get_ports O_F_WEN_A]
set_drive 1  [get_ports I_clk]
set_drive 1  [get_ports I_rst]
set_drive 1  [get_ports {IO_F_IO_A[7]}]
set_drive 1  [get_ports {IO_F_IO_A[6]}]
set_drive 1  [get_ports {IO_F_IO_A[5]}]
set_drive 1  [get_ports {IO_F_IO_A[4]}]
set_drive 1  [get_ports {IO_F_IO_A[3]}]
set_drive 1  [get_ports {IO_F_IO_A[2]}]
set_drive 1  [get_ports {IO_F_IO_A[1]}]
set_drive 1  [get_ports {IO_F_IO_A[0]}]
set_drive 1  [get_ports I_F_RB_A]
set_drive 1  [get_ports {IO_F_IO_B[7]}]
set_drive 1  [get_ports {IO_F_IO_B[6]}]
set_drive 1  [get_ports {IO_F_IO_B[5]}]
set_drive 1  [get_ports {IO_F_IO_B[4]}]
set_drive 1  [get_ports {IO_F_IO_B[3]}]
set_drive 1  [get_ports {IO_F_IO_B[2]}]
set_drive 1  [get_ports {IO_F_IO_B[1]}]
set_drive 1  [get_ports {IO_F_IO_B[0]}]
set_drive 1  [get_ports I_F_RB_B]
set_drive 1  [get_ports {I_KEY[3]}]
set_drive 1  [get_ports {I_KEY[2]}]
set_drive 1  [get_ports {I_KEY[1]}]
set_drive 1  [get_ports {I_KEY[0]}]
