// File: alu.v
// 8-bit ALU module supporting ADD, SUB, AND, OR, XOR, SHIFT operations.

module ALU #(
    parameter WIDTH = 8
)(
    input  logic [WIDTH-1:0] a, b,
    input  logic [2:0] op,          // 3-bit opcode
    input  logic dir,              // shift direction: 0 = left, 1 = right
    output logic [WIDTH-1:0] result,
    output logic zero, carry, overflow
);

    logic [WIDTH:0] tmp_result;

    always_comb begin
        carry     = 0;
        overflow  = 0;
        tmp_result = 0;

        case (op)
            3'b000: begin // ADD
                tmp_result = a + b;
                result     = tmp_result[WIDTH-1:0];
                carry      = tmp_result[WIDTH];
                overflow   = (a[WIDTH-1] == b[WIDTH-1]) && (result[WIDTH-1] != a[WIDTH-1]);
            end
            3'b001: begin // SUB
                tmp_result = a - b;
                result     = tmp_result[WIDTH-1:0];
                carry      = a < b;
                overflow   = (a[WIDTH-1] != b[WIDTH-1]) && (result[WIDTH-1] != a[WIDTH-1]);
            end
            3'b010: result = a & b;  // AND
            3'b011: result = a | b;  // OR
            3'b100: result = a ^ b;  // XOR
            3'b101: result = dir ? (a >> 1) : (a << 1); // SHIFT
            default: result = '0;
        endcase

        zero = (result == 0);
    end
endmodule
