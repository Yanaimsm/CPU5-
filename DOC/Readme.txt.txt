LAB5 - Scalar Pipelined MIPS CPU Architecture
In this lab we will implement Scalar PipeLined MIPS CPU from a single cycle MIPS compatible CPU.


The System Architecture contains the MIPS Core, with it's Program and Data chache memories.
The system is designed in a way to run it both in modelsim and both on fpga without any changes or different files.


## MIPS (`MIPS.vhd`)
Pipelined MIPS Architecture top entity. contains the stages Registers and the debugging control


## ALU (`ALU.vhd`)
This module incharge of the arithmetic operations in the execute stage


## ALU_CONTROL (`ALU_CONTROL.vhd`)
This module incharge of the control signal for the alu operation


## CONTROL (`CONTROL.vhd`)
At this stage, the control unit that receives the Op and the Funct is also sitting (simply does not refer to this line if the command is not of R-type) and it issues appropriate control lines for the mode of the received command.


## IFETCH (`IFETCH.vhd`)
At this stage we would like to fetch the command at the PC address from the memory of the instructions. Also, this part deals with the selected PC, because in the attached architecture there are always several options for changing the PC -
* We would like to insert into the PC a value of an address to which we would like to perform a jump
* We would like to insert into the PC a value of an address to which we would like to branch
* PC←PC+4 when we want to advance the next command

## IDECODE (`IDECODE.vhd`)
At this stage we would like to take the command that was given by the fetch phase and actually break it down according to the type of the command. This way we will enter the address of the appropriate registers to the RF which is in the decode stage and we will be able to extract the content of the appropriate registers.
Also, at this stage, we will perform the branch and jump calculation if one of them exists, because at this stage we will already be able to know whether a jump was performed (according to the command structure) or a branch after comparing the contents of the assumed and updated registers (we will take care of this in the Hazard unit).

## EXECUTE (`EXECUTE.vhd`)
The execution phase, here we execute commands to the memory such as calculating an address or performing a certain operation. This is done through various arithmetic commands that are done in the ALU component.


## DMEMORY (`DMEMORY.vhd`)
This module is responsible for writing and reading from the contents of the Data Memory, which is the RAM memory of our system. We in the task used a RAM size of 2^12.


## WRITE_BACK (`WRITE_BACK.vhd`)
This module is responsible for managing the return of the information at the end of the pipeline and writing it to memory. There are instructions that change the registers as a result of operations on registers in the ALU and as a result of operations from the memory, therefore this module must manage and know which line to return and write it to the register.

## Hazard Unit (`Hazard Unit.vhd`)
This module incharge of the hazards control including forwarding and stall and flush operations when needed.




# QA
We ran a basic assembly code to test our system.

# Hardware Test Case
In the hardware test case, we will test our system into the D10-Standard FPGA board
We will use Keys for RESET and ENABLE Buttons and SW(0-7) for the breakpoint address




by: Roy kislev and Michael grenader