# Day 10 — Full Adder

## Objective

The objective of Day 10 is to understand and implement a **Full Adder** using Verilog.

A Full Adder is a combinational digital circuit that adds three single-bit inputs and produces a Sum and a Carry output.

## 1. What Is a Full Adder?

A Full Adder adds two binary bits and an incoming carry from a previous stage.

**Inputs**
- `A` — First binary input
- `B` — Second binary input
- `Cin` — Carry input

**Outputs**
- `Sum` — Result of binary addition
- `Cout` — Carry output

```text
       A ─────┐
       B ─────┤──► Full Adder ───► Sum
     Cin ─────┘                └──► Cout
```

## 2. Truth Table

| A | B | Cin | Sum | Cout |
|---|---|-----|-----|------|
| 0 | 0 |  0  |  0  |  0   |
| 0 | 0 |  1  |  1  |  0   |
| 0 | 1 |  0  |  1  |  0   |
| 0 | 1 |  1  |  0  |  1   |
| 1 | 0 |  0  |  1  |  0   |
| 1 | 0 |  1  |  0  |  1   |
| 1 | 1 |  0  |  0  |  1   |
| 1 | 1 |  1  |  1  |  1   |

There are eight possible input combinations because the circuit has three single-bit inputs.

## 3. Boolean Expressions

### Sum

The Sum output is HIGH when an odd number of inputs are HIGH.

```text
Sum = A XOR B XOR Cin
```

### Carry Output

The Carry output is HIGH when at least two of the three inputs are HIGH.

```text
Cout = (A & B) | (B & Cin) | (A & Cin)
```

These equations describe the complete Full Adder functionality.

## 4. Hardware Implementation

A Full Adder can be built using:

- Two XOR gates
- Two AND gates
- One OR gate

It can also be constructed using **two Half Adders and one OR gate**.

```text
A, B ──► Half Adder 1 ──► Partial Sum
                    └────► Carry 1

Partial Sum, Cin ──► Half Adder 2 ──► Sum
                                └────► Carry 2

Carry 1, Carry 2 ──► OR ──► Cout
```

This demonstrates how smaller RTL modules can be combined to create a larger digital circuit.

## 5. RTL Implementation

The RTL file is located at:

```text
rtl/full_adder.v
```

The design can be described using continuous assignments.

```verilog
assign sum  = a ^ b ^ cin;
assign cout = (a & b) | (b & cin) | (a & cin);
```

The design is purely combinational, so it requires no clock or storage elements.

## 6. Testbench and Verification

The testbench is located at:

```text
tb/full_adder_tb.v
```

The testbench should apply all eight input combinations and verify both outputs against the truth table.

```text
Number of combinations = 2^3 = 8
```

A design is considered correct when `Sum` and `Cout` match the expected values for every input combination.

## 7. Simulation

Using Icarus Verilog:

```bash
iverilog -o full_adder_sim rtl/full_adder.v tb/full_adder_tb.v
vvp full_adder_sim
```

If the testbench generates a VCD waveform:

```bash
gtkwave full_adder.vcd
```

Observe how the Sum and Carry outputs change as the inputs change.

## 8. Directory Structure

```text
Day10_Full_Adder/
├── README.md
├── rtl/
│   └── full_adder.v
└── tb/
    └── full_adder_tb.v
```

## 9. What I Learned

After completing Day 10, I should understand:

- What a Full Adder is
- The role of the carry-in input
- How binary addition generates Sum and Carry
- Boolean equations for a Full Adder
- How to implement a Full Adder in Verilog
- How to verify all input combinations
- How two Half Adders can construct a Full Adder
- How small hardware modules can be combined

## 10. Half Adder vs Full Adder

| Feature | Half Adder | Full Adder |
|---|---|---|
| Data inputs | 2 | 2 |
| Carry input | No | Yes |
| Outputs | Sum, Carry | Sum, Carry |
| Input combinations | 4 | 8 |
| Main purpose | Adds two bits | Adds two bits and an incoming carry |

## 11. Real-World Applications

Full Adders are used in:

- Arithmetic Logic Units (ALUs)
- Ripple Carry Adders
- Binary arithmetic circuits
- Digital processors
- Counters and arithmetic datapaths
- Multi-bit addition circuits

Multiple Full Adders can be connected in sequence to add multi-bit binary numbers, passing the carry from one stage to the next.

## Key Takeaway

A **Full Adder adds two binary inputs and a carry-in input to produce a Sum and a Carry output.**

The essential equations are:

```text
Sum  = A XOR B XOR Cin

Cout = (A & B) | (B & Cin) | (A & Cin)
```

## Next Step — Day 11

**Ripple Carry Adder**

The next design will connect multiple Full Adders to perform multi-bit binary addition.

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
- [ ] Day 11 — Ripple Carry Adder

**50 Days. 50 Designs. One RTL journey.**

`#RTL` `#Verilog` `#DigitalDesign` `#FPGA` `#VLSI`
