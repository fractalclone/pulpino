#!/bin/bash

OBJDUMP=`which riscv32-unknown-elf-objdump`
OBJCOPY=`which riscv32-unknown-elf-objcopy`

COMPILER=`which riscv32-unknown-elf-gcc`
SIZE=`which riscv32-unknown-elf-size`

TARGET_C_FLAGS="-O3 -m32 -g"

VSIM=`which vsim`

RVC=0

# Use this argument for Imperio TB
# -DARG_TB="run_imperio.tcl"

PULP_GIT_DIRECTORY=../../
SIM_DIRECTORY="$PULP_GIT_DIRECTORY/vsim"

cmake "$PULP_GIT_DIRECTORY"/sw/ \
    -DCMAKE_BUILD_TYPE=Release \
    -DPULP_MODELSIM_DIRECTORY="$SIM_DIRECTORY" \
    -DCMAKE_C_COMPILER="$COMPILER" \
    -DVSIM="$VSIM" \
    -DRVC="$RVC" \
    -DCMAKE_C_FLAGS="$TARGET_C_FLAGS" \
    -DCMAKE_OBJCOPY="$OBJCOPY" \
    -DCMAKE_OBJDUMP="$OBJDUMP" \
    -DCMAKE_SIZE="$SIZE"

# Add -G "Ninja" to the cmake call above to use ninja instead of make
