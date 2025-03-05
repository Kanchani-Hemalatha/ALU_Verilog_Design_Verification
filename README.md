# ALU_Verilog_Design_Verification

## 4-bit ALU Design and Verification using Verilog HDL

## ALU SPECIFICATIONS

### Input and Output Signal Specifications:

| Signal  | Direction | Width  | Description                         |
|---------|----------|--------|-------------------------------------|
| `in1`   | Input    | 4 bits | First operand                      |
| `in2`   | Input    | 4 bits | Second operand                     |
| `opcode`| Input    | 3 bits | Operation selector                  |
| `clock` | Input    | 1 bit  | System clock                        |
| `reset` | Input    | 1 bit  | Active-low asynchronous reset       |
| `out`   | Output   | 8 bits | Result of the operation             |

---

## Operations Based on Opcode:

### Arithmetic Unit:

| Opcode | Operation      |
|--------|--------------|
| `0`    | Addition     |
| `1`    | Subtraction  |
| `2`    | Multiplication |
| `3`    | Division     |

### Logic Unit:

| Opcode | Operation |
|--------|----------|
| `4`    | OR       |
| `5`    | AND      |
| `6`    | NAND     |
| `7`    | NOR      |

---

## Notes:
- The `reset` signal is **active-low** and **asynchronous**.
- The ALU consists of two submodules: **Arithmetic Unit** and **Logic Unit**.

---

## EDA Playground Link:
[Click here to view the simulation](https://www.edaplayground.com/x/gDvz)

## SIMULATION OUTPUT: 
![image](https://github.com/user-attachments/assets/14b51102-f031-4a40-a5c5-b95683ecf172)

## WAVEFORM: 
![image](https://github.com/user-attachments/assets/0625eb56-ea85-441c-9089-a2ad79b88e18)
