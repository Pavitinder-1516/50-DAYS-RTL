# Day 20 — Binary Tree Adder

## Overview

Day 20 focuses on designing a **4-input Binary Tree Adder** using Verilog HDL.

A binary tree adder adds multiple binary operands through a hierarchy of pairwise additions. Instead of adding every operand sequentially, it combines operands in parallel stages, potentially reducing the logic depth and improving performance.

This structure is useful in high-speed arithmetic circuits, digital signal processing, and FPGA-based computing systems.

## Objective

- Understand the architecture of a binary tree adder.
- Add four binary operands using pairwise addition stages.
- Calculate the correct widths for intermediate and final results.
- Implement the design using Verilog HDL.
- Verify the output using a testbench.
- Compare the tree structure with sequential multi-operand addition.

## Specifications

This project uses four unsigned 4-bit inputs.

| Signal | Width | Description |
|---|---:|---|
| `A` | 4 bits | First operand |
| `B` | 4 bits | Second operand |
| `C` | 4 bits | Third operand |
| `D` | 4 bits | Fourth operand |
| `sum` | 6 bits | Final sum |

Each input ranges from 0 to 15. The maximum result is:

\[
15+15+15+15=60
\]

Therefore, the final output requires 6 bits.

## Architecture

The adder operates in two stages.

<box border radius="lg" padding={3} gap={2}>
  <box align="center" gap={1}>
    <text weight="medium">Stage 1 — Pairwise Addition</text>
    <row gap={3} align="center" justify="center">
      <box border radius="md" padding={2} align="center" flex="1">
        <text>A + B</text>
        <text color="secondary" size="sm">5-bit result</text>
      </box>
      <box border radius="md" padding={2} align="center" flex="1">
        <text>C + D</text>
        <text color="secondary" size="sm">5-bit result</text>
      </box>
    </row>
    <icon name="arrow-down" size="lg" />
    <text weight="medium">Stage 2 — Final Addition</text>
    <box background="surface-secondary" radius="md" padding={3} align="center" width="70%">
      <text weight="medium">Partial Sum 1 + Partial Sum 2</text>
      <text size="sm" color="secondary">6-bit final result</text>
    </box>
  </box>
</box>

The equations are:

\[
S_1=A+B
\]

\[
S_2=C+D
\]

\[
sum=S_1+S_2
\]

The two first-stage additions are independent and can be implemented in parallel.

## Example Calculation

Consider the following inputs:

```text
A = 0011  (3)
B = 0101  (5)
C = 0010  (2)
D = 0100  (4)
```

Stage 1:

```text
A + B = 3 + 5 = 8
C + D = 2 + 4 = 6
```

Stage 2:

```text
sum = 8 + 6 = 14
```

The final 6-bit output is:

```text
001110
```

## Concepts Covered

- Binary addition
- Hierarchical combinational design
- Parallel computation
- Adder trees
- Intermediate signal widths
- Logic depth and propagation delay
- Functional verification using Verilog

## Project Structure

```text
Day-20-Binary-Tree-Adder/
├── README.md
├── rtl/
│   └── binary_tree_adder.v
└── tb/
    └── binary_tree_adder_tb.v
```

## Simulation

Using Icarus Verilog, compile the design and testbench:

```bash
iverilog -o tree_adder_sim rtl/binary_tree_adder.v tb/binary_tree_adder_tb.v
```

Run the simulation:

```bash
vvp tree_adder_sim
```

To inspect the waveform, if the testbench generates `binary_tree_adder.vcd`:

```bash
gtkwave binary_tree_adder.vcd
```

## Verification Checklist

- [ ] Verify all-zero inputs.
- [ ] Verify the maximum sum of 60.
- [ ] Test combinations that produce carries in the first stage.
- [ ] Check intermediate sums `S1` and `S2`.
- [ ] Verify the final result for random input combinations.
- [ ] Test all \(16^4 = 65{,}536\) input combinations.
- [ ] Compare the output against a reference calculation.
- [ ] Confirm that the final result is 6 bits wide.

## Binary Tree Adder vs. Sequential Addition

| Feature | Sequential Addition | Binary Tree Addition |
|---|---|---|
| Structure | Adds operands one after another | Adds operand pairs in stages |
| Parallelism | Less opportunity for parallel addition | Independent additions can run in parallel |
| Logic depth | Can increase with operand count | Can grow logarithmically for a balanced tree |
| Hardware | May use fewer parallel resources | May require more parallel hardware |
| Main advantage | Simplicity | Potentially lower combinational delay |

Actual timing and resource usage depend on the RTL structure, synthesis tool, target FPGA or ASIC technology, and implementation constraints.

## Applications

- Digital signal processing
- Multiply-accumulate datapaths
- Image and audio processing
- Neural-network accelerators
- High-speed arithmetic circuits
- FPGA-based computing systems

## Learning Outcome

After completing Day 20, I will understand how to organize multi-operand addition as a balanced hierarchy, preserve intermediate carry bits, and evaluate the trade-off between parallel hardware and timing.

## Next Step — Day 21: D Flip-Flop

Design a D flip-flop using Verilog HDL and understand how sequential logic stores data on a clock edge.

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
- [x] Day 18 — Binary-to-Gray Code Converter
- [x] Day 19 — Multi-Operand Adder
- [ ] Day 20 — Binary Tree Adder
- [ ] Day 21 — D Flip-Flop

---

*Part of my 50 Days of RTL Design challenge — building digital design fundamentals through Verilog, simulation, and verification.*
