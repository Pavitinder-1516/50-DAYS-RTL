# Day 17 — Parity Generator and Checker

## Overview

Day 17 focuses on designing a **parity generator and checker** using Verilog HDL.

Parity is a simple error-detection technique used in digital communication and data storage. A parity generator adds a parity bit to binary data, while a parity checker verifies whether the received data satisfies the selected parity condition.

## Objective

- Understand even and odd parity.
- Design a parity generator using XOR and XNOR logic.
- Implement a parity checker to detect parity mismatches.
- Verify the design using a Verilog testbench.
- Understand the limitations of parity-based error detection.

## Specifications

This project uses a 4-bit data input.

| Signal | Width | Description |
|---|---:|---|
| `data_in` | 4 bits | Input data |
| `parity_mode` | 1 bit | Selects even or odd parity |
| `parity_bit` | 1 bit | Generated parity bit |
| `received_data` | 4 bits | Data received by the checker |
| `received_parity` | 1 bit | Parity bit received with the data |
| `error` | 1 bit | Indicates a parity mismatch |

**Parity mode convention:**

- `parity_mode = 0`: Even parity
- `parity_mode = 1`: Odd parity

## Working Principle

### 1. Even Parity

The parity bit is selected so that the total number of `1`s in the data and parity bit is even.

For example:

```text
Data        = 1011
Number of 1s = 3
Parity bit  = 1
Transmitted = 10111
```

The data contains three `1`s, so the parity bit is set to `1` to make the total number of `1`s equal to four.

### 2. Odd Parity

The parity bit is selected so that the total number of `1`s in the data and parity bit is odd.

For example:

```text
Data        = 1011
Number of 1s = 3
Parity bit  = 0
Transmitted = 10110
```

The number of `1`s remains three, which is odd.

## Boolean Expressions

Let the input data be \(D_3,D_2,D_1,D_0\).

The even parity bit is:

\[
P_{\text{even}}=D_3\oplus D_2\oplus D_1\oplus D_0
\]

The odd parity bit is:

\[
P_{\text{odd}}=\overline{P_{\text{even}}}
\]

The generated parity bit can therefore be selected using `parity_mode`.

For the checker, calculate:

\[
E=R_3\oplus R_2\oplus R_1\oplus R_0\oplus P_r
\]

where \(R_3\) to \(R_0\) are the received data bits and \(P_r\) is the received parity bit.

The error output is:

- **Even parity:** `error = E`
- **Odd parity:** `error = ~E`

Here, `error = 1` indicates a parity mismatch, assuming the transmitted data and parity bit use the same parity mode.

## Example Test Cases

| Data | Parity Mode | Generated Parity | Total Number of 1s |
|---|---|---:|---:|
| `0000` | Even | 0 | 0 |
| `1011` | Even | 1 | 4 |
| `1011` | Odd | 0 | 3 |
| `1111` | Even | 0 | 4 |
| `1111` | Odd | 1 | 5 |

## Project Structure

```text
Day-17-Parity-Generator-Checker/
├── README.md
├── rtl/
│   ├── parity_generator.v
│   └── parity_checker.v
└── tb/
    ├── parity_generator_tb.v
    └── parity_checker
