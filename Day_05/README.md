# Day 05 — 1:4 Demultiplexer

## 📌 Objective

The objective of Day 5 is to understand the **Demultiplexer (DEMUX)** and how a single input signal can be routed to one of multiple outputs using select lines.

Today we will design a **1:4 Demultiplexer** using Verilog.

---

# 🧠 1. What is a Demultiplexer?

A **Demultiplexer**, commonly called a **DEMUX**, performs the opposite function of a multiplexer.

A multiplexer:

```text
Multiple Inputs → One Output
```

A demultiplexer:

```text
One Input → Multiple Outputs
```

A 1:4 DEMUX contains:

* 1 data input
* 2 select inputs
* 4 outputs

```text
                    ┌─────────────┐
                    │    1:4      ├────► Y0
D ─────────────────►│   DEMUX     ├────► Y1
                    │             ├────► Y2
S1 ────────────────►│             ├────► Y3
S0 ────────────────►│             │
                    └─────────────┘
```

Only **one output is selected at a time**.

---

# 🔌 2. Inputs and Outputs

### Data Input

```text
D
```

### Select Inputs

```text
S1
S0
```

### Outputs

```text
Y0
Y1
Y2
Y3
```

The select signals determine which output receives the input data.

---

# 📊 3. Truth Table

| S1 | S0 | Selected Output |
| -: | -: | --------------- |
|  0 |  0 | Y0 = D          |
|  0 |  1 | Y1 = D          |
|  1 |  0 | Y2 = D          |
|  1 |  1 | Y3 = D          |

The unselected outputs remain `0`.

Therefore:

```text
S1 S0 = 00 → Y0 = D
S1 S0 = 01 → Y1 = D
S1 S0 = 10 → Y2 = D
S1 S0 = 11 → Y3 = D
```

---

# 🧮 4. Boolean Expressions

Each output is enabled by a particular combination of select signals.

### Output Y0

```text
Y0 = D · ~S1 · ~S0
```

### Output Y1

```text
Y1 = D · ~S1 · S0
```

### Output Y2

```text
Y2 = D · S1 · ~S0
```

### Output Y3

```text
Y3 = D · S1 · S0
```

Therefore:

```text
Y0 = D & ~S1 & ~S0
Y1 = D & ~S1 &  S0
Y2 = D &  S1 & ~S0
Y3 = D &  S1 &  S0
```

---

# 🏗️ 5. Hardware Structure

A 1:4 DEMUX can be implemented using:

* NOT gates
* AND gates

Conceptually:

```text
                 ┌────── AND ──── Y0
                 │
D ───────────────┼────── AND ──── Y1
                 │
                 ├────── AND ──── Y2
                 │
                 └────── AND ──── Y3
                  ▲
                  │
              Select Logic
```

The select signals determine which AND gate becomes active.

---

# 💻 6. RTL Design

The RTL implementation is located in:

```text
rtl/demux_1to4.v
```

The design is purely **combinational logic**.

There is:

* No clock
* No flip-flop
* No memory
* No stored state

The outputs depend only on:

```text
D, S1, S0
```

---

# 🧑‍💻 7. Verilog Implementation

The DEMUX can be implemented using a `case` statement:

```verilog
always_comb begin
    y = 4'b0000;

    case ({s1, s0})
        2'b00: y[0] = d;
        2'b01: y[1] = d;
        2'b10: y[2] = d;
        2'b11: y[3] = d;
    endcase
end
```

The default assignment:

```verilog
y = 4'b0000;
```

ensures that unselected outputs remain `0`.

---

# 🔍 8. Understanding the Output

Suppose:

```text
D = 1
S1 = 0
S0 = 1
```

Since:

```text
S1 S0 = 01
```

the DEMUX selects `Y1`.

Therefore:

```text
Y = 4'b0010
```

Only `Y1` is HIGH.

Similarly:

```text
S1 S0 = 10
```

selects `Y2`.

If:

```text
D = 0
```

then all outputs remain `0`, regardless of the selected output.

---

# 📋 9. Complete Verification Table

|  D | S1 | S0 | Y3 | Y2 | Y1 | Y0 |
| -: | -: | -: | -: | -: | -: | -: |
|  0 |  0 |  0 |  0 |  0 |  0 |  0 |
|  0 |  0 |  1 |  0 |  0 |  0 |  0 |
|  0 |  1 |  0 |  0 |  0 |  0 |  0 |
|  0 |  1 |  1 |  0 |  0 |  0 |  0 |
|  1 |  0 |  0 |  0 |  0 |  0 |  1 |
|  1 |  0 |  1 |  0 |  0 |  1 |  0 |
|  1 |  1 |  0 |  0 |  1 |  0 |  0 |
|  1 |  1 |  1 |  1 |  0 |  0 |  0 |

This covers all:

```text
2³ = 8
```

possible input combinations.

---

# 🧪 10. Testbench

The testbench is located at:

```text
tb/demux_1to4_tb.v
```

The testbench should verify:

1. `D = 0`
2. `D = 1`
3. Every select combination
4. Only the selected output becomes equal to `D`
5. All other outputs remain `0`

The expected behavior is:

```text
D = 1

S1 S0    Output
00       0001
01       0010
10       0100
11       1000
```

---

# 🔬 11. Simulation Flow

The basic flow is:

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
Verify Outputs
```

Using Icarus Verilog:

```bash
iverilog -o demux_sim rtl/demux_1to4.v tb/demux_1to4_tb.v
```

Run:

```bash
vvp demux_sim
```

If a VCD waveform is generated:

```bash
gtkwave demux_1to4.vcd
```

---

# 📈 12. Expected Waveform Behavior

When:

```text
D = 1
```

the selected output should become HIGH.

For example:

```text
S1 S0 = 00 → Y0 = 1
S1 S0 = 01 → Y1 = 1
S1 S0 = 10 → Y2 = 1
S1 S0 = 11 → Y3 = 1
```

At any given time, only one output should be active.

---

# 📁 13. Directory Structure

```text
Day05_1to4_DEMUX/
│
├── README.md
│
├── rtl/
│   └── demux_1to4.v
│
└── tb/
    └── demux_1to4_tb.v
```

---

# 🔄 14. MUX vs DEMUX

An important concept from Days 3–5 is the difference between a MUX and a DEMUX.

| Feature      | MUX               | DEMUX               |
| ------------ | ----------------- | ------------------- |
| Operation    | Many → One        | One → Many          |
| Data Inputs  | Multiple          | One                 |
| Data Outputs | One               | Multiple            |
| Select Lines | Control selection | Control destination |
| Example      | 4:1 MUX           | 1:4 DEMUX           |

Conceptually:

```text
4:1 MUX

D0 ─┐
D1 ─┤
D2 ─┤──► MUX ───► Y
D3 ─┘
```

Whereas:

```text
1:4 DEMUX

              ┌──► Y0
              ├──► Y1
D ───► DEMUX ─┼──► Y2
              └──► Y3
```

---

# 🧠 15. What I Learned

After completing Day 5, I should understand:

* What a demultiplexer is
* Difference between MUX and DEMUX
* Structure of a 1:4 DEMUX
* Role of select signals
* Boolean equations for DEMUX outputs
* How to implement a DEMUX in Verilog
* How `case` can describe selection logic
* How to verify all possible input combinations
* How one signal can be routed to different destinations

---

# ⚡ 16. Important RTL Concept

The DEMUX demonstrates **controlled data routing**.

The data input is not changed or processed.

Instead, the select signals determine **where the data goes**.

```text
             Select
               │
               ▼
Data ───────► DEMUX
               │
       ┌───────┼───────┐
       ▼       ▼       ▼
      Y0      Y1      Y2 ... Y3
```

This concept becomes important in larger systems where data must be routed between different hardware blocks.

---

# 🔧 17. Real Hardware Applications

Demultiplexers can be used for:

* Data routing
* Communication systems
* Memory addressing
* Control signal distribution
* Bus routing
* Peripheral selection
* Digital switching systems

For example:

```text
                 ┌──► Peripheral 0
                 │
Data ──► DEMUX ──┼──► Peripheral 1
                 │
                 ├──► Peripheral 2
                 │
                 └──► Peripheral 3
                       ▲
                       │
                  Control Logic
```

The control logic determines which destination receives the data.

---

# 🎯 Hardware Perspective

The progression so far is:

```text
Day 01 → Basic Logic Gates
Day 02 → NAND, NOR, XOR, XNOR
Day 03 → 2:1 MUX
Day 04 → 4:1 MUX
Day 05 → 1:4 DEMUX
```

We have now moved from individual gates to **data-routing circuits**.

The next step is to learn another important combinational building block: the **Decoder**.

---

# 🚀 Next Step

## Day 06 — 2-to-4 Decoder

A decoder converts a binary input code into one active output.

A 2-to-4 decoder will have:

```text
2 Inputs
4 Outputs
```

Conceptually:

```text
A1 A0
 │  │
 ▼  ▼
┌─────────────┐
│ 2-to-4      │
│ Decoder     │
└─────────────┘
 │ │ │ │
 ▼ ▼ ▼ ▼
Y0 Y1 Y2 Y3
```

Each input combination activates one corresponding output.

---

# 📈 50 Days RTL Progress

```text
Day 05 / 50

████████████████████████████████████████ 100%

Completed:
✅ Day 01 — Basic Logic Gates
✅ Day 02 — NAND, NOR, XOR & XNOR
✅ Day 03 — 2:1 Multiplexer
✅ Day 04 — 4:1 Multiplexer
✅ Day 05 — 1:4 Demultiplexer

Next:
⬜ Day 06 — 2-to-4 Decoder
```

---

## 💡 Key Takeaway

> **A 1:4 demultiplexer takes one input and routes it to one of four outputs based on two select signals.**

The fundamental relationship is:

```text
Number of outputs = 2^N

N = number of select lines
```

For a 1:4 DEMUX:

```text
N = 2
2² = 4 outputs
```

**50 Days. 50 Designs. One RTL journey.**

`#RTL` `#Verilog` `#SystemVerilog` `#DigitalDesign` `#FPGA` `#VLSI`
