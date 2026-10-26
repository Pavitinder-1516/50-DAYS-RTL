
`timescale 1ns / 1ps

module alu_4bit_tb;

    reg  [3:0] A;
    reg  [3:0] B;
    reg  [2:0] sel;
    wire [3:0] result;
    wire       carry_out;

    // Instantiate the DUT
    alu_4bit uut (
        .A(A),
        .B(B),
        .sel(sel),
        .result(result),
        .carry_out(carry_out)
    );

    initial begin
        $dumpfile("alu_4bit.vcd");
        $dumpvars(0, alu_4bit_tb);

        $monitor(
            "Time=%0t | A=%b B=%b sel=%b | result=%b carry_out=%b",
            $time, A, B, sel, result, carry_out
        );

        // Test 1: Addition
        A = 4'b1010; B = 4'b0011; sel = 3'b000;
        #10;

        // Test 2: Addition with carry
        A = 4'b1111; B = 4'b0001; sel = 3'b000;
        #10;

        // Test 3: Subtraction
        A = 4'b1010; B = 4'b0011; sel = 3'b001;
        #10;

        // Test 4: AND
        A = 4'b1010; B = 4'b0011; sel = 3'b010;
        #10;

        // Test 5: OR
        A = 4'b1010; B = 4'b0011; sel = 3'b011;
        #10;

        // Test 6: XOR
        A = 4'b1010; B = 4'b0011; sel = 3'b100;
        #10;

        // Test 7: NOT A
        A = 4'b1010; B = 4'b0000; sel = 3'b101;
        #10;

        // Test 8: Left shift
        A = 4'b1010; B = 4'b0000; sel = 3'b110;
        #10;

        // Test 9: Right shift
        A = 4'b1010; B = 4'b0000; sel = 3'b111;
        #10;

        // Test 10: Subtraction underflow
        A = 4'b0010; B = 4'b0101; sel = 3'b001;
        #10;

        $display("All ALU test cases completed.");

        $finish;
    end

endmodule

