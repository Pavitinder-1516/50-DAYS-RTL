# Day 21 — D Flip-Flop

## Overview

Day 21 focuses on designing a **D Flip-Flop** using Verilog HDL.

A D flip-flop is a sequential logic circuit that stores one bit of data. On the active clock edge, the value at the D input is captured and transferred to the Q output. The output holds its previous value between active clock edges.

D flip-flops are fundamental building blocks of registers, counters, pipelines, and finite state machines.

## Objective

- Understand the difference between combinational and sequential logic.
- Design a positive-edge-triggered D flip-flop.
- Understand clock-edge-triggered data storage.
- Implement synchronous reset behavior.
- Verify the design using a Verilog testbench.

## Specifications

| Signal | Width | Description |
|---|---:|---|
| `clk` | 1 bit | Clock input |
| `rst` | 1 bit | Active-high synchronous reset |
| `D` | 1 bit | Data input |
| `Q` | 1 bit | Stored output |

The flip-flop captures data on the **rising edge** of the clock. When `rst` is HIGH at a rising edge, `Q` is cleared to `0`.

## Working Principle

1. When `rst = 1` at a rising clock edge, `Q` becomes `0`.
2. When `rst = 0` at a rising clock edge, `Q` captures the value of `D`.
3. Between rising clock edges, `Q` retains its stored value even if `D` changes.

### Timing Behavior

| Event | `rst` | `D` | Expected `Q` |
|---|---:|---:|---:|
| Rising clock edge | 0 | 1 | 1 |
| No clock edge | 0 | 0 | Remains 1 |
| Rising clock edge | 0 | 0 | 0 |
| Rising clock edge | 1 | 1 | 0 |
| Rising clock edge | 0 | 1 | 1 |

## RTL Design Concept

The design uses a clocked `always` block with non-blocking assignments (`<=`).

```verilog
always @(posedge clk) begin
    if (rst)
        Q <= 1'b0;
    else
        Q <= D;
end
```

This snippet illustrates the sequential behavior. The complete module should declare its input and output ports.

## Project Structure

```text
Day-21-D-Flip-Flop/
├── README.md
├── rtl/
│   └── d_flip_flop.v
└── tb/
    └── d_flip_flop_tb.v
```

## Concepts Covered

- Sequential logic
- Positive-edge-triggered circuits
- Clock signals and timing
- Synchronous reset
- Non-blocking assignments (`<=`)
- State storage
- Testbench development and waveform analysis

## Simulation

Using Icarus Verilog, compile the RTL design and testbench:

```bash
iverilog -o dff_sim rtl/d_flip_flop.v tb/d_flip_flop_tb.v
```

Run the simulation:

```bash
vvp dff_sim
```

To inspect the waveform, if the testbench generates `d_flip_flop.vcd`:

```bash
gtkwave d_flip_flop.vcd
```

## Verification Checklist

- [ ] Verify that `Q` captures `D` on a rising clock edge.
- [ ] Change `D` between clock edges and confirm that `Q` holds its value.
- [ ] Verify synchronous reset behavior.
- [ ] Confirm that reset takes effect only at a rising clock edge.
- [ ] Test consecutive rising clock edges with different data values.
- [ ] Inspect the simulation waveform for correct timing.

## Applications

- Data registers
- Pipeline registers in processors
- Counters and shift registers
- Finite state machines
- Memory and data-buffering circuits
- FPGA-based digital systems

## Learning Outcome

After completing Day 21, I will understand how a D flip-flop stores one bit of data, responds to a clock edge, and uses a synchronous reset to initialize its output.

## Next Step — Day 22: JK Flip-Flop

Design a JK flip-flop and explore its set, reset, hold, and toggle operations.

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
- [x] Day 20 — Binary Tree Adder
- [ ] Day 21 — D Flip-Flop
- [ ] Day 22 — JK Flip-Flop

---

*Part of my 50 Days of RTL Design challenge — building digital design fundamentals through Verilog, simulation, and verification.*
