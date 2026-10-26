
module alu_4bit (
    input  wire [3:0] A,
    input  wire [3:0] B,
    input  wire [2:0] sel,
    output reg  [3:0] result,
    output reg        carry_out
);

always @(*) begin
    // Default values prevent unintended latches
    result    = 4'b0000;
    carry_out = 1'b0;

    case (sel)
        3'b000: begin
            // Addition
            {carry_out, result} = {1'b0, A} + {1'b0, B};
        end

        3'b001: begin
            // Subtraction: A - B
            result = A - B;
        end

        3'b010: begin
            // Bitwise AND
            result = A & B;
        end

        3'b011: begin
            // Bitwise OR
            result = A | B;
        end

        3'b100: begin
            // Bitwise XOR
            result = A ^ B;
        end

        3'b101: begin
            // Bitwise NOT of A
            result = ~A;
        end

        3'b110: begin
            // Logical left shift by 1
            result = A << 1;
        end

        3'b111: begin
            // Logical right shift by 1
            result = A >> 1;
        end

        default: begin
            result    = 4'b0000;
            carry_out = 1'b0;
        end
    endcase
end

endmodule

