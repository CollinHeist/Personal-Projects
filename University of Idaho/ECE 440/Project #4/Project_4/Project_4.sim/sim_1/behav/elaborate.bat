@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 0a203e953dfa41339e5f2deda44f26f9 -m64 --debug typical --relax --mt 8 -L dist_mem_gen_v8_0_11 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot testbench_behav xil_defaultlib.testbench xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
