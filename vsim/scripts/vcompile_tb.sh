#!/bin/tcsh
source scripts/colors.sh


echo "${Green} -> Compiling PULPino Testbench..."

echo "${Green}Compiling component:   ${Brown} work.tb ${NC}"
echo "${Green}library: work ${NC}"
echo "${Red}"

vlog -quiet -sv +incdir+../tb                         ../tb/uart.sv                  || exit 1
vlog -quiet -sv +incdir+../tb +incdir+../rtl/include/ ../tb/tb.sv                    || exit 1

vlog -quiet -sv +incdir+../tb -dpiheader        ../tb/jtag_dpi/dpiheader.h ../tb/jtag_dpi.sv       || exit 1
vlog -quiet -64 -ccflags "-I../tb/jtag_dpi/"    ../tb/jtag_dpi/jtag_dpi.c                          || exit 1



echo "${Cyan} Testbench files have been compiled Succesfully${NC}"

