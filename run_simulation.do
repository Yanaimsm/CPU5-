# ModelSim Simulation Script for MIPS CPU
# Run this script in ModelSim

# Clear previous simulation
quit -sim

# Create work library
vlib work
vmap work work

# Compile files in correct order (ALU and ALU_CONTROL are now integrated into EXECUTE)
vcom -2008 VHDL/const_package.vhd
vcom -2008 VHDL/aux_package.vhd
vcom -2008 VHDL/CONTROL.VHD
vcom -2008 VHDL/DMEMORY.VHD
vcom -2008 VHDL/EXECUTE.vhd
vcom -2008 VHDL/ForwardingUnit.vhd
vcom -2008 VHDL/HazardUnit.vhd
vcom -2008 VHDL/IDECODE.vhd
vcom -2008 VHDL/IFETCH.vhd
vcom -2008 VHDL/MIPS.vhd
vcom -2008 VHDL/WRITE_BACK.vhd
vcom -2008 TB/mips_tester_struct.vhd
vcom -2008 TB/mips_tb_struct.vhd

# Start simulation
vsim -t ps work.mips_tb

# Load wave file
do SIM/OURwave.do

# Run simulation
run 1000ns 