# Day 23 — T Flip-Flop

## Overview

Day 23 focuses on designing a **T (Toggle) Flip-Flop** using Verilog HDL.

A T flip-flop is a sequential logic circuit that stores one bit of data. Its output either holds its previous state or toggles to the opposite state depending on the value of the T input at the active clock edge.

T flip-flops are commonly used in counters, frequency dividers, and sequential digital circuits.

## Objective

- Understand the working principle of a T flip-flop.
- Design a positive-edge-triggered T flip-flop using Verilog.
- Implement hold and toggle operations.
- Understand clock-edge behavior and synchronous reset.
- Verify the design using a Verilog testbench.

## Specifications

| Signal | Width | Description |
|---|---:|---|
| `clk` | 1 bit | Clock input |
| `rst` | 1 bit | Active-high synchronous reset |
| `T` | 1 bit | Toggle control input |
| `Q` | 1 bit | Stored output |

The flip-flop responds to the **rising edge** of the clock. When `rst` is HIGH at a rising edge, the output is cleared to `0`.

## Truth Table

| `T` | Present State (`Q`) | Next State (`Q_next`) | Operation |
|---:|---:|---:|---|
| 0 | 0 | 0
