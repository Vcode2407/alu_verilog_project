@echo off
iverilog -g2012 -o alu_test.vvp alu.v alu_tb.v
if %errorlevel% neq 0 (
    echo Compile Error
    pause
    exit /b
)
vvp alu_test.vvp

REM Open GTKWave if available
start "" "C:\Users\vinay\Downloads\gtkwave-3.3.90-bin-win64\gtkwave64\bin\gtkwave.exe" alu.vcd alu.gtkw
