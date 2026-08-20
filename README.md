# 50 Days RTL 🚀

A **50-day RTL (Register Transfer Level) design journey** from basic digital logic to complete, synthesizable hardware design modules using **Verilog/SystemVerilog**.

The goal of this repository is simple:

> **Design something in RTL every day for 50 days.**

This repository is intended for students, beginners, and VLSI/FPGA enthusiasts who want to build a strong practical understanding of **digital design, RTL coding, simulation, verification, and synthesis**.

---

## 🎯 Objective

The purpose of the **50 Days RTL** challenge is to develop RTL design skills by implementing hardware modules progressively.

The journey starts with simple combinational circuits and gradually moves toward:

* Combinational logic
* Sequential logic
* Flip-flops and registers
* Counters
* Multiplexers and decoders
* Adders and ALUs
* FSMs
* Memories
* FIFOs
* UART
* SPI
* Pipelined architectures
* Parameterized RTL
* Verification
* More advanced digital systems

By the end of the 50 days, the repository should contain a collection of **50 practical RTL designs**.

---

# 🗓️ 50-Day Roadmap

## 🟢 Phase 1 — RTL Fundamentals

**Days 1–10**

Learn the fundamentals of RTL and basic digital hardware.

| Day | Design               |
| --- | -------------------- |
| 01  | AND, OR, NOT Gates   |
| 02  | NAND, NOR, XOR, XNOR |
| 03  | 2:1 Multiplexer      |
| 04  | 4:1 Multiplexer      |
| 05  | 1:4 Demultiplexer    |
| 06  | 2-to-4 Decoder       |
| 07  | 4-to-2 Encoder       |
| 08  | Half Adder           |
| 09  | Full Adder           |
| 10  | Half/Full Subtractor |

---

## 🟡 Phase 2 — Combinational Digital Systems

**Days 11–20**

Build larger combinational circuits by combining basic RTL blocks.

| Day | Design                   |
| --- | ------------------------ |
| 11  | Ripple Carry Adder       |
| 12  | Carry Look-Ahead Adder   |
| 13  | 4-bit ALU                |
| 14  | Comparator               |
| 15  | Priority Encoder         |
| 16  | Barrel Shifter           |
| 17  | Parity Generator/Checker |
| 18  | Code Converter           |
| 19  | Multi-Operand Adder      |
| 20  | Binary Tree Adder        |

---

## 🟠 Phase 3 — Sequential Logic

**Days 21–30**

Move from combinational logic to clock-driven sequential hardware.

| Day | Design               |
| --- | -------------------- |
| 21  | D Flip-Flop          |
| 22  | JK Flip-Flop         |
| 23  | T Flip-Flop          |
| 24  | Register             |
| 25  | Shift Register       |
| 26  | Ring Counter         |
| 27  | Johnson Counter      |
| 28  | Synchronous Counter  |
| 29  | Asynchronous Counter |
| 30  | Up/Down Counter      |

---

## 🔵 Phase 4 — FSMs & Memory

**Days 31–40**

Learn how real digital systems are built using state machines and memory.

| Day | Design                   |
| --- | ------------------------ |
| 31  | Moore FSM                |
| 32  | Mealy FSM                |
| 33  | Sequence Detector        |
| 34  | Traffic Light Controller |
| 35  | Vending Machine          |
| 36  | RAM                      |
| 37  | ROM                      |
| 38  | Single-Port RAM          |
| 39  | Dual-Port RAM            |
| 40  | FIFO                     |

---

## 🔴 Phase 5 — Practical RTL Systems

**Days 41–50**

Build modules that are closer to real FPGA/ASIC systems.

| Day | Design                      |
| --- | --------------------------- |
| 41  | UART Transmitter            |
| 42  | UART Receiver               |
| 43  | SPI Master                  |
| 44  | SPI Slave                   |
| 45  | PWM Generator               |
| 46  | Clock Divider               |
| 47  | Pipelined Arithmetic Unit   |
| 48  | APB Interface               |
| 49  | Mini Processor              |
| 50  | Complete RTL Digital System |

---

# 📁 Repository Structure

Each day will have its own directory.

```text
50-days-rtl/
│
├── README.md
│
├── Day01_Basic_Gates/
│   ├── rtl/
│   │   └── basic_gates.v
│   │
│   ├── tb/
│   │   └── basic_gates_tb.v
│   │
│   └── README.md
│
├── Day02_Logic_Gates/
│   ├── rtl/
│   ├── tb/
│   └── README.md
│
├── Day03_MUX/
│   ├── rtl/
│   ├── tb/
│   └── README.md
│
├── ...
│
└── Day50_Complete_System/
    ├── rtl/
    ├── tb/
    └── README.md
```

---

# 🛠️ Tools

The designs can be simulated and synthesized using common FPGA/RTL tools.

### HDL

* Verilog
* SystemVerilog

### Simulation

* Icarus Verilog
* GTKWave
* Verilator

### FPGA / Synthesis

* Xilinx Vivado
* Intel Quartus
* Other compatible synthesis tools

The primary focus of this repository is **RTL itself**, rather than a particular FPGA board.

---

# 🔬 Daily Workflow

Every day follows approximately the same process:

```text
Digital Design Concept
        ↓
Understand the Logic
        ↓
Create RTL
        ↓
Create Testbench
        ↓
Run Simulation
        ↓
Check Waveforms
        ↓
Fix RTL if Required
        ↓
Synthesize
        ↓
Check Hardware Resources
        ↓
Document Results
```

---

# 📊 What Will Be Documented?

For every design, the repository will try to include:

### 1. Design Concept

A short explanation of what the circuit does.

### 2. RTL

Synthesizable Verilog/SystemVerilog implementation.

### 3. Testbench

A testbench used to verify the RTL.

### 4. Simulation

Simulation results and important waveforms.

### 5. Synthesis

Where applicable:

* LUT utilization
* Flip-Flop utilization
* DSP utilization
* BRAM utilization
* Timing
* Maximum frequency

### 6. Explanation

Important parts of the RTL code will be explained so that the design can be understood by someone learning RTL.

---

# 📈 Learning Progression

The difficulty will increase gradually.

```text
Basic Gates
     ↓
Combinational Logic
     ↓
Arithmetic Circuits
     ↓
Flip-Flops
     ↓
Registers
     ↓
Counters
     ↓
FSMs
     ↓
Memory
     ↓
Communication Protocols
     ↓
Pipelining
     ↓
Processor
     ↓
Complete RTL System
```

The goal is **not simply to write 50 pieces of code**.

The goal is to understand:

> **How a digital system becomes hardware from RTL code.**

---

# 🧪 Verification Philosophy

Every design should be tested before considering it complete.

A typical design should contain:

```text
RTL
 │
 ├── Inputs
 ├── Outputs
 └── Internal Logic
        │
        ↓
   Testbench
        │
        ↓
    Simulation
        │
        ↓
   Waveform Check
```

For more complex designs, additional verification techniques will be introduced.

---

# 📚 Topics Covered

By completing the challenge, the repository should provide practical exposure to:

* Digital logic
* Boolean logic
* Combinational circuits
* Sequential circuits
* Clocked logic
* Reset design
* Registers
* Counters
* Arithmetic hardware
* FSM design
* Memory
* FIFOs
* Interfaces
* Communication protocols
* Pipelining
* RTL optimization
* Simulation
* Testbenches
* Synthesis
* FPGA implementation

---

# 🏆 Final Goal

At the end of 50 days, this repository should serve as a **practical RTL portfolio** rather than just a collection of exercises.

The final objective is to be able to look at a digital-system problem and think:

```text
Problem
   ↓
Architecture
   ↓
RTL
   ↓
Verification
   ↓
Synthesis
   ↓
Hardware
```

---

# 🚀 Starting Point

## Day 01 — Basic Logic Gates

The challenge begins with the simplest digital building blocks:

* AND
* OR
* NOT

From these basic gates, we will gradually build increasingly complex digital systems.

**50 Days. 50 Designs. One RTL journey.**

---

## ⭐ Repository Philosophy

> **Learn → Design → Code → Simulate → Verify → Synthesize → Document**

No skipping the fundamentals.

No blindly copying RTL.

The objective is to understand **why the hardware works**, not just whether the code compiles.

---

### Author

**50 Days RTL Challenge**

Built as a practical journey into **Digital Design, RTL, FPGA and VLSI**.

#RTL #Verilog #SystemVerilog #FPGA #VLSI #DigitalDesign #ASIC #HardwareDesign
