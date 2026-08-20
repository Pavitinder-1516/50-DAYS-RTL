# Day 01 — Basic Logic Gates

## 📌 Objective

The objective of Day 1 is to understand the fundamentals of **digital logic and RTL design** by implementing basic logic gates using Verilog.

The following gates are implemented:

* AND
* OR
* NOT

These are the fundamental building blocks used to construct more complex digital circuits.

---

# 🧠 1. What is RTL?

**RTL (Register Transfer Level)** is a way of describing how digital hardware processes and transfers data.

Instead of writing software instructions, RTL describes **hardware behavior and structure**.

For example:

```text
A ─────┐
       AND ───── Y
B ─────┘
```

The output is:

```text
Y = A AND B
```

When this RTL is synthesized, the synthesis tool converts the description into actual hardware logic.

---

# 🔌 2. Logic Gates

## AND Gate

The AND gate produces `1` only when **both inputs are 1**.

### Boolean Expression

```text
Y = A · B
```

### Truth Table

| A | B | Y |
| - | - | - |
| 0 | 0 | 0 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |

---

## OR Gate

The OR gate produces `1` when **at least one input is 1**.

### Boolean Expression

```text
Y = A + B
```

### Truth Table

| A | B | Y |
| - | - | - |
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 1 |

---

## NOT Gate

The NOT gate has one input and produces its complement.

### Boolean Expression

```text
Y = ~A
```

### Truth Table

| A | Y |
| - | - |
| 0 | 1 |
| 1 | 0 |

---

# 🏗️ 3. RTL Design

The three gates are implemented in a single Verilog module.

### Inputs

```text
A
B
```

### Outputs

```text
AND_Y
OR_Y
NOT_Y
```

The NOT gate operates on input `A`.

---

# 💻 4. Verilog Implementation

The RTL implementation is located in:

```text
rtl/basic_gates.v
```

The module contains:

```text
AND
OR
NOT
```

The implementation uses continuous assignments because these gates represent purely **combinational logic**.

---

# 🧪 5. Testbench

A testbench is used to verify the RTL design.

The testbench applies all possible combinations of inputs:

```text
A B
0 0
0 1
1 0
1 1
```

The expected outputs are then checked against the logic-gate truth tables.

Testbench:

```text
tb/basic_gates_tb.v
```

---

# 📊 6. Expected Simulation

For the AND and OR gates:

```text
A B | AND | OR
----+-----+---
0 0 |  0  | 0
0 1 |  0  | 1
1 0 |  0  | 1
1 1 |  1  | 1
```

For the NOT gate:

```text
A | NOT
--+----
0 |  1
1 |  0
```

The simulation waveform should therefore show the outputs changing according to these truth tables.

---

# 🔬 7. Verification

The design is considered correct if:

```text
AND_Y = A & B
OR_Y  = A | B
NOT_Y = ~A
```

for every possible input combination.

Because there are only two inputs for the AND/OR gates, there are:

```text
2² = 4
```

possible input combinations.

All four combinations are tested.

---

# 🛠️ 8. Tools

This design can be simulated using:

* Icarus Verilog
* Verilator
* Vivado Simulator
* Questa/ModelSim

Waveforms can be viewed using:

* GTKWave
* Vivado Waveform Viewer
* Questa/ModelSim Waveform Viewer

---

# 📁 9. Directory Structure

```text
Day01_Basic_Gates/
│
├── README.md
│
├── rtl/
│   └── basic_gates.v
│
└── tb/
    └── basic_gates_tb.v
```

---

# 📚 10. What I Learned

After completing Day 1, I should understand:

* What a logic gate is
* Difference between AND, OR and NOT
* How truth tables describe digital logic
* How Boolean expressions represent hardware
* How to describe simple combinational hardware using Verilog
* What a Verilog module is
* How inputs and outputs are declared
* How continuous assignments work
* Why a testbench is required
* How to verify RTL through simulation

---

# 🎯 Key Concept

The most important idea from Day 1 is:

> **Verilog is not just programming code — it is a description of hardware.**

For example:

```verilog
assign y = a & b;
```

does not mean that a CPU is executing an AND instruction.

It describes hardware equivalent to:

```text
a ─────┐
       AND ───── y
b ─────┘
```

This distinction becomes increasingly important as the designs become more complex.

---

# 🚀 Next Step

After understanding basic logic gates, the next step is to combine them and implement more useful digital building blocks.

### Day 02

**NAND, NOR, XOR and XNOR Gates**

The next objective will be to understand additional logic gates and their relationship with universal gates.

---

## 50 Days RTL Progress

```text
Day 01 / 50
████████████████████████████████████████ 100%

Current Topic:
Basic Logic Gates

Status:
✅ RTL
⬜ Testbench
⬜ Simulation
⬜ Synthesis
⬜ Documentation
```

---

**50 Days. 50 Designs. One RTL journey.**

`#RTL` `#Verilog` `#DigitalDesign` `#FPGA` `#VLSI`
