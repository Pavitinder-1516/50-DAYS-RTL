
# Day 02 — NAND, NOR, XOR & XNOR Gates

## 📌 Objective

The objective of Day 2 is to expand the understanding of **digital logic gates** by implementing four important gates using Verilog:

* NAND
* NOR
* XOR
* XNOR

These gates are important because **NAND and NOR are universal gates**, while XOR and XNOR are widely used in arithmetic circuits, comparators, parity circuits, and control logic.

---

# 🧠 1. What Are Logic Gates?

A logic gate is a digital circuit that performs a logical operation on one or more binary inputs.

Binary signals have two possible values:

```text
0 → LOW
1 → HIGH
```

For two-input gates, there are:

```text
2² = 4
```

possible input combinations.

---

# 🔌 2. NAND Gate

A NAND gate is an **AND gate followed by a NOT gate**.

### Boolean Expression

```text
Y = ~(A · B)
```

### Truth Table

| A | B | AND | NAND |
| - | - | --- | ---- |
| 0 | 0 | 0   | 1    |
| 0 | 1 | 0   | 1    |
| 1 | 0 | 0   | 1    |
| 1 | 1 | 1   | 0    |

The NAND output is `0` only when **both inputs are 1**.

### Hardware Concept

```text
A ─────┐
       AND ── NOT ─── Y
B ─────┘
```

---

# 🔌 3. NOR Gate

A NOR gate is an **OR gate followed by a NOT gate**.

### Boolean Expression

```text
Y = ~(A + B)
```

### Truth Table

| A | B | OR | NOR |
| - | - | -- | --- |
| 0 | 0 | 0  | 1   |
| 0 | 1 | 1  | 0   |
| 1 | 0 | 1  | 0   |
| 1 | 1 | 1  | 0   |

The NOR output is `1` only when **both inputs are 0**.

### Hardware Concept

```text
A ─────┐
       OR ─── NOT ─── Y
B ─────┘
```

---

# 🔌 4. XOR Gate

XOR stands for **Exclusive OR**.

The output is `1` when the two inputs are **different**.

### Boolean Expression

```text
Y = A ⊕ B
```

Equivalent Boolean expression:

```text
Y = (~A · B) + (A · ~B)
```

### Truth Table

| A | B | XOR |
| - | - | --- |
| 0 | 0 | 0   |
| 0 | 1 | 1   |
| 1 | 0 | 1   |
| 1 | 1 | 0   |

### Important Rule

```text
Different inputs → 1
Same inputs     → 0
```

XOR is heavily used in:

* Adders
* Parity generators
* Error detection
* Data comparison
* Cryptographic circuits

---

# 🔌 5. XNOR Gate

XNOR stands for **Exclusive NOR**.

It is the complement of XOR.

### Boolean Expression

```text
Y = ~(A ⊕ B)
```

### Truth Table

| A | B | XNOR |
| - | - | ---- |
| 0 | 0 | 1    |
| 0 | 1 | 0    |
| 1 | 0 | 0    |
| 1 | 1 | 1    |

### Important Rule

```text
Same inputs     → 1
Different inputs → 0
```

XNOR is commonly used in:

* Comparators
* Equality detection
* Error detection
* Digital control circuits

---

# 📊 6. Complete Truth Table

The four gates can be compared together:

| A | B | NAND | NOR | XOR | XNOR |
| - | - | ---- | --- | --- | ---- |
| 0 | 0 | 1    | 1   | 0   | 1    |
| 0 | 1 | 1    | 0   | 1   | 0    |
| 1 | 0 | 1    | 0   | 1   | 0    |
| 1 | 1 | 0    | 0   | 0   | 1    |

This table should match the simulation results.

---

# ⭐ 7. Universal Gates

One of the most important concepts in Day 2 is the idea of **universal gates**.

## NAND

Any basic logic gate can be constructed using only NAND gates.

For example:

### NOT using NAND

```text
NOT A = A NAND A
```

### AND using NAND

```text
A AND B = (A NAND B) NAND (A NAND B)
```

---

## NOR

Similarly, any basic logic gate can be constructed using only NOR gates.

### NOT using NOR

```text
NOT A = A NOR A
```

### OR using NOR

```text
A OR B = (A NOR B) NOR (A NOR B)
```

Therefore:

> **NAND and NOR are called universal gates because complete digital logic systems can be constructed using only one type of these gates.**

---

# 💻 8. RTL Implementation

The Verilog implementation is located in:

```text
rtl/logic_gates.v
```

The module implements:

```text
NAND
NOR
XOR
XNOR
```

Because these are purely combinational circuits, the outputs can be described using **continuous assignments**.

Example:

```verilog
assign nand_y = ~(a & b);
assign nor_y  = ~(a | b);
assign xor_y  = a ^ b;
assign xnor_y = ~(a ^ b);
```

---

# 🧪 9. Testbench

The testbench is located at:

```text
tb/logic_gates_tb.v
```

The testbench applies all possible combinations of:

```text
A = 0, B = 0
A = 0, B = 1
A = 1, B = 0
A = 1, B = 1
```

The outputs are then observed and compared with the expected truth table.

---

# 🔬 10. Verification

The RTL is considered correct when:

```text
NAND = ~(A & B)
NOR  = ~(A | B)
XOR  = A ^ B
XNOR = ~(A ^ B)
```

for every possible input combination.

There are only four combinations, so the complete input space can be exhaustively tested.

---

# 🖥️ 11. Simulation

A typical simulation flow is:

```text
Write RTL
   ↓
Write Testbench
   ↓
Compile
   ↓
Run Simulation
   ↓
Generate Waveform
   ↓
Inspect Outputs
```

For example, with Icarus Verilog:

```bash
iverilog -o gates_sim rtl/logic_gates.v tb/logic_gates_tb.v
vvp gates_sim
```

If waveform output is generated:

```bash
gtkwave gates.vcd
```

The waveform should confirm the truth table for all four gates.

---

# 📁 12. Directory Structure

```text
Day02_Logic_Gates/
│
├── README.md
│
├── rtl/
│   └── logic_gates.v
│
└── tb/
    └── logic_gates_tb.v
```

---

# 📚 13. What I Learned

After completing Day 2, I should understand:

* NAND gate operation
* NOR gate operation
* XOR gate operation
* XNOR gate operation
* Difference between XOR and OR
* Difference between XNOR and NOR
* Universal gates
* How NAND can implement other logic gates
* How NOR can implement other logic gates
* Verilog bitwise operators
* Continuous assignments
* Exhaustive testing of a combinational circuit

---

# ⚠️ Important RTL Concept

Do not confuse **XOR** with **OR**.

For example:

```text
A = 1
B = 1
```

OR:

```text
1 OR 1 = 1
```

XOR:

```text
1 XOR 1 = 0
```

The key difference is:

```text
OR  → 1 when at least one input is 1

XOR → 1 when the inputs are different
```

Similarly:

```text
XNOR → 1 when the inputs are the same
```

---

# 🎯 Hardware Perspective

These gates may look extremely simple, but they are the fundamental components from which larger digital systems are constructed.

For example:

```text
Logic Gates
     ↓
Half Adder
     ↓
Full Adder
     ↓
ALU
     ↓
Processor
```

The XOR gate introduced today will become particularly important when building the **Half Adder and Full Adder** later in the challenge.

---

# 🚀 Next Step

### Day 03 — 2:1 Multiplexer

The next design will introduce the concept of **data selection**.

A 2:1 multiplexer has:

```text
2 Data Inputs
1 Select Input
1 Output
```

Conceptually:

```text
        ┌─────────┐
D0 ─────┤         │
        │  2:1    ├──── Y
D1 ─────┤  MUX    │
        │         │
S  ─────┤ Select  │
        └─────────┘
```

The select signal determines which input appears at the output.

---

# 📈 50 Days RTL Progress

```text
Day 02 / 50

████████████████████████████████████████ 100%

Completed:
✅ Day 01 — Basic Logic Gates
✅ Day 02 — NAND, NOR, XOR & XNOR

Next:
⬜ Day 03 — 2:1 Multiplexer
```

---

## 💡 Key Takeaway

> **NAND and NOR can build complete digital logic systems, while XOR and XNOR provide essential operations for arithmetic and comparison circuits.**

**50 Days. 50 Designs. One RTL journey.**

`#RTL` `#Verilog` `#SystemVerilog` `#DigitalDesign` `#FPGA` `#VLSI`
