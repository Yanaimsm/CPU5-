Final Project - MIPS based MCU architecture
This project aim is to design MIPS CPU core (pipelined architecture) with Memory Mapped I/O, Interrupt capability and serial communication perpheral

## MCU (`MCU.vhd`)
Microcontroller unit. 

## BTIMER (`BTIMER.vhd`)
Basic Timer. A timer (sometimes referred to as a counter) is a special piece of hardware inside many microcontrollers. Their function is simple: they count (up or down, depending on the configuration). For example, an 8-bit timer will count from 0 to 255. Most timers will “roll over” once they reach their max value. So, our 8-bit timer would start over again from 0 once it reaches 255.

You can apply a variety of settings to most timers to change the way they function. These settings are usually applied via other special function registers inside the microcontroller. For example, instead of counting to a maximum of 255, you might tell the timer that you want it to roll over at 100 instead. Additionally, you can often connect other hardware or peripherals inside the microcontroller to the timer, like toggling a specific pin automatically when the timer rolls over.

Here are some of the common hardware functions you’ll see with timers:

Output compare (OC): toggle a pin when a timer reaches a certain value
Input capture (IC): measure the number of counts of a timer between events on a pin
Pulse width modulation (PWM): toggle a pin when a timer reaches a certain value and on rollover. By adjusting the on versus off time (duty cycle), you can effectively control the amount of electrical power going to another device.
These hardware-connected timer functions will be a topic for another time. For now, I’d like to focus on using a timer to measure time between events (i.e. measure execution time) as well as triggering basic interrupts.
In our timer, we only use the counting up feature, and the OUTPUT compare mode with continious mode option.

## GPIO (`GPIO.vhd`)
General Purpose Input/Output Module. The GPIO is a simple decoder with buffer regsiters mapped to data address as given in the assembly code example that enables the CPU to output data to LEDs and 7-Segment and to read the Switches state. Here we will call for each I/O (Hex, Leds or Switch) to the Outputperipheral or InputPeripheral for the Switches and use the generic file to write/read the data according the chip select

## Interrupt Controller (`InterruptController.vhd`)


## OptAddrDecoder (`OptAddrDecoder.vhd`)


## OutputPeripheral (`OutputPeripheral.vhd`)


## 7 Segment Decoder (`SevenSegDecoder.vhd`)


## UART (`UART.vhd`)


## UART_RX (`UART_RX.vhd`)


## UART_TX (`UART_TX.vhd`)



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


# Hardware Test Case
In the hardware test case, we will test our system into the D10-Standard FPGA board
We will use Keys for RESET and ENABLE Buttons and SW(0-7) for the breakpoint address




by: Roy kislev and Michael grenader