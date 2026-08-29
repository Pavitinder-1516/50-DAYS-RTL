# Day 07 — 4-to-2 Encoder

## 📌 Objective

The objective of Day 7 is to understand the concept of an **Encoder** and implement a **4-to-2 Encoder** using Verilog.

An encoder performs the opposite logical operation of a decoder:

```text
Decoder:
Binary Input → One-Hot Output

Encoder:
One-Hot Input → Binary Output
```

The 4-to-2 encoder takes **four input lines** and produces a **2-bit binary output**.

---

# 🧠 1. What is an Encoder?

An encoder is a combinational circuit that converts an active input into a corresponding binary code.

A 4-to-2 encoder has:

* 4 input lines
* 2 output lines
* No clock
* No memory

```text
D0 ─────┐
D1 ─────┤
D2 ─────┤──► 4-to-2 Encoder ───► A1 A0
D3 ─────┘
```

The assumption for a basic encoder is:

> **Only one input is HIGH at a time.**

---

# 🔌 2. Inputs and Outputs

### Inputs

```text
D0
D1
D2
D3
```

### Outputs

```text
A1
A0
```

The two output bits represent the binary number corresponding to the active input.

---

# 📊 3. Truth Table

For a basic 4-to-2 encoder:

| D3 | D2 | D1 | D0 | A1 | A0 |
| -: | -: | -: | -: | -: | -: |
|  0 |  0 |  0 |  1 |  0 |  0 |
|  0 |  0 |  1 |  0 |  0 |  1 |
|  0 |  1 |  0 |  0 |  1 |  0 |
|  1 |  0 |  0 |  0 |  1 |  1 |

Therefore:

```text
D0 = 1 → A1 A0 = 00
D1 = 1 → A1 A0 = 01
D2 = 1 → A1 A0 = 10
D3 = 1 → A1 A0 = 11
```

---

# ⚠️ 4. Important Assumption

A basic encoder assumes that **exactly one input is active**.

For example:

```text
0001 → Valid
0010 → Valid
0100 → Valid
1000 → Valid
```

But:

```text
0011
0110
1010
1111
```

are not valid inputs for a basic 4-to-2 encoder because multiple inputs are HIGH simultaneously.

This limitation leads to the concept of a **Priority Encoder**, which will be covered later.

---

# 🧮 5. Boolean Expressions

From the truth table:

### A1

`A1` is HIGH when either `D2` or `D3` is HIGH.

```text
A1 = D2 + D3
```

### A0

`A0` is HIGH when either `D1` or `D3` is HIGH.

```text
A0 = D1 + D3
```

Therefore:

```text
A1 = D2 | D3
A0 = D1 | D3
```

These equations directly describe the combinational logic.

---

# 🏗️ 6. Hardware Structure

The encoder can be implemented using two OR gates.

```text
D2 ─────┐
        ├──► OR ───► A1
D3 ─────┘


D1 ─────┐
        ├──► OR ───► A0
D3 ─────┘
```

Therefore, the basic encoder requires:

```text
2 × OR gates
```

under the one-hot input assumption.

---

# 💻 7. RTL Design

The RTL implementation is located in:

```text
rtl/encoder_4to2.v
```

The circuit is purely **combinational logic**.

There is:

* No clock
* No flip-flop
* No register
* No stored state

The outputs depend only on the current input values.

---

# 🧑‍💻 8. Verilog Implementation

The Boolean equations can be directly written in Verilog:

```verilog
assign a1 = d2 | d3;
assign a0 = d1 | d3;
```

This is a simple and efficient RTL description.

Another approach is using a `case` statement:

```verilog
always_comb begin
    case (d)
        4'b0001: a = 2'b00;
        4'b0010: a = 2'b01;
        4'b0100: a = 2'b10;
        4'b1000: a = 2'b11;
        default: a = 2'b00;
    endcase
end
```

For learning the basic encoder, the Boolean-expression approach clearly shows the underlying hardware.

---

# 🧪 9. Testbench

The testbench is located at:

```text
tb/encoder_4to2_tb.v
```

The testbench should activate each input individually:

```text
D0 → 1
D1 → 1
D2 → 1
D3 → 1
```

and verify the corresponding binary output.

Since there are four input bits:

```text
2⁴ = 16
```

possible input combinations exist.

However, only four combinations are valid for a basic one-hot encoder.

---

# 📋 10. Verification Table

| Input D3:D0 | Expected A1:A0 |
| ----------- | -------------- |
| `0001`      | `00`           |
| `0010`      | `01`           |
| `0100`      | `10`           |
| `1000`      | `11`           |

These four cases should be verified during simulation.

---

# 🔬 11. Simulation Flow

The basic verification process is:

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
iverilog -o encoder_sim rtl/encoder_4to2.v tb/encoder_4to2_tb.v
```

Run:

```bash
vvp encoder_sim
```

If a VCD waveform is generated:

```bash
gtkwave encoder_4to2.vcd
```

---

# 📈 12. Expected Waveform

The important behavior to observe is:

```text
D3 D2 D1 D0    A1 A0

0  0  0  1  →  0  0
0  0  1  0  →  0  1
0  1  0  0  →  1  0
1  0  0  0  →  1  1
```

The encoder converts the position of the active input into its binary representation.

---

# 🔄 13. Decoder vs Encoder

Days 6 and 7 demonstrate two complementary operations.

| Feature       | Decoder          | Encoder          |
| ------------- | ---------------- | ---------------- |
| Conversion    | Binary → One-Hot | One-Hot → Binary |
| Example       | 2-to-4           | 4-to-2           |
| Inputs        | 2                | 4                |
| Outputs       | 4                | 2                |
| Active output | One              | Binary code      |
| Main purpose  | Decode           | Encode           |

Conceptually:

```text
2-bit Binary
     │
     ▼
  Decoder
     │
     ▼
One-Hot
```

And:

```text
One-Hot
   │
   ▼
 Encoder
   │
   ▼
2-bit Binary
```

They are closely related building blocks.

---

# ⚠️ 14. Limitation of a Basic Encoder

Consider:

```text
D3 D2 D1 D0
 0  0  1  1
```

Two inputs are active simultaneously.

A basic encoder cannot determine which input should have priority.

Therefore, the output may not represent a meaningful input position.

For systems where multiple inputs can become active simultaneously, a **Priority Encoder** is required.

---

# 🧠 15. One-Hot Encoding

Day 6 introduced **one-hot output** from a decoder.

Day 7 uses the same concept in reverse.

```text
One-Hot:
0001
0010
0100
1000
```

Each bit represents one possible state or selection.

The encoder compresses this representation:

```text
0001 → 00
0010 → 01
0100 → 10
1000 → 11
```

This is an important concept in:

* FSMs
* Interrupt controllers
* Arbitration logic
* Control systems
* CPU control logic

---

# 🔧 16. Real Hardware Applications

Encoders are used in:

* Interrupt systems
* Keyboard interfaces
* Priority selection
* Control logic
* Position sensing
* Resource selection
* FSM implementations
* Communication systems

For example:

```text
Request 0 ──┐
Request 1 ──┤
Request 2 ──┤──► Encoder ───► Binary ID
Request 3 ──┘
```

The binary output identifies which input is active.

---

# 📁 17. Directory Structure

```text
Day07_4to2_Encoder/
│
├── README.md
│
├── rtl/
│   └── encoder_4to2.v
│
└── tb/
    └── encoder_4to2_tb.v
```

---

# 📚 18. What I Learned

After completing Day 7, I should understand:

* What an encoder is
* How a 4-to-2 encoder works
* Relationship between encoders and decoders
* One-hot input representation
* Binary output representation
* Boolean equations of a 4-to-2 encoder
* How to implement an encoder in Verilog
* How to verify combinational RTL
* Why a basic encoder requires one active input
* Why priority encoders are needed when multiple inputs can be active

---

# 🎯 Hardware Perspective

The progression is now:

```text
Day 01 → Basic Logic Gates
Day 02 → NAND, NOR, XOR, XNOR
Day 03 → 2:1 MUX
Day 04 → 4:1 MUX
Day 05 → 1:4 DEMUX
Day 06 → 2-to-4 Decoder
Day 07 → 4-to-2 Encoder
```

We have now covered several fundamental **combinational building blocks**.

The next step is to introduce a circuit that can handle the situation where **multiple inputs may be active at the same time**.

---

# 🚀 Next Step

## Day 08 — Priority Encoder

The next design will implement a **Priority Encoder**.

Unlike the basic encoder, a priority encoder can handle multiple active inputs.

For example:

```text
D3 D2 D1 D0
1  0  1  1
```

If `D3` has the highest priority, the output will represent `D3`:

```text
A1 A0 = 11
```

This introduces an important real-world concept:

> **Priority and arbitration in digital hardware.**

---

# 📈 50 Days RTL Progress

```text
Day 07 / 50

████████████████████████████████████████ 100%

Completed:
✅ Day 01 — Basic Logic Gates
✅ Day 02 — NAND, NOR, XOR & XNOR
✅ Day 03 — 2:1 Multiplexer
✅ Day 04 — 4:1 Multiplexer
✅ Day 05 — 1:4 Demultiplexer
✅ Day 06 — 2-to-4 Decoder
✅ Day 07 — 4-to-2 Encoder

Next:
⬜ Day 08 — Priority Encoder
```

---

## 💡 Key Takeaway

> **A 4-to-2 encoder converts one active input among four into its corresponding 2-bit binary code.**

The core equations are:

```text
A1 = D2 | D3
A0 = D1 | D3
```

And the fundamental conversion is:

```text
0001 → 00
0010 → 01
0100 → 10
1000 → 11
```

**50 Days. 50 Designs. One RTL journey.**

`#RTL` `#Verilog` `#SystemVerilog` `#DigitalDesign` `#FPGA` `#VLSI`
