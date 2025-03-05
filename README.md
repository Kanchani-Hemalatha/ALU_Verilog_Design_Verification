# ALU_Verilog_Design_Verification
4-bit ALU Design and Verification using Verilog HDL
//====================================================================================================
//                                      ALU SPECIFICATIONS
//====================================================================================================
//
//INPUT AND OUTPUT SIGNAL SPECIFICATIONS:
//
//+-----------+-----------+--------+----------------------------------------------+
//|  Signal   | Direction |  Width |                Description                  |
//+-----------+-----------+--------+----------------------------------------------+
//| in1       | Input     | 4 bits | First operand                               |
//| in2       | Input     | 4 bits | Second operand                              |
//| opcode    | Input     | 3 bits | Operation selector                          |
//| clock     | Input     | 1 bit  | System clock                                |
//| reset     | Input     | 1 bit  | Active-low asynchronous reset               |
//| out       | Output    | 8 bits | Result of the operation                     |
//+-----------+-----------+--------+----------------------------------------------+
//
//====================================================================================================
//OPERATIONS BASED ON OPCODE:
//
//Arithmetic Unit:
//+---------+----------------+
//| Opcode  | Operation      |
//+---------+----------------+
//|   0     | Addition       |
//|   1     | Subtraction    |
//|   2     | Multiplication |
//|   3     | Division       |
//+---------+----------------+
//
//Logic Unit:
//+---------+-------------+
//| Opcode  | Operation   |
//+---------+-------------+
//|   4     | OR          |
//|   5     | AND         |
//|   6     | NAND        |
//|   7     | NOR         |
//+---------+-------------+
//
//====================================================================================================
//NOTES:
//- The reset signal is active-low and asynchronous.
//- The ALU consists of two submodules: Arithmetic Unit and Logic Unit.
//====================================================================================================

//====================================================================================================
//                          EDA PLAYGROUND LINK
//  link : https://www.edaplayground.com/x/gDvz
//====================================================================================================
