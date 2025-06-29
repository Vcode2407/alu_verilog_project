`timescale 1ns/1ps

module ALU_tb;

    parameter WIDTH = 8;
    parameter NUM_TESTS = 20;

    logic [WIDTH-1:0] a, b;
    logic [2:0] op;
    logic dir;
    logic [WIDTH-1:0] result;
    logic zero, carry, overflow;

    ALU #(WIDTH) dut (
        .a(a),
        .b(b),
        .op(op),
        .dir(dir),
        .result(result),
        .zero(zero),
        .carry(carry),
        .overflow(overflow)
    );

    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, ALU_tb);
    end

    initial begin
        $display("=== ALU Testbench ===");

        repeat (NUM_TESTS) begin
            a   = $urandom_range(0, 2**WIDTH - 1);
            b   = $urandom_range(0, 2**WIDTH - 1);
            op  = $urandom_range(0, 5);
            dir = $urandom_range(0, 1);
            #5;
            $display("a=%0d b=%0d op=%0d dir=%0b -> result=%0d carry=%0b zero=%0b overflow=%0b",
                      a, b, op, dir, result, carry, zero, overflow);
        end

        $display("=== Test Complete ===");
        $finish;
    end

endmodule
