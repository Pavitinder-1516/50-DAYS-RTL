# Day 22 — JK Flip-Flop

## Overview

Day 22 focuses on designing a **JK Flip-Flop** using Verilog HDL.

A JK flip-flop is a sequential logic circuit that stores one bit of data. It is an improved version of the SR flip-flop because it avoids the invalid input condition associated with the basic SR flip-flop.

The JK flip-flop supports four operations: hold, reset, set, and toggle.

## Objective

- Understand the working principle of a JK flip-flop.
- Implement a positive-edge-triggered JK flip-flop using Verilog.
- Understand synchronous reset and clock-edge behavior.
- Implement hold, set, reset, and toggle operations.
- Verify the design using a Verilog testbench.

## Specifications

| Signal | Width | Description |
|---|---:|---|
| `clk` | 1 bit | Clock input |
| `rst` | 1 bit | Active-high synchronous reset |
| `J` | 1 bit | Set/control input |
| `K` | 1 bit | Reset/control input |
| `Q` | 1 bit | Stored output |

The flip-flop responds to the **rising edge** of the clock. When `rst` is HIGH at a rising edge, the output is cleared to `0`.

## Truth Table

| `J` | `K` | Next State (`Q_next`) | Operation |
|---:|---:|---|---|
| 0 | 0 | `Q` | Hold |
| 0 | 1 | 0 | Reset |
| 1 | 0 | 1 | Set |
| 1 | 1 | `~Q` | Toggle |

The truth table applies when reset is inactive. Reset has priority over the J and K inputs.

## Working Principle

1. **Hold:** When `J = 0` and `K = 0`, the output retains its previous value.
2. **Reset:** When `J = 0` and `K = 1`, the output becomes `0`.
3. **Set:** When `J = 1` and `K = 0`, the output becomes `1`.
4. **Toggle:** When `J = 1` and `K = 1`, the output changes to the opposite of its previous value.

The output changes only on the active clock edge, except that this design's reset is synchronous and also takes effect only at a rising clock edge.

## Characteristic Equation

The next-state equation of a JK flip-flop is:

\[
Q_{\text{next}}=J\overline{Q}+\overline{K}Q
\]

This equation describes the next state when reset is inactive.

## RTL Design Concept

A clocked `always` block and non-blocking assignments (`<=`) are used to model the sequential behavior.

```verilog
always @(posedge clk) begin
    if (rst)
        Q <= 1'b0;
    else begin
        case ({J, K})
            2'b00: Q <= Q;
            2'b01: Q <= 1'b0;
            2'b10: Q <= 1'b1;
            2'b11: Q <= ~Q;
        endcase
    end
end
```

This snippet illustrates the sequential behavior. The complete module should declare its input and output ports.

## Project Structure

```text
Day-22-JK-Flip-Flop/
├── README.md
├── rtl/
│   └── jk_flip_flop.v
└── tb/
    └── jk_flip_flop_tb.v
```

## Concepts Covered

- Sequential logic design
- Positive-edge-triggered flip-flops
- State retention and state transitions
- Clock and synchronous reset
- `case` statements in Verilog
- Non-blocking assignments (`<=`)
- Testbench development and waveform analysis

## Simulation

Using Icarus Verilog, compile the RTL design and testbench:

```bash
iverilog -o jkff_sim rtl/jk_flip_flop.v tb/jk_flip_flop_tb.v
```

Run the simulation:

```bash
vvp jkff_sim
```

To inspect the waveform, if the testbench generates `jk_flip_flop.vcd`:

```bash
gtkwave jk_flip_flop.vcd
```

## Verification Checklist

- [ ] Verify the hold operation (`J = 0`, `K = 0`).
- [ ] Verify the reset operation (`J = 0`, `K = 1`).
- [ ] Verify the set operation (`J = 1`, `K = 0`).
- [ ] Verify the toggle operation (`J = 1`, `K = 1`).
- [ ] Confirm that the output changes only on rising clock edges.
- [ ] Verify that synchronous reset takes effect on a rising clock edge.
- [ ] Test transitions from both `Q = 0` and `Q = 1`.
- [ ] Inspect the simulation waveform.

## Applications

- Counters and frequency dividers
- Sequential control circuits
- State machines
- Toggle-based logic
- Digital systems requiring state storage

## Learning Outcome

After completing Day 22, I will understand how a JK flip-flop stores state and implements hold, set, reset, and toggle operations using clocked Verilog logic.

## Next Step — Day 23: T Flip-Flop

Design a T flip-flop and explore how a single input controls whether the stored output holds its value or toggles on each active clock edge.

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
- [x] Day 21 — D Flip-Flop
- [ ] Day 22 — JK Flip-Flop
- [ ] Day 23 — T Flip-Flop

---

*Part of my 50 Days of RTL Design challenge — building digital design fundamentals through Verilog, simulation, and verification.*
