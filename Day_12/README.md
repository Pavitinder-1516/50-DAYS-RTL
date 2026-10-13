# Day 12 — 4-bit Carry Look-Ahead Adder (CLA)

## Objective

The objective of Day 12 is to understand and implement a **4-bit Carry Look-Ahead Adder (CLA)** using Verilog.

A CLA improves addition speed by calculating carry signals using Generate and Propagate logic, rather than waiting for each carry to ripple through successive Full Adders.

## 1. What Is a Carry Look-Ahead Adder?

A Carry Look-Ahead Adder is a combinational circuit designed to reduce the carry propagation delay found in a Ripple Carry Adder (RCA).

In an RCA, each stage waits for the previous stage's carry.

In a CLA, the carry equations are expanded so that carries can be calculated directly from the input bits.

### Basic Architecture

```text
A[3:0] ─────┐
            ├──► Carry Look-Ahead Adder ───► Sum[3:0]
B[3:0] ─────┤                            └──► Cout
Cin ────────┘
```

## 2. Inputs and Outputs

**Inputs**
- `A[3:0]` — First 4-bit binary number
- `B[3:0]` — Second 4-bit binary number
- `Cin` — Initial carry input

**Outputs**
- `Sum[3:0]` — Four-bit sum
- `Cout` — Final carry output

The complete arithmetic result is:

```text
{Cout, Sum} = A + B + Cin
```

## 3. Generate and Propagate Signals

The CLA uses two important signals for each bit position.

### Generate

A carry is generated when both input bits are HIGH.

```text
G[i] = A[i] & B[i]
```

### Propagate

Using the XOR propagate convention, a carry propagates when exactly one input bit is HIGH.

```text
P[i] = A[i] XOR B[i]
```

These signals allow carry equations to be expressed directly.

## 4. Carry Equations

For each bit, the carry-out equation is:

```text
C[i+1] = G[i] | (P[i] & C[i])
```

Expanding this equation for a 4-bit CLA:

```text
C1 = G0 | (P0 & Cin)

C2 = G1 | (P1 & G0) |
     (P1 & P0 & Cin)

C3 = G2 | (P2 & G1) |
     (P2 & P1 & G0) |
     (P2 & P1 & P0 & Cin)

C4 = G3 | (P3 & G2) |
     (P3 & P2 & G1) |
     (P3 & P2 & P1 & G0) |
     (P3 & P2 & P1 & P0 & Cin)
```

The final carry is:

```text
Cout = C4
```

These expanded equations avoid waiting for a carry to pass sequentially through all four stages.

## 5. Sum Equations

The Sum bit is calculated using the propagate signal and the carry-in for that bit.

```text
Sum[0] = P0 XOR Cin
Sum[1] = P1 XOR C1
Sum[2] = P2 XOR C2
Sum[3] = P3 XOR C3
```

Therefore, the CLA calculates the carry signals and then uses them to determine the Sum outputs.

## 6. RTL Implementation

The RTL file is located at:

```text
rtl/carry_lookahead_adder.v
```

The implementation should:

1. Calculate Generate and Propagate signals.
2. Calculate all carry signals using expanded Boolean equations.
3. Calculate the four Sum bits.
4. Assign the final carry to `Cout`.

For a genuine 4-bit CLA, the carry equations should be expanded rather than implemented as a four-stage ripple chain.

## 7. Testbench and Verification

The testbench is located at:

```text
tb/carry_lookahead_adder_tb.v
```

The testbench should verify:

- Addition of zero values
- Addition of small binary numbers
- Carry-in functionality
- Carry generation at individual bit positions
- Carry propagation across multiple bit positions
- Final carry-out generation
- Maximum input values

There are:

```text
2^4 × 2^4 × 2 = 512 combinations
```

All combinations of `A`, `B`, and `Cin` can be tested exhaustively.

The expected result is:

```verilog
{cout, sum} == (a + b + cin)
```

Use a sufficiently wide reference expression in the testbench to preserve the final carry bit.

## 8. Example

Consider:

```text
A   = 0111  (7)
B   = 0001  (1)
Cin = 0
```

Expected result:

```text
  0111
+ 0001
------
  1000
```

Therefore:

```text
Sum  = 1000
Cout = 0
```

The carry signals must be calculated correctly to produce the expected sum.

## 9. Simulation

Using Icarus Verilog:

```bash
iverilog -o cla_sim rtl/carry_lookahead_adder.v tb/carry_lookahead_adder_tb.v
vvp cla_sim
```

If the testbench generates a VCD waveform:

```bash
gtkwave carry_lookahead_adder.vcd
```

Verify that the simulation outputs match the expected arithmetic results.

## 10. Directory Structure

```text
Day12_Carry_Lookahead_Adder/
├── README.md
├── rtl/
│   └── carry_lookahead_adder.v
└── tb/
    └── carry_lookahead_adder_tb.v
```

## 11. Ripple Carry Adder vs Carry Look-Ahead Adder

| Feature | Ripple Carry Adder | Carry Look-Ahead Adder |
|---|---|---|
| Carry calculation | Sequentially between stages | Using expanded carry equations |
| Carry delay | Grows with bit width | Reduced through parallel carry calculation |
| Hardware complexity | Lower | Higher |
| Logic structure | Simple | More complex |
| Main objective | Simplicity | Faster addition |

Actual timing depends on the implementation, synthesis tool, FPGA/ASIC technology, and circuit loading. A CLA is not guaranteed to be faster in every implementation.

## 12. What I Learned

After completing Day 12, I should understand:

- What a Carry Look-Ahead Adder is
- Why carry propagation affects adder performance
- Generate and Propagate signals
- Expanded carry equations
- How Sum bits are calculated
- How to implement a CLA in Verilog
- How to verify arithmetic circuits exhaustively
- The trade-off between speed and hardware complexity

## 13. Real-World Applications

Carry Look-Ahead Adders and related fast-carry architectures are useful in:

- Arithmetic Logic Units (ALUs)
- Processor datapaths
- Digital signal processing
- High-speed arithmetic circuits
- FPGA and ASIC designs

## Key Takeaway

A **Carry Look-Ahead Adder reduces carry propagation delay by calculating carry signals using Generate and Propagate logic**.

The fundamental equations are:

```text
G[i] = A[i] & B[i]

P[i] = A[i] XOR B[i]

C[i+1] = G[i] | (P[i] & C[i])

Sum[i] = P[i] XOR C[i]
```

## Next Step — Day 13

**4-bit Arithmetic Logic Unit (ALU)**

The next design will combine arithmetic and logical operations into one configurable hardware module.

## 50 Days RTL Progress

- [x] Day 01 — Basic Logic Gates
- [x] Day 02 — NAND, NOR, XOR and XNOR
- [x] Day 03 — 2:1 Multiplexer
- [x] Day 04 — 4:1 Multiplexer
- [x] Day 05 — 1:4 Demultiplexer
- [x] Day 06 — 2-to-4 Decoder
- [x] Day 07 — 4-to-2 Encoder
- [x] Day 08 — 4-to-2 Priority Encoder
- [x] Day 09 — Half Adder
- [x] Day 10 — Full Adder
- [x] Day 11 — Ripple Carry Adder
- [x] Day 12 — Carry Look-Ahead Adder
- [ ] Day 13 — 4-bit ALU

**50 Days. 50 Designs. One RTL journey.**

`#RTL` `#Verilog` `#DigitalDesign` `#FPGA` `#VLSI`
