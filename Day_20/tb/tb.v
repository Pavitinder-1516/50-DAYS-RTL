
`timescale 1ns / 1ps

module binary_tree_adder_tb;

    reg  [3:0] A, B, C, D;
    wire [5:0] sum;

    integer i;
    integer expected;

    // Instantiate DUT
    binary_tree_adder uut (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .sum(sum)
    );

    task check_result;
        begin
            expected = A + B + C + D;

            #1;

            if (sum !== expected)
                $display("FAIL | A=%d B=%d C=%d D=%d | Expected=%d Got=%d",
                         A, B, C, D, expected, sum);
            else
                $display("PASS | A=%d B=%d C=%d D=%d | SUM=%d",
                         A, B, C, D, sum);
        end
    endtask

    initial begin
        $dumpfile("binary_tree_adder.vcd");
        $dumpvars(0, binary_tree_adder_tb);

        // Test 1: All zeros
        A=0; B=0; C=0; D=0;
        check_result;

        // Test 2: Different operands
        A=3; B=5; C=2; D=4;
        check_result;

        // Test 3: Maximum possible sum
        A=15; B=15; C=15; D=15;
        check_result;

        // Test 4: Alternating values
        A=15; B=0; C=15; D=0;
        check_result;

        // Test 5: Equal operands
        A=7; B=7; C=7; D=7;
        check_result;

        // Test 6: Boundary values
        A=8; B=4; C=2; D=1;
        check_result;

        // Test 7: Random testing
        for (i=0; i<20; i=i+1) begin
            A=$random;
            B=$random;
            C=$random;
            D=$random;
            check_result;
        end

        $display("--------------------------------");
        $display("Binary Tree Adder Testing Done");
        $display("--------------------------------");

        $finish;
    end

endmodule

