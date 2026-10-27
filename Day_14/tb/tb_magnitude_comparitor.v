
`timescale 1ns / 1ps

module comparator_4bit_tb;

    reg  [3:0] A;
    reg  [3:0] B;

    wire A_gt_B;
    wire A_lt_B;
    wire A_eq_B;

    // Instantiate the DUT
    comparator_4bit uut (
        .A(A),
        .B(B),
        .A_gt_B(A_gt_B),
        .A_lt_B(A_lt_B),
        .A_eq_B(A_eq_B)
    );

    initial begin
        $dumpfile("comparator_4bit.vcd");
        $dumpvars(0, comparator_4bit_tb);

        $monitor(
            "Time=%0t | A=%b (%0d) | B=%b (%0d) | GT=%b LT=%b EQ=%b",
            $time, A, A, B, B, A_gt_B, A_lt_B, A_eq_B
        );

        // Test 1: A > B
        A = 4'b1010; B = 4'b0101;
        #10;

        // Test 2: A < B
        A = 4'b0011; B = 4'b0110;
        #10;

        // Test 3: A == B
        A = 4'b1100; B = 4'b1100;
        #10;

        // Test 4: Maximum A, minimum B
        A = 4'b1111; B = 4'b0000;
        #10;

        // Test 5: Minimum A, maximum B
        A = 4'b0000; B = 4'b1111;
        #10;

        // Test 6: Both inputs zero
        A = 4'b0000; B = 4'b0000;
        #10;

        // Test 7: Adjacent values
        A = 4'b0110; B = 4'b0101;
        #10;

        $display("All comparator test cases completed.");
        $finish;
    end

endmodule

