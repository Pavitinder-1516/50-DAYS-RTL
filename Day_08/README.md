# Day 08 — 4-to-2 Priority Encoder

## Objective

The objective of Day 8 is to understand and implement a **4-to-2 Priority Encoder** using Verilog.

Unlike a basic encoder, a priority encoder can handle multiple active inputs. It selects the input with the highest priority and generates its corresponding binary code.

## 1. What Is a Priority Encoder?

A priority encoder is a combinational circuit that converts multiple input signals into a binary output based on a predefined priority order.

This design uses the following priority:

`D3 > D2 > D1 > D0`

Here, `D3` has the highest priority and `D0` has the lowest.

## 2. Inputs and Outputs

**Inputs**
- `D[3:0]` — Four request signals

**Outputs**
- `Y[1:0]` — Two-bit binary code
- `valid` — Indicates whether any input is active

## 3. Truth Table

| D3 | D2 | D1 | D0 | Y1 | Y0 | valid |
|---:|---:|---:|---:|---:|---:|---:|
| 0 | 0 | 0 | 0 | X | X | 0 |
| 0 | 0 | 0 | 1 | 0 | 0 | 1 |
| 0 | 0 | 1 | X | 0 | 1 | 1 |
| 0 | 1 | X | X | 1 | 0 | 1 |
| 1 | X | X | X | 1 | 1 | 1 |

`X` means the input can be either 0 or 1 because its value does not affect the selected output.

When multiple inputs are HIGH, the highest-priority input determines the output.

## 4. Priority Examples

**Example 1: Only D0 is active**

```text
D = 0001
Y = 00
valid = 1
```

**Example 2: D1 and D0 are active**

```text
D = 0011
Y = 01
valid = 1
```

D1 wins because it has higher priority than D0.

**Example 3: D3, D1 and D0 are active**

```text
D = 1011
Y = 11
valid = 1
```

D3 wins because it has the highest priority.

**Example 4: No input is active**

```text
D = 0000
Y = 00
valid = 0
```

The output code is not meaningful when `valid = 0`.

## 5. Boolean Logic

For the priority order `D3 > D2 > D1 > D0`, the output equations are:

```text
Y1 = D3 | D2
Y0 = D3 | (~D2 & D1)
valid = D3 | D2 | D1 | D0
```

These equations ensure that lower-priority inputs cannot override higher-priority inputs.

## 6. RTL Implementation

The RTL file is located at:

```text
rtl/priority_encoder_4to2.v
```

A `casez` statement can describe priority selection clearly:

```verilog
always @(*) begin
    casez (d)
        4'b1???: y = 2'b11;
        4'b01??: y = 2'b10;
        4'b001?: y = 2'b01;
        4'b0001: y = 2'b00;
        default: y = 2'b00;
    endcase
end
```

The `valid` output should also be assigned in the same combinational block or through a continuous assignment.

The `?` symbols represent don't-care input bits in the `casez` patterns. The patterns are ordered from highest priority to lowest.

## 7. Testbench and Verification

The testbench is located at:

```text
tb/priority_encoder_4to2_tb.v
```

The testbench should verify:

- No active inputs
- Each input active individually
- Multiple active inputs
- Highest-priority input selection
- Correct `valid` output

Important test cases:

| Input D | Expected Y | valid |
|---|---|---:|
| `0000` | `00` | 0 |
| `0001` | `00` | 1 |
| `0011` | `01` | 1 |
| `0111` | `10` | 1 |
| `1011` | `11` | 1 |
| `1111` | `11` | 1 |

There are `2^4 = 16` possible input combinations, so exhaustive testing is practical.

## 8. Simulation

Using Icarus Verilog:

```bash
iverilog -o priority_sim rtl/priority_encoder_4to2.v tb/priority_encoder_4to2_tb.v
vvp priority_sim
```

If the testbench generates a VCD waveform:

```bash
gtkwave priority_encoder.vcd
```

Check that the output always represents the highest-priority active input.

## 9. Directory Structure

```text
Day08_Priority_Encoder/
├── README.md
├── rtl/
│   └── priority_encoder_4to2.v
└── tb/
    └── priority_encoder_4to2_tb.v
```

## 10. What I Learned

After completing Day 8, I should understand:

- Difference between a basic encoder and a priority encoder
- How priority is assigned to inputs
- How multiple active inputs are handled
- Purpose of the `valid` signal
- How `casez` can describe priority logic
- How to verify all possible input combinations
- Why priority encoders are useful in real digital systems

## 11. Real-World Applications

Priority encoders are used in:

- Interrupt controllers
- Bus arbitration
- Request-handling circuits
- Processor control logic
- Resource allocation
- Event detection systems

For example, a processor may receive interrupt requests from several peripherals. A priority encoder identifies the highest-priority request that should be handled first.

## Key Takeaway

A **priority encoder** converts multiple input requests into a binary code representing the highest-priority active input.

The most important concept is:

> When multiple inputs are HIGH, the highest-priority input wins.

## Next Step — Day 09

**Half Adder**

The next design introduces arithmetic hardware and demonstrates how XOR and AND gates can perform binary addition.

## 50 Days RTL Progress

- [x] Day 01 — Basic Logic Gates
- [x] Day 02 — NAND, NOR, XOR and XNOR
- [x] Day 03 — 2:1 Multiplexer
- [x] Day 04 — 4:1 Multiplexer
- [x] Day 05 — 1:4 Demultiplexer
- [x] Day 06 — 2-to-4 Decoder
- [x] Day 07 — 4-to-2 Encoder
- [x] Day 08 — 4-to-2 Priority Encoder
- [ ] Day 09 — Half Adder

**50 Days. 50 Designs. One RTL journey.**

`#RTL` `#Verilog` `#DigitalDesign` `#FPGA` `#VLSI`
