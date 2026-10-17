# Day 16 — 4-bit Barrel Shifter

## Overview

Day 16 focuses on designing a **4-bit barrel shifter** using Verilog HDL.

A barrel shifter is a combinational digital circuit that shifts or rotates binary data by a specified number of bit positions in a single operation. Unlike a simple shift register, it does not require multiple clock cycles to perform the shift.

## Objective

- Understand the working principle of a barrel shifter.
- Design a 4-bit logical shifter using Verilog.
- Implement selectable left and right shifts.
- Use control signals to select the shift direction and amount.
- Verify the design using a Verilog testbench.

## Specifications

| Signal | Width | Description |
|---|---:|---|
| `data_in` | 4 bits | Input data |
| `shift_amt` | 2 bits | Number of positions to shift |
| `dir` | 1 bit | Shift direction |
| `data_out` | 4 bits | Shifted output |

**Direction convention:**
- `dir = 0`: Logical left shift.
- `dir = 1`: Logical right shift.

The shift amount ranges from 0 to 3 positions. Vacated bit positions are filled with zeros.

## Working Principle

For a logical shift:

- **Left shift:** Bits move toward the most significant bit (MSB), and zeros enter from the right.
- **Right shift:** Bits move toward the least significant bit (LSB), and zeros enter from the left.
- **Shift by zero:** The output remains unchanged.
- **Shift by four or more:** For a 4-bit logical shifter, the result is zero; however, this design's 2-bit shift control only selects shifts from 0 to 3.

## Example Operations

| `data_in` | Direction | Shift Amount | `data_out` |
|---|---|---:|---|
| `1011` | Left | 0 | `1011` |
| `0011` | Left | 1 | `0110` |
| `0011` | Left | 2 | `1100` |
| `1011` | Right | 1 | `0101` |
| `1011` | Right | 2 | `0010` |
| `1011` | Right | 3 | `0001` |

Bits shifted beyond the 4-bit boundary are discarded.

## Concepts Covered

- Combinational circuit design
- Logical left and right shifts
- Verilog shift operators (`<<` and `>>`)
- Control signals and conditional logic
- Variable shift amounts
- Testbench development and waveform analysis

## Project Structure

```text
Day-16-4-bit-Barrel-Shifter/
├── README.md
├── rtl/
│   └── barrel_shifter_4bit.v
└── tb/
    └── barrel_shifter_4bit_tb.v
```

## Simulation

Using Icarus Verilog, compile the RTL design and testbench:

```bash
iverilog -o shifter_sim rtl/barrel_shifter_4bit.v tb/barrel_shifter_4bit_tb.v
```

Run the simulation:

```bash
vvp shifter_sim
```

To inspect the waveform, if the testbench generates `barrel_shifter_4bit.vcd`:

```bash
gtkwave barrel_shifter_4bit.vcd
```

## Verification Checklist

- [ ] Verify left shifts by 0, 1, 2, and 3 positions.
- [ ] Verify right shifts by 0, 1, 2, and 3 positions.
- [ ] Test all-zero and all-one inputs.
- [ ] Test boundary cases where bits are discarded.
- [ ] Verify that vacated positions are filled with zeros.
- [ ] Test all 16 possible input values for both directions and all shift amounts.
- [ ] Inspect the simulation waveform.

## Applications

- CPU and processor datapaths
- Fast arithmetic operations
- Bit manipulation instructions
- Cryptographic hardware
- Data alignment and formatting
- FPGA-based digital signal processing

## Learning Outcome

After completing Day 16, I will understand how a barrel shifter performs variable-distance shifts using combinational logic and how control signals determine the direction and amount of shifting.

## Next Step — Day 17: Parity Generator and Checker

Design a parity generator and checker using XOR logic to detect single-bit errors in binary data.

## Progress Tracker

- [x] Day 1 — Basic Logic Gates
- [x] Day 2 — NAND, NOR, XOR and XNOR Gates
- [x] Day 3 — 2:1 Multiplexer
- [x] Day 4 — 4:1 Multiplexer
- [x] Day 5 — 1:4 Demultiplexer
- [x] Day 6 — 2-to-4 Decoder
- [x] Day 7 — 4-to-2 Encoder
- [x] Day 8 — 4-to-2 Priority Encoder
- [x] Day 9 — Half Adder
- [x] Day 10 — Full Adder
- [x] Day 11 — Ripple Carry Adder
- [x] Day 12 — Carry Look-Ahead Adder
- [x] Day 13 — 4-bit ALU
- [x] Day 14 — 4-bit Magnitude Comparator
- [x] Day 15 — Priority Encoder
- [ ] Day 16 — 4-bit Barrel Shifter
- [ ] Day 17 — Parity Generator and Checker

---

*Part of my 50 Days of RTL Design challenge — building digital design fundamentals through Verilog, simulation, and verification.*
