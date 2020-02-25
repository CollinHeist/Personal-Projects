vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../../Project_5.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.v" \


vlog -work xil_defaultlib "glbl.v"

