# Day 13 — 4-bit Arithmetic Logic Unit (ALU)

## Overview

On Day 13 of the **50 Days of RTL Design** challenge, we explore the design of a **4-bit Arithmetic Logic Unit (ALU)** using Verilog.

An ALU is a fundamental digital circuit that performs arithmetic and logical operations on binary data. It is an essential component of a processor's datapath.

## Objective

- Understand the working of an ALU.
- Implement arithmetic and logical operations using Verilog.
- Use a selection signal to choose the required operation.
- Verify all supported operations using a testbench.
- Understand how an ALU is used in processor architectures.

## ALU Specifications

| Signal | Width | Description |
|---|---|---|
| `A` | 4 bits | First operand |
| `B` | 4 bits | Second operand |
| `sel` | 3 bits | Operation selection |
| `result` | 4 bits | Operation result |
| `carry_out` | 1 bit | Carry output for addition |

The ALU is a **combinational circuit**, so its output depends on the current inputs and selection signal. It does not require a clock.

## Supported Operations

| `sel` | Operation | Description |
|---|---|---|
| `000` | ADD | `A + B` |
| `001` | SUB | `A - B` |
| `010` | AND | Bitwise AND |
| `011` | OR | Bitwise OR |
| `100` | XOR | Bitwise XOR |
| `101` | NOT | Bitwise NOT of A |
| `110` | SHL | Logical left shift of A |
| `111` | SHR | Logical right shift of A |

**Note:** `result` is 4 bits wide, so arithmetic results are limited to four bits. For addition, `carry_out` indicates the carry beyond the most significant bit. The subtraction carry/borrow convention should be defined separately if it is implemented.

## Concepts Covered

- Combinational logic design
- Verilog `always @(*)` blocks
- `case` statements
- Arithmetic and bitwise operators
- Operation selection using control signals
- Testbench development and functional verification
- Basic ALU architecture

## Project Structure

```text
Day-13-4-bit-ALU/
├── README.md
├── rtl/
│   └── alu_4bit.v
└── tb/
    └── alu_4bit_tb.v
```

## Tools Required

- Verilog HDL
- Icarus Verilog
- GTKWave
- Any text editor or Verilog-compatible IDE

## Simulation

Compile the RTL design and testbench:

```bash
iverilog -o alu_sim rtl/alu_4bit.v tb/alu_4bit_tb.v
```

Run the simulation:

```bash
vvp alu_sim
```

If the testbench generates a VCD waveform file, open it using:

```bash
gtkwave alu_4bit.vcd
```

## Verification Plan

The testbench should verify:

- Addition with and without carry.
- Subtraction for positive, zero, and wrapped 4-bit results.
- AND, OR, and XOR operations.
- NOT operation on operand A.
- Left and right shifts.
- Every possible `sel` value.
- Correct behavior when inputs change between operations.

### Example Test Cases

| A | B | Operation | Expected Result |
|---|---|---|---|
| `0011` | `0010` | ADD | `0101` |
| `0111` | `0010` | SUB | `0101` |
| `1100` | `1010` | AND | `1000` |
| `1100` | `1010` | OR | `1110` |
| `1100` | `1010` | XOR | `0110` |
| `0101` | — | NOT A | `1010` |
| `0011` | — | SHL | `0110` |
| `1100` | — | SHR | `0110` |

## Applications

- CPU and microprocessor datapaths
- Arithmetic and logical instruction execution
- Embedded systems
- FPGA-based processor designs
- Digital system design and computer architecture

## Learning Outcome

By completing Day 13, you will understand how multiple arithmetic and logical functions can be combined into a single hardware unit and controlled using selection signals.

## Next Step — Day 14: 4-bit Comparator

Design a combinational comparator to determine whether one 4-bit number is greater than, less than, or equal to another.

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
- [ ] Day 13 — 4-bit ALU
- [ ] Day 14 — 4-bit Comparator

*Part of my 50 Days of RTL Design challenge — building digital design fundamentals through Verilog, simulation, and verification.*
