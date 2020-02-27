@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xsim testbench_func_impl -key {Post-Implementation:sim_1:Functional:testbench} -tclbatch testbench.tcl -view U:/ECE 440/Project_5/testbench_behav.wcfg -view U:/ECE 440/Project_5/testbench_time_synth.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
