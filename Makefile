TOPMODULE = ALU_tb
SRC = alu.v alu_tb.v
OUT = alu_test.vvp

all: simulate

compile:
	iverilog -g2012 -o $(OUT) $(SRC)

simulate: compile
	vvp $(OUT)

clean:
	rm -f $(OUT)
