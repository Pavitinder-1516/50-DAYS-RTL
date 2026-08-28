# Day 06 — 2-to-4 Decoder

## 📌 Objective

The objective of Day 6 is to understand the working of a **binary decoder** and implement a **2-to-4 Decoder** using Verilog.

A decoder converts an `N-bit` binary input into up to `2^N` unique output lines.

For a 2-to-4 decoder:

```text
2 Input Bits
     ↓
2-to-4 Decoder
     ↓
4 Output Lines
```

Only **one output is HIGH for each valid input combination**.

---

# 🧠 1. What is a Decoder?

A **decoder** is a combinational digital circuit that converts a binary input into a corresponding one-hot output.

A 2-to-4 decoder has:

* 2 inputs
* 4 outputs
* No clock
* No memory

```text
        A1 ─────┐
                │
        A0 ─────┤
                ▼
          ┌───────────┐
          │  2-to-4   │
          │  Decoder  │
          └───────────┘
            │ │ │ │
            ▼ ▼ ▼ ▼
           Y0 Y1 Y2 Y3
```

---

# 🔌 2. Inputs and Outputs

### Inputs

```text
A1
A0
```

### Outputs

```text
Y0
Y1
Y2
Y3
```

The two input bits represent a binary number from `0` to `3`.

---

# 📊 3. Truth Table

| A1 | A0 | Y3 | Y2 | Y1 | Y0 |
| -: | -: | -: | -: | -: | -: |
|  0 |  0 |  0 |  0 |  0 |  1 |
|  0 |  1 |  0 |  0 |  1 |  0 |
|  1 |  0 |  0 |  1 |  0 |  0 |
|  1 |  1 |  1 |  0 |  0 |  0 |

Therefore:

```text
A1 A0 = 00 → Y0 = 1
A1 A0 = 01 → Y1 = 1
A1 A0 = 10 → Y2 = 1
A1 A0 = 11 → Y3 = 1
```

This is called **one-hot output behavior** because exactly one output is active.

---

# 🧮 4. Boolean Expressions

Each output corresponds to one particular input combination.

### Y0

```text
Y0 = ~A1 · ~A0
```

### Y1

```text
Y1 = ~A1 · A0
```

### Y2

```text
Y2 = A1 · ~A0
```

### Y3

```text
Y3 = A1 · A0
```

In Verilog:

```text
Y0 = ~A1 & ~A0
Y1 = ~A1 &  A0
Y2 =  A1 & ~A0
Y3 =  A1 &  A0
```

---

# 🏗️ 5. Hardware Implementation

A basic 2-to-4 decoder can be constructed using:

* 2 NOT gates
* 4 AND gates

Conceptually:

```text
              ┌── NOT ── ~A1 ──┐
A1 ───────────┤                 │
              └─────────────────┤
                                │
              ┌── NOT ── ~A0 ──┤
A0 ───────────┤                 │
              └─────────────────┤
                                ▼
                         ┌──────────┐
                         │ AND Gates│
                         └──────────┘
                          │ │ │ │
                          ▼ ▼ ▼ ▼
                         Y0 Y1 Y2 Y3
```

Each AND gate represents one possible input combination.

---

# 💻 6. RTL Design

The RTL implementation is located in:

```text
rtl/decoder_2to4.v
```

The decoder is **purely combinational**.

There is:

* No clock
* No flip-flop
* No register
* No stored state

The outputs depend only on the current values of `A1` and `A0`.

---

# 🧑‍💻 7. Verilog Implementation

The decoder can be implemented using Boolean expressions:

```verilog
assign y[0] = ~a[1] & ~a[0];
assign y[1] = ~a[1] &  a[0];
assign y[2] =  a[1] & ~a[0];
assign y[3] =  a[1] &  a[0];
```

Another readable approach is using a `case` statement:

```verilog
always_comb begin
    y = 4'b0000;

    case (a)
        2'b00: y = 4'b0001;
        2'b01: y = 4'b0010;
        2'b10: y = 4'b0100;
        2'b11: y = 4'b1000;
    endcase
end
```

Both approaches describe the same combinational function.

---

# ⭐ 8. Understanding One-Hot Output

One-hot means that **only one output bit is active at a time**.

For example:

```text
Input = 2'b10
```

The output becomes:

```text
Y = 4'b0100
```

Only `Y2` is HIGH.

The pattern is:

```text
Input    Output

00       0001
01       0010
10       0100
11       1000
```

This one-hot concept is extremely important in digital design and will appear again when working with **FSMs, control logic, and hardware resource selection**.

---

# 🧪 9. Testbench

The testbench is located at:

```text
tb/decoder_2to4_tb.v
```

Since there are only two input bits, all possible combinations can be tested.

Number of combinations:

```text
2² = 4
```

The testbench should verify:

```text
00 → 0001
01 → 0010
10 → 0100
11 → 1000
```

---

# 📋 10. Verification Table

| Input   | Expected Output |
| ------- | --------------- |
| `2'b00` | `4'b0001`       |
| `2'b01` | `4'b0010`       |
| `2'b10` | `4'b0100`       |
| `2'b11` | `4'b1000`       |

A correct simulation should produce exactly these outputs.

---

# 🔬 11. Simulation Flow

The basic RTL verification process is:

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
Check Output
```

Using Icarus Verilog:

```bash
iverilog -o decoder_sim rtl/decoder_2to4.v tb/decoder_2to4_tb.v
```

Run the simulation:

```bash
vvp decoder_sim
```

If a VCD waveform is generated:

```bash
gtkwave decoder_2to4.vcd
```

---

# 📈 12. Expected Waveform

During simulation, the output should follow the input.

For example:

```text
A1 A0 = 00
Y = 0001
```

Then:

```text
A1 A0 = 01
Y = 0010
```

Then:

```text
A1 A0 = 10
Y = 0100
```

Finally:

```text
A1 A0 = 11
Y = 1000
```

The waveform should demonstrate that only one output is active for every input combination.

---

# 📁 13. Directory Structure

```text
Day06_2to4_Decoder/
│
├── README.md
│
├── rtl/
│   └── decoder_2to4.v
│
└── tb/
    └── decoder_2to4_tb.v
```

---

# 🔄 14. Decoder vs Demultiplexer

Day 5 introduced a **1:4 DEMUX**, while Day 6 introduces a **2-to-4 Decoder**.

They may look similar, but their purposes are different.

| Feature           | 1:4 DEMUX     | 2-to-4 Decoder      |
| ----------------- | ------------- | ------------------- |
| Data input        | 1             | None                |
| Select/Input bits | 2             | 2                   |
| Outputs           | 4             | 4                   |
| Main purpose      | Route data    | Decode binary input |
| Output depends on | Data + select | Input bits          |

A DEMUX routes an actual data signal.

A decoder converts an input code into a one-hot control signal.

---

# ⚡ 15. Decoder with Enable

Real-world decoders often include an **Enable (`EN`) input**.

Conceptually:

```text
             EN
              │
              ▼
A1 A0 ───► 2-to-4 Decoder ───► Y0-Y3
```

When:

```text
EN = 0
```

all outputs can be disabled.

When:

```text
EN = 1
```

the decoder operates normally.

This concept will be useful when designing larger digital systems.

---

# 🔧 16. Real Hardware Applications

Decoders are commonly used in:

* Memory address decoding
* Chip selection
* Instruction decoding
* Peripheral selection
* Control logic
* Register selection
* FSM control
* Digital display systems

For example, a processor may use decoding logic to determine which hardware block should respond to an address:

```text
Address
   │
   ▼
Decoder
   │
   ├────► RAM
   ├────► UART
   ├────► SPI
   └────► GPIO
```

Only the selected block receives the active control signal.

---

# 🧠 17. What I Learned

After completing Day 6, I should understand:

* What a decoder is
* How binary inputs are converted into one-hot outputs
* Structure of a 2-to-4 decoder
* Decoder truth tables
* Boolean expressions for decoder outputs
* One-hot encoding
* How to implement a decoder using Verilog
* How to use `case` for combinational decoding
* Difference between a decoder and a demultiplexer
* Basic concept of enable signals
* How decoders are used in real digital systems

---

# 🎯 Hardware Perspective

The progression so far is:

```text
Day 01 → Basic Logic Gates
Day 02 → NAND, NOR, XOR, XNOR
Day 03 → 2:1 MUX
Day 04 → 4:1 MUX
Day 05 → 1:4 DEMUX
Day 06 → 2-to-4 Decoder
```

We are gradually moving from individual gates toward **control and data-routing structures**.

A decoder is particularly important because binary information can now be converted into individual hardware control signals.

---

# 🚀 Next Step

## Day 07 — 4-to-2 Encoder

The next design will perform the reverse operation of a decoder.

A **4-to-2 Encoder** converts one active input out of four into a 2-bit binary code.

```text
Y0 ──┐
Y1 ──┤
Y2 ──┤──► 4-to-2 Encoder ───► A1 A0
Y3 ──┘
```

For example:

```text
Y0 = 1 → A1 A0 = 00
Y1 = 1 → A1 A0 = 01
Y2 = 1 → A1 A0 = 10
Y3 = 1 → A1 A0 = 11
```

This will introduce the concept of **encoding**.

---

# 📈 50 Days RTL Progress

```text
Day 06 / 50

████████████████████████████████████████ 100%

Completed:
✅ Day 01 — Basic Logic Gates
✅ Day 02 — NAND, NOR, XOR & XNOR
✅ Day 03 — 2:1 Multiplexer
✅ Day 04 — 4:1 Multiplexer
✅ Day 05 — 1:4 Demultiplexer
✅ Day 06 — 2-to-4 Decoder

Next:
⬜ Day 07 — 4-to-2 Encoder
```

---

## 💡 Key Takeaway

> **A 2-to-4 decoder converts a 2-bit binary input into one of four one-hot output signals.**

The fundamental relationship is:

```text
Number of outputs = 2^N
```

For this decoder:

```text
N = 2

2² = 4 outputs
```

And the core behavior is:

```text
00 → 0001
01 → 0010
10 → 0100
11 → 1000
```

**50 Days. 50 Designs. One RTL journey.**

`#RTL` `#Verilog` `#SystemVerilog` `#DigitalDesign` `#FPGA` `#VLSI`
