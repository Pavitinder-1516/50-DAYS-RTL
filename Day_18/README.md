# Day 18 — Binary-to-Gray Code Converter

## Overview

Day 18 focuses on designing a **4-bit Binary-to-Gray Code Converter** using Verilog HDL.

Gray code is a binary numbering system in which two consecutive values differ by only one bit. It is useful in digital systems where reducing errors during transitions between adjacent values is important.

## Objective

- Understand the difference between binary code and Gray code.
- Design a 4-bit Binary-to-Gray code converter.
- Implement the conversion using XOR logic.
- Write a Verilog testbench to verify the design.
- Test all possible 4-bit input combinations.

## Specifications

| Signal | Width | Description |
|---|---:|---|
| `binary` | 4 bits | Binary input |
| `gray` | 4 bits | Converted Gray code output |

The converter is a **combinational circuit** and does not require a clock.

## Working Principle

The most significant bit (MSB) of Gray code is the same as the MSB of binary input. Each remaining Gray bit is obtained by XORing two adjacent binary bits.

For a 4-bit binary input \(B_3B_2B_1B_0\), the Gray code \(G_3G_2G_1G_0\) is calculated as follows:

\[
G_3=B_3
\]

\[
G_2=B_3\oplus B_2
\]

\[
G_1=B_2\oplus B_1
\]

\[
G_0=B_1\oplus B_0
\]

Here, \(\oplus\) represents the XOR operation.

## Example Conversions

| Decimal | Binary Input | Gray Code Output |
|---:|---|---|
| 0 | `0000` | `0000` |
| 1 | `0001` | `0001` |
| 2 | `0010` | `0011` |
| 3 | `0011` | `0010` |
| 4 | `0100` | `0110` |
| 5 | `0101` | `0111` |
| 6 | `0110` | `0101` |
| 7 | `0111` | `0100` |
| 8 | `1000` | `1100` |
| 15 | `1111` | `1000` |

Notice that consecutive Gray code values differ by exactly one bit.

## Concepts Covered

- Combinational logic design
- Binary and Gray code representation
- XOR gates and Boolean expressions
- Verilog continuous assignments
- Testbench development
- Exhaustive functional verification

## Project Structure

```text
Day-18-Binary-to-Gray-Converter/
├── README.md
├── rtl/
│   └── binary_to_gray.v
└── tb/
    └── binary_to_gray_tb.v
```

## Simulation

Using Icarus Verilog, compile the RTL design and testbench:

```bash
iverilog -o gray_sim rtl/binary_to_gray.v tb/binary_to_gray_tb.v
```

Run the simulation:

```bash
vvp gray_sim
```

To inspect the waveform, if the testbench generates `binary_to_gray.vcd`:

```bash
gtkwave binary_to_gray.vcd
```

## Verification Checklist

- [ ] Verify the conversion of `0000`.
- [ ] Test representative inputs such as `0011`, `0101`, and `1010`.
- [ ] Verify the maximum input `1111`.
- [ ] Test all 16 possible binary inputs.
- [ ] Confirm that the MSB remains unchanged.
- [ ] Confirm that each remaining Gray bit matches the XOR of adjacent binary bits.
- [ ] Check that consecutive Gray code values differ by one bit.

## Applications

- Rotary encoders
- Position measurement systems
- Analog-to-digital converter interfaces
- Digital communication systems
- Reducing transition ambiguity in digital circuits
- FPGA-based control systems

## Learning Outcome

After completing Day 18, I will understand how to convert binary numbers into Gray code using XOR logic and verify a combinational code converter using Verilog simulation.

## Next Step — Day 19: Multi-Operand Adder

Design a multi-operand adder using Verilog to add multiple binary inputs and understand how wider intermediate results and carry handling affect arithmetic hardware.

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
- [x] Day 16 — 4-bit Barrel Shifter
- [x] Day 17 — Parity Generator and Checker
- [ ] Day 18 — Binary-to-Gray Code Converter
- [ ] Day 19 — Multi-Operand Adder

---

*Part of my 50 Days of RTL Design challenge — building digital design fundamentals through Verilog, simulation, and verification.*
