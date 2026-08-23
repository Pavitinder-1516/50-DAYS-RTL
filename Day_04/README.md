# Day 04 — 4:1 Multiplexer

## 📌 Objective

The objective of Day 4 is to extend the concept of a **2:1 Multiplexer** into a **4:1 Multiplexer**.

A 4:1 MUX allows one of **four input signals** to be selected and connected to a single output using **two select signals**.

---

# 🧠 1. What is a 4:1 Multiplexer?

A 4:1 Multiplexer contains:

* 4 data inputs
* 2 select inputs
* 1 output

```text
                 ┌─────────────┐
D0 ─────────────►│             │
D1 ─────────────►│             │
D2 ─────────────►│    4:1      ├──────► Y
D3 ─────────────►│    MUX      │
                 │             │
S1 ─────────────►│             │
S0 ─────────────►│             │
                 └─────────────┘
```

The two select signals determine which input is connected to the output.

---

# 🔌 2. Inputs and Outputs

### Data Inputs

```text
D0
D1
D2
D3
```

### Select Inputs

```text
S1
S0
```

### Output

```text
Y
```

---

# 📊 3. Truth Table

| S1 | S0 | Selected Input | Y  |
| -: | -: | -------------- | -- |
|  0 |  0 | D0             | D0 |
|  0 |  1 | D1             | D1 |
|  1 |  0 | D2             | D2 |
|  1 |  1 | D3             | D3 |

Therefore:

```text
S1 S0 = 00 → Y = D0
S1 S0 = 01 → Y = D1
S1 S0 = 10 → Y = D2
S1 S0 = 11 → Y = D3
```

---

# 🧮 4. Boolean Expression

The Boolean expression for a 4:1 MUX is:

```text
Y = (~S1 · ~S0 · D0)
  + (~S1 · S0  · D1)
  + (S1  · ~S0 · D2)
  + (S1  · S0  · D3)
```

Each input has an associated **selection condition**.

For example, `D2` is selected when:

```text
S1 = 1
S0 = 0
```

Therefore:

```text
Y = D2
```

---

# 🏗️ 5. Building a 4:1 MUX Using 2:1 MUXes

A useful hardware-design concept is that a larger MUX can be constructed from smaller MUXes.

A 4:1 MUX can be built using **three 2:1 MUXes**.

```text
              ┌───────┐
D0 ──────────►│ 2:1   │
D1 ──────────►│ MUX   ├──── X0
              └───────┘
                   │
                  S0

              ┌───────┐
D2 ──────────►│ 2:1   │
D3 ──────────►│ MUX   ├──── X1
              └───────┘
                   │
                  S0

                   X0 ─────┐
                           │
                        ┌──┴───┐
                        │ 2:1  ├──── Y
                   X1 ──► MUX  │
                        └──────┘
                            ▲
                            │
                            S1
```

The first two MUXes select between pairs of inputs.

The final MUX selects between those two intermediate results.

---

# 💻 6. RTL Design

The RTL implementation is located in:

```text
rtl/mux_4to1.v
```

The design is purely **combinational**.

There is:

* No clock
* No storage
* No state
* No flip-flops

The output depends only on the current values of:

```text
D0, D1, D2, D3, S1, S0
```

---

# 🧑‍💻 7. Verilog Implementation

A 4:1 MUX can be described using a conditional operator:

```verilog
assign y = s1 ? (s0 ? d3 : d2)
              : (s0 ? d1 : d0);
```

This represents:

```text
S1 S0 = 00 → D0
S1 S0 = 01 → D1
S1 S0 = 10 → D2
S1 S0 = 11 → D3
```

Another common approach is using a `case` statement.

```verilog
always_comb begin
    case ({s1, s0})
        2'b00: y = d0;
        2'b01: y = d1;
        2'b10: y = d2;
        2'b11: y = d3;
    endcase
end
```

The `case` representation is often easier to read for larger multiplexers.

---

# ⚠️ 8. Important RTL Concept — Combinational Logic

The MUX has no memory.

Therefore, every possible input/select combination must produce an output.

When using an `always_comb` block, make sure the output is assigned for every possible condition.

For example:

```verilog
always_comb begin
    case ({s1, s0})
        2'b00: y = d0;
        2'b01: y = d1;
        2'b10: y = d2;
        2'b11: y = d3;
    endcase
end
```

This completely covers the 2-bit select space.

---

# 🧪 9. Testbench

The testbench is located at:

```text
tb/mux_4to1_tb.v
```

The testbench should verify that every select combination chooses the correct input.

The select combinations are:

```text
00
01
10
11
```

For a complete single-bit verification, all six input signals can be exhaustively tested.

There are:

```text
2⁶ = 64
```

possible combinations.

However, a more targeted testbench can also test each select combination with different data patterns.

---

# 📋 10. Verification Table

A simple functional test can be performed using:

| D0 | D1 | D2 | D3 | S1 | S0 | Expected Y |
| -: | -: | -: | -: | -: | -: | ---------: |
|  1 |  0 |  0 |  0 |  0 |  0 |          1 |
|  0 |  1 |  0 |  0 |  0 |  1 |          1 |
|  0 |  0 |  1 |  0 |  1 |  0 |          1 |
|  0 |  0 |  0 |  1 |  1 |  1 |          1 |

This test pattern makes it easy to verify that each input is correctly selected.

---

# 🔬 11. Simulation Flow

The basic simulation process is:

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
Verify Output
```

Using Icarus Verilog:

```bash
iverilog -o mux4_sim rtl/mux_4to1.v tb/mux_4to1_tb.v
```

Run:

```bash
vvp mux4_sim
```

If a VCD waveform is generated:

```bash
gtkwave mux_4to1.vcd
```

---

# 📈 12. Expected Waveform Behavior

The important relationship to observe is:

```text
S1 S0 = 00 → Y follows D0

S1 S0 = 01 → Y follows D1

S1 S0 = 10 → Y follows D2

S1 S0 = 11 → Y follows D3
```

For example:

```text
S1 = 0
S0 = 0
→ Y = D0
```

If the select changes to:

```text
S1 = 1
S0 = 0
```

then:

```text
Y = D2
```

---

# 📁 13. Directory Structure

```text
Day04_4to1_MUX/
│
├── README.md
│
├── rtl/
│   └── mux_4to1.v
│
└── tb/
    └── mux_4to1_tb.v
```

---

# 🧠 14. What I Learned

After completing Day 4, I should understand:

* What a 4:1 multiplexer is
* Why two select lines are required
* How select lines determine the selected input
* The Boolean expression of a 4:1 MUX
* How a 4:1 MUX can be constructed from 2:1 MUXes
* How to describe a MUX using conditional operators
* How to use `case` for selection logic
* How to verify multiple select combinations
* How combinational RTL differs from sequential RTL

---

# 🔧 15. Why MUXes Matter in Real Hardware

Multiplexers are fundamental components of digital datapaths.

For example, an ALU may need to select different operands:

```text
Register A ─────┐
Register B ─────┤
Memory Data ────┤──► MUX ───► ALU
Immediate ──────┘
                  ▲
                  │
             Control Logic
```

The control logic determines which data source is sent to the ALU.

This same concept appears in:

* CPUs
* GPUs
* FPGA routing
* Memory systems
* Communication hardware
* DSP architectures
* Pipeline datapaths

---

# 🎯 Hardware Perspective

Day 3 introduced:

```text
2 Inputs → 1 Output
```

Day 4 extends the concept:

```text
4 Inputs → 1 Output
```

The general relationship is:

```text
Number of inputs = 2^Number of select lines
```

Therefore:

```text
2:1 MUX  → 1 select line
4:1 MUX  → 2 select lines
8:1 MUX  → 3 select lines
16:1 MUX → 4 select lines
```

This is an important pattern that will continue appearing in larger digital systems.

---

# 🚀 Next Step

## Day 05 — 1:4 Demultiplexer

The next design will perform the opposite type of operation.

Instead of:

```text
Many inputs → One output
```

a **Demultiplexer** performs:

```text
One input → One of many outputs
```

A 1:4 DEMUX will have:

```text
1 Data Input
2 Select Inputs
4 Outputs
```

Conceptually:

```text
                 ┌─────────────┐
                 │    1:4      │
D ──────────────►│    DEMUX    ├──► Y0
                 │             ├──► Y1
S1 ─────────────►│             ├──► Y2
S0 ─────────────►│             ├──► Y3
                 └─────────────┘
```

---

# 📈 50 Days RTL Progress

```text
Day 04 / 50

████████████████████████████████████████ 100%

Completed:
✅ Day 01 — Basic Logic Gates
✅ Day 02 — NAND, NOR, XOR & XNOR
✅ Day 03 — 2:1 Multiplexer
✅ Day 04 — 4:1 Multiplexer

Next:
⬜ Day 05 — 1:4 Demultiplexer
```

---

## 💡 Key Takeaway

> **A 4:1 multiplexer uses two select signals to choose one of four data inputs and route it to a single output.**

The most important relationship from Day 4 is:

```text
Number of inputs = 2^N

N = number of select lines
```

**50 Days. 50 Designs. One RTL journey.**

`#RTL` `#Verilog` `#SystemVerilog` `#DigitalDesign` `#FPGA` `#VLSI`
