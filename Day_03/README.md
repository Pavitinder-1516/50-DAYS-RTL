# Day 03 — 2:1 Multiplexer

## 📌 Objective

The objective of Day 3 is to understand the concept of **data selection** in digital circuits by designing a **2:1 Multiplexer (MUX)** using Verilog.

A multiplexer is one of the most important combinational building blocks in digital systems. It allows one of several input signals to be selected and connected to a single output.

---

# 🧠 1. What is a Multiplexer?

A **Multiplexer**, commonly called a **MUX**, is a digital circuit that selects one input from multiple inputs and sends the selected input to the output.

A 2:1 MUX has:

* 2 data inputs
* 1 select input
* 1 output

The basic structure is:

```text
             ┌───────────┐
D0 ─────────►│           │
             │   2:1     ├──────► Y
D1 ─────────►│   MUX     │
             │           │
S  ─────────►│  Select   │
             └───────────┘
```

The select signal `S` determines which input reaches the output.

---

# 🔌 2. Inputs and Outputs

The 2:1 MUX contains:

### Data Inputs

```text
D0
D1
```

### Select Input

```text
S
```

### Output

```text
Y
```

---

# 📊 3. Truth Table

The operation of the MUX can be described using the following truth table:

| S | Y  |
| - | -- |
| 0 | D0 |
| 1 | D1 |

This means:

```text
S = 0 → Output = D0

S = 1 → Output = D1
```

The MUX does not modify the selected data. It simply chooses which input should appear at the output.

---

# 🧮 4. Boolean Expression

The Boolean equation for a 2:1 MUX is:

```text
Y = (~S · D0) + (S · D1)
```

This equation can be understood as two paths:

```text
D0 ── AND ──┐
       ↑    │
      ~S    │
            OR ─── Y
D1 ── AND ──┘
       ↑
       S
```

When `S = 0`:

```text
~S = 1
```

Therefore:

```text
Y = D0
```

When `S = 1`:

```text
~S = 0
```

Therefore:

```text
Y = D1
```

---

# 🏗️ 5. Hardware Understanding

A 2:1 MUX can be constructed using:

* 1 NOT gate
* 2 AND gates
* 1 OR gate

Conceptually:

```text
                 ┌──── NOT ────┐
                 │             │
                 │             ▼
D0 ──────────────┼─────────── AND ────┐
                 │                     │
                 │                     │
S ───────────────┼──────────────── AND ├─── OR ─── Y
                 │                     │
D1 ──────────────┼─────────────────────┘
```

The important idea is that the select signal controls which AND gate is enabled.

---

# 💻 6. RTL Design

The RTL implementation is located in:

```text
rtl/mux_2to1.v
```

The design is purely **combinational logic**.

There is:

* No clock
* No flip-flop
* No memory
* No state

The output depends only on the current values of `D0`, `D1`, and `S`.

---

# 🧑‍💻 7. Verilog Implementation

The MUX can be described using a Boolean expression:

```verilog
assign y = (~s & d0) | (s & d1);
```

This directly represents:

```text
Y = (~S · D0) + (S · D1)
```

Another common RTL representation is a conditional operator:

```verilog
assign y = s ? d1 : d0;
```

Both descriptions represent the same combinational hardware.

---

# 🔍 8. Understanding the Conditional Operator

The expression:

```verilog
assign y = s ? d1 : d0;
```

means:

```text
if S = 1 → Y = D1
if S = 0 → Y = D0
```

The general form is:

```text
condition ? value_if_true : value_if_false
```

This operator is extremely useful for describing multiplexers in RTL.

---

# 🧪 9. Testbench

The testbench is located at:

```text
tb/mux_2to1_tb.v
```

The testbench should verify both possible select conditions.

### Case 1

```text
S = 0
```

Expected:

```text
Y = D0
```

### Case 2

```text
S = 1
```

Expected:

```text
Y = D1
```

To completely test a single-bit 2:1 MUX, all combinations of:

```text
D0
D1
S
```

can be tested.

There are:

```text
2³ = 8
```

possible combinations.

---

# 📋 10. Complete Verification Table

| D0 | D1 |  S | Expected Y |
| -: | -: | -: | ---------: |
|  0 |  0 |  0 |          0 |
|  0 |  0 |  1 |          0 |
|  0 |  1 |  0 |          0 |
|  0 |  1 |  1 |          1 |
|  1 |  0 |  0 |          1 |
|  1 |  0 |  1 |          0 |
|  1 |  1 |  0 |          1 |
|  1 |  1 |  1 |          1 |

The important observation is:

> When `S = 0`, the output follows `D0`.

> When `S = 1`, the output follows `D1`.

---

# 🔬 11. Simulation Flow

The design can be simulated using tools such as:

* Icarus Verilog
* Vivado Simulator
* Verilator
* ModelSim/Questa

A typical flow is:

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
Verify Y
```

For Icarus Verilog:

```bash
iverilog -o mux_sim rtl/mux_2to1.v tb/mux_2to1_tb.v
```

Run the simulation:

```bash
vvp mux_sim
```

If a VCD waveform is generated:

```bash
gtkwave mux_2to1.vcd
```

---

# 📈 12. Expected Waveform Behavior

During simulation, observe:

```text
S = 0
Y follows D0
```

and:

```text
S = 1
Y follows D1
```

For example:

```text
D0 ── 1 ──────────────── 0 ───────
D1 ── 0 ──────── 1 ───────────────
S  ── 0 ───────── 1 ──────────────
Y  ── 1 ───────── 1 ──────────────
```

The output changes according to the selected input.

---

# 📁 13. Directory Structure

```text
Day03_2to1_MUX/
│
├── README.md
│
├── rtl/
│   └── mux_2to1.v
│
└── tb/
    └── mux_2to1_tb.v
```

---

# 🧠 14. What I Learned

After completing Day 3, I should understand:

* What a multiplexer is
* Why multiplexers are used
* Structure of a 2:1 MUX
* Data inputs and select inputs
* MUX truth table
* Boolean equation of a 2:1 MUX
* How gates can be combined to build a MUX
* How to describe a MUX using Verilog
* How the conditional operator works
* How to verify a combinational circuit
* Difference between data signals and control/select signals

---

# ⚡ 15. Important RTL Concept

A multiplexer is a simple example of **combinational selection logic**.

There is no stored value.

If an input changes, the output can change accordingly.

```text
Inputs
  │
  ▼
Combinational Logic
  │
  ▼
Output
```

There is no clock involved.

This is different from sequential logic, which will be introduced later in the 50-day journey.

---

# 🔧 16. Why Multiplexers Are Important

Multiplexers are used throughout real digital systems.

Examples include:

* ALUs
* CPUs
* Datapaths
* Register selection
* Bus selection
* Communication systems
* FPGA routing
* Control logic
* Pipeline structures

A processor may contain a very large number of multiplexers.

For example:

```text
Register A ─────┐
                │
Register B ─────┤
                │
Register C ─────┤──► MUX ───► ALU
                │
Register D ─────┘
                  ▲
                  │
              Select
```

The control logic determines which register is sent to the ALU.

---

# 🎯 Hardware Perspective

The key idea from Day 3 is:

> **A multiplexer allows hardware to choose between different data paths.**

This concept will become increasingly important when designing:

```text
MUX
 ↓
ALU
 ↓
Datapath
 ↓
Processor
```

---

# 🚀 Next Step

## Day 04 — 4:1 Multiplexer

The next design will extend the 2:1 MUX into a **4:1 MUX**.

A 4:1 MUX contains:

```text
4 Data Inputs
2 Select Inputs
1 Output
```

Conceptually:

```text
D0 ─────┐
D1 ─────┤
D2 ─────┤──► 4:1 MUX ───► Y
D3 ─────┤
        │
S1,S0 ──┘
```

The two select signals will determine which of the four inputs is connected to the output.

---

# 📈 50 Days RTL Progress

```text
Day 03 / 50

████████████████████████████████████████ 100%

Completed:
✅ Day 01 — Basic Logic Gates
✅ Day 02 — NAND, NOR, XOR & XNOR
✅ Day 03 — 2:1 Multiplexer

Next:
⬜ Day 04 — 4:1 Multiplexer
```

---

## 💡 Key Takeaway

> **A 2:1 multiplexer is a fundamental combinational circuit that selects one of two inputs based on a select signal.**

The most important equation from Day 3 is:

```text
Y = (~S · D0) + (S · D1)
```

And the most important RTL representation is:

```verilog
assign y = s ? d1 : d0;
```

**50 Days. 50 Designs. One RTL journey.**

`#RTL` `#Verilog` `#SystemVerilog` `#DigitalDesign` `#FPGA` `#VLSI`
