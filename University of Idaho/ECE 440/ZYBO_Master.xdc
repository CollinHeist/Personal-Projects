## This file is a general .xdc for the ZYBO Rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used signals according to the project

##Clock signal
##IO_L11P_T1_SRCC_35	
set_property PACKAGE_PIN L16 [get_ports clock]
set_property IOSTANDARD LVCMOS33 [get_ports clock]
create_clock -add -name sys_clk_pin -period 8.00 -waveform {0 4} [get_ports clock]

##Switches
##IO_L19N_T3_VREF_35
#set_property PACKAGE_PIN G15 [get_ports {sw[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]

##IO_L24P_T3_34
#set_property PACKAGE_PIN P15 [get_ports {sw[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]

##IO_L4N_T0_34
#set_property PACKAGE_PIN W13 [get_ports {sw[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]

##IO_L9P_T1_DQS_34
#set_property PACKAGE_PIN T16 [get_ports {sw[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]

##LEDs
##IO_L23P_T3_35
#set_property PACKAGE_PIN M14 [get_ports {led[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]

##IO_L23N_T3_35
#set_property PACKAGE_PIN M15 [get_ports {led[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]

##IO_0_35
#set_property PACKAGE_PIN G14 [get_ports {led[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]

##IO_L3N_T0_DQS_AD1N_35
#set_property PACKAGE_PIN D18 [get_ports {led[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]

##Pmod Header JA (XADC)
##IO_L21N_T3_DQS_AD14N_35
#set_property PACKAGE_PIN N16 [get_ports {ja_n[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ja_n[0]}]

##IO_L21P_T3_DQS_AD14P_35
#set_property PACKAGE_PIN N15 [get_ports {ja_p[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ja_p[0]}]

##IO_L22N_T3_AD7N_35
#set_property PACKAGE_PIN L15 [get_ports {ja_n[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ja_n[1]}]

##IO_L22P_T3_AD7P_35
#set_property PACKAGE_PIN L14 [get_ports {ja_p[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ja_p[1]}]

##IO_L24N_T3_AD15N_35
#set_property PACKAGE_PIN J16 [get_ports {ja_n[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ja_n[2]}]

##IO_L24P_T3_AD15P_35
#set_property PACKAGE_PIN K16 [get_ports {ja_p[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ja_p[2]}]

##IO_L20N_T3_AD6N_35
#set_property PACKAGE_PIN J14 [get_ports {ja_n[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ja_n[3]}]

##IO_L20P_T3_AD6P_35
#set_property PACKAGE_PIN K14 [get_ports {ja_p[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ja_p[3]}]

##Pmod Header JB
##IO_L15N_T2_DQS_34
#set_property PACKAGE_PIN U20 [get_ports {jb_n[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {jb_n[0]}]

##IO_L15P_T2_DQS_34
#set_property PACKAGE_PIN T20 [get_ports {jb_p[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {jb_p[0]}]

##IO_L16N_T2_34
#set_property PACKAGE_PIN W20 [get_ports {jb_n[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {jb_n[1]}]

##IO_L16P_T2_34
#set_property PACKAGE_PIN V20 [get_ports {jb_p[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {jb_p[1]}]

##IO_L17N_T2_34
#set_property PACKAGE_PIN Y19 [get_ports {jb_n[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {jb_n[2]}]

##IO_L17P_T2_34
#set_property PACKAGE_PIN Y18 [get_ports {jb_p[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {jb_p[2]}]

##IO_L22N_T3_34
#set_property PACKAGE_PIN W19 [get_ports {jb_n[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {jb_n[3]}]

##IO_L22P_T3_34
#set_property PACKAGE_PIN W18 [get_ports {jb_p[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {jb_p[3]}]

##Pmod Header JC
##IO_L10N_T1_34
#set_property PACKAGE_PIN W15 [get_ports {jc_n[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {jc_n[0]}]

##IO_L10P_T1_34
#set_property PACKAGE_PIN V15 [get_ports {jc_p[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {jc_p[0]}]

##IO_L1N_T0_34
#set_property PACKAGE_PIN T10 [get_ports {jc_n[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {jc_n[1]}]

##IO_L1P_T0_34
#set_property PACKAGE_PIN T11 [get_ports {jc_p[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {jc_p[1]}]

##IO_L8N_T1_34
#set_property PACKAGE_PIN Y14 [get_ports {jc_n[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {jc_n[2]}]

##IO_L8P_T1_34
#set_property PACKAGE_PIN W14 [get_ports {jc_p[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {jc_p[2]}]

##IO_L2N_T0_34
#set_property PACKAGE_PIN U12 [get_ports {jc_n[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {jc_n[3]}]

##IO_L2P_T0_34
#set_property PACKAGE_PIN T12 [get_ports {jc_p[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {jc_p[3]}]

##Pmod Header JD
##IO_L5N_T0_34
#set_property PACKAGE_PIN T15 [get_ports {jd_n[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {jd_n[0]}]

##IO_L5P_T0_34
#set_property PACKAGE_PIN T14 [get_ports {jd_p[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {jd_p[0]}]

##IO_L6N_T0_VREF_34
#set_property PACKAGE_PIN R14 [get_ports {jd_n[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {jd_n[1]}]

##IO_L6P_T0_34
#set_property PACKAGE_PIN P14 [get_ports {jd_p[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {jd_p[1]}]

##IO_L11N_T1_SRCC_34
#set_property PACKAGE_PIN U15 [get_ports {jd_n[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {jd_n[2]}]

##IO_L11P_T1_SRCC_34
#set_property PACKAGE_PIN U14 [get_ports {jd_p[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {jd_p[2]}]

##IO_L21N_T3_DQS_34
#set_property PACKAGE_PIN V18 [get_ports {jd_n[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {jd_n[3]}]

##IO_L21P_T3_DQS_34
#set_property PACKAGE_PIN V17 [get_ports {jd_p[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {jd_p[3]}]

##Pmod Header JE
##IO_L4P_T0_34
#set_property PACKAGE_PIN V12 [get_ports {je[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {je[0]}]

##IO_L18N_T2_34
#set_property PACKAGE_PIN W16 [get_ports {je[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {je[1]}]

##IO_25_35
#set_property PACKAGE_PIN J15 [get_ports {je[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {je[2]}]

##IO_L19P_T3_35
#set_property PACKAGE_PIN H15 [get_ports {je[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {je[3]}]

##IO_L3N_T0_DQS_34
#set_property PACKAGE_PIN V13 [get_ports {je[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {je[4]}]

##IO_L9N_T1_DQS_34
#set_property PACKAGE_PIN U17 [get_ports {je[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {je[5]}]

##IO_L20P_T3_34
#set_property PACKAGE_PIN T17 [get_ports {je[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {je[6]}]

##IO_L7N_T1_34
#set_property PACKAGE_PIN Y17 [get_ports {je[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {je[7]}]