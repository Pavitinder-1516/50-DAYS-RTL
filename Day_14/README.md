# Day 14 — 4-bit Magnitude Comparator

## Overview

Day 14 focuses on designing a **4-bit magnitude comparator** using Verilog HDL.

A magnitude comparator is a combinational circuit that compares two binary numbers and determines whether the first number is greater than, less than, or equal to the second number.

## Objective

- Design a 4-bit magnitude comparator using Verilog.
- Compare two unsigned 4-bit binary numbers.
- Generate greater-than, less-than, and equality outputs.
- Write a testbench to verify all possible input combinations.
- Understand the role of comparators in digital systems.

## Specifications

| Signal | Width | Description |
|---|---:|---|
| `A` | 4 bits | First input number |
| `B` | 4 bits | Second input number |
| `A_gt_B` | 1 bit | High when A is greater than B |
| `A_lt_B` | 1 bit | High when A is less than B |
| `A_eq_B` | 1 bit | High when A equals B |

The comparator operates on unsigned numbers from 0 to 15.

## Working Principle

The comparator evaluates the relationship between A and B.

| Condition | `A_gt_B` | `A_lt_B` | `A_eq_B` |
|---|---:|---:|---:|
| A > B | 1 | 0 | 0 |
| A < B | 0 | 1 | 0 |
| A = B | 0 | 0 | 1 |

Exactly one output should be HIGH for every valid input combination.

## Example Test Cases

| A | B | Decimal Comparison | Expected Outputs (`gt`, `lt`, `eq`) |
|---|---|---|---|
| `1010` | `0101` | 10 > 5 | `100` |
| `0011` | `0110` | 3 < 6 | `010` |
| `1100` | `1100` | 12 = 12 | `001` |
| `1111` | `0000` | 15 > 0 | `100` |
| `0000` | `0000` | 0 = 0 | `001` |

## Concepts Covered

- Combinational logic design
- Relational operators in Verilog
- Continuous assignments using `assign`
- Boolean outputs and comparison logic
- Testbench development
- Exhaustive functional verification

## Project Structure

```text
Day-14-4-bit-Comparator/
├── README.md
├── rtl/
│   └── comparator_4bit.v
└── tb/
    └── comparator_4bit_tb.v
```

## Simulation

Using Icarus Verilog, compile the design and testbench:

```bash
iverilog -o comparator_sim rtl/comparator_4bit.v tb/comparator_4bit_tb.v
```

Run the simulation:

```bash
vvp comparator_sim
```

To inspect the waveform, if the testbench generates `comparator_4bit.vcd`:

```bash
gtkwave comparator_4bit.vcd
```

## Verification Checklist

- [ ] Verify the greater-than condition.
- [ ] Verify the less-than condition.
- [ ] Verify the equality condition.
- [ ] Test boundary values such as 0 and 15.
- [ ] Test identical inputs.
- [ ] Test all 256 possible combinations of A and B.
- [ ] Confirm that exactly one output is HIGH for every input pair.

## Applications

- Processor comparison instructions
- Digital control systems
- Sorting and decision-making circuits
- Address and range checking
- Counters and digital measurement systems
- FPGA-based digital systems

## Learning Outcome

After completing Day 14, I will understand how to compare binary numbers using Verilog and generate mutually exclusive outputs for greater-than, less-than, and equality conditions.

## Next Step — Day 15: Priority Encoder

Explore priority-based input encoding and learn how to handle multiple active inputs by assigning priority to the most significant input.

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
- [ ] Day 14 — 4-bit Magnitude Comparator
- [ ] Day 15 — Priority Encoder

---

*Part of my 50 Days of RTL Design challenge — learning digital design through Verilog, simulation, and verification.*
