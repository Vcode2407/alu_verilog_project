# 🔢 8-bit ALU in Verilog

![CI](https://github.com/Vcode2407/alu_verilog_project/actions/workflows/simulate.yml/badge.svg)

## Features

- 8-bit inputs: `a`, `b`
- Supported operations:
  - `000` - ADD
  - `001` - SUB
  - `010` - AND
  - `011` - OR
  - `100` - XOR
  - `101` - SHIFT (left or right based on `dir`)
- Output flags:
  - `carry`
  - `zero`
  - `overflow`

## ALU Diagram

```
     +----------------------+
 a --|                      |
 b --|                      |
op --|        8-bit         |--> result
dir-|          ALU          |
     |                      |--> flags: carry, zero, overflow
     +----------------------+
```

## Example Output

```
a=14, b=23, op=0, dir=0 -> result=37, carry=0, zero=0, overflow=0
a=255, b=1, op=0, dir=0 -> result=0, carry=1, zero=1, overflow=1
```

## Run In Windows

1. Install:
   - [Icarus Verilog](https://bleyer.org/icarus/)
   - [GTKWave](http://gtkwave.sourceforge.net/)
2. Add both to your Windows PATH
3. Run simulation:

```bat
run.bat
```

This will:
- Compile `alu.v` and `alu_tb.v`
- Simulate the testbench
- Generate `alu.vcd`
- Open GTKWave to view waveform

## Project Structure

```
alu_verilog_project/
├── alu.v                # ALU design (parameterized)
├── alu_tb.v             # Testbench with random vectors
├── alu.vcd              # VCD waveform output
├── alu.gtkw             # GTKWave layout (optional)
├── run.bat              # Batch script to compile + run + view
├── README.md            # Project documentation
└── .github/
    └── workflows/
        └── simulate.yml # GitHub Actions workflow (CI)
```

## CI Integration

This project uses GitHub Actions to auto-run Verilog simulation on every push.  
The badge at the top shows live build status (Either passed or failed).

---

### Why This Project?

This ALU project demonstrates how digital circuits work using Verilog. It’s simple but powerful — with a random testbench, waveform visualization using GTKWave, and continuous integration via GitHub Actions.
---

### Author

Made by [Vcode2407](https://github.com/Vcode2407)  
License: MIT