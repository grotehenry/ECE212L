@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xsim mipstest1_behav -key {Behavioral:sim_1:Functional:mipstest1} -tclbatch mipstest1.tcl -view C:/Users/15002/OneDrive/ECE212/Lab10/mipstest1_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
