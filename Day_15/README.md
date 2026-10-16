# Day 15 — Priority Encoder

## Overview

Day 15 focuses on designing a **4-to-2 Priority Encoder** using Verilog HDL.

A priority encoder converts multiple input signals into a binary code representing the highest-priority active input. Unlike a basic encoder, it handles situations where multiple inputs are HIGH simultaneously by giving priority to the most significant input.

## Objective

- Understand the difference between an encoder and a priority encoder.
- Design a 4-to-2 priority encoder using Verilog.
- Implement priority logic for multiple active inputs.
- Use a `valid` signal to indicate whether any input is active.
- Verify the design using a Verilog testbench.

## Specifications

| Signal | Width | Description |
|---|---:|---|
| `D` | 4 bits | Input request signals |
| `Y` | 2 bits | Encoded binary output |
| `valid` | 1 bit | Indicates whether any input is active |

**Priority order:** `D[3] > D[2] > D[1] > D[0]`

If multiple inputs are HIGH, the encoder outputs the binary code corresponding to the highest-priority active input.

## Truth Table

| D[3] | D[2] | D[1] | D[0] | Y[1:0] | Valid |
|---:|---:|---:|---:|---|---:|
| 1 | X | X | X | `11` | 1 |
| 0 | 1 | X | X | `10` | 1 |
| 0 | 0 | 1 | X | `01` | 1 |
| 0 | 0 | 0 | 1 | `00` | 1 |
| 0 | 0 | 0 | 0 | `00` | 0 |

`X` means the input can be either 0 or 1 because its value does not affect the result when a higher-priority input is active.

**Important:** When all inputs are LOW, `Y = 00` is indistinguishable from the encoding of `D[0]`. The `valid` output resolves this ambiguity.

## Working Principle

- If `D[3] = 1`, output `Y = 11`, regardless of the other inputs.
- Otherwise, if `D[2] = 1`, output `Y = 10`.
- Otherwise, if `D[1] = 1`, output `Y = 01`.
- Otherwise, if `D[0] = 1`, output `Y = 00`.
- If all inputs are zero, `valid = 0`.

## Boolean Expressions

The output equations for this priority arrangement are:

\[
Y_1 = D_3 + D_2
\]

\[
Y_0 = D_3 + (\overline{D_2}\cdot D_1)
\]

\[
valid = D_3 + D_2 + D_1 + D_0
\]

Here, `+` represents OR, `·` represents AND, and the overbar represents NOT.

## Project Structure

```text
Day-15-Priority-Encoder/
├── README.md
├── rtl/
│   └── priority_encoder.v
└── tb/
    └── priority_encoder_tb.v
```

## Concepts Covered

- Combinational logic design
- Priority-based decision logic
- Verilog `if-else` statements
- Conditional execution and signal assignment
- Boolean algebra
- Validity indicators
- Testbench development and functional verification

## Simulation

Using Icarus Verilog, compile the RTL design and testbench:

```bash
iverilog -o priority_sim rtl/priority_encoder.v tb/priority_encoder_tb.v
```

Run the simulation:

```bash
vvp priority_sim
```

To inspect
