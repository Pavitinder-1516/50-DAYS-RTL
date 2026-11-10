
`timescale 1ns / 1ps

module multi_operand_adder_tb;

    reg  [3:0] A, B, C, D;
    wire [5:0] sum;

    integer i;

    // Instantiate the DUT
    multi_operand_adder uut (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .sum(sum)
    );

    initial begin
        $dumpfile("multi_operand_adder.vcd");
        $dumpvars(0, multi_operand_adder_tb);

        $monitor(
            "Time=%0t | A=%d B=%d C=%d D=%d | Sum=%d (%b)",
            $time, A, B, C, D, sum, sum
        );

        // Test 1: All zeros
        A = 0; B = 0; C = 0; D = 0;
        #10;

        // Test 2: Different operands
        A = 3; B = 5; C = 2; D = 4;
        #10;

        // Test 3: Maximum possible sum
        A = 15; B = 15; C = 15; D = 15;
        #10;

        // Test 4: Maximum and minimum values
        A = 15; B = 0; C = 15; D = 0;
        #10;

        // Test 5: Equal operands
        A = 7; B = 7; C = 7; D = 7;
        #10;

        // Test 6: Boundary values
        A = 8; B = 4; C = 2; D = 1;
        #10;

        // Test 7: Random combinations
        for (i = 0; i < 10; i = i + 1) begin
            A = $random;
            B = $random;
            C = $random;
            D = $random;
            #10;
        end

        $display("All multi-operand adder tests completed.");
        $finish;
    end

endmodule

