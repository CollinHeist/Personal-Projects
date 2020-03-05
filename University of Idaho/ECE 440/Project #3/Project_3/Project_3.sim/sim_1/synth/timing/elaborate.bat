@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto d2b60b27ba644c8c97fef51ceaa7217e -m64 --debug typical --relax --mt 8 --maxdelay -L xil_defaultlib -L simprims_ver -L secureip --snapshot testbench_time_synth -transport_int_delays -pulse_r 0 -pulse_int_r 0 -pulse_e 0 -pulse_int_e 0 xil_defaultlib.testbench xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0