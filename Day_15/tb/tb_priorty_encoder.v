
`timescale 1ns / 1ps

module priority_encoder_tb;

    reg  [3:0] D;
    wire [1:0] Y;
    wire       valid;

    // Instantiate the DUT
    priority_encoder uut (
        .D(D),
        .Y(Y),
        .valid(valid)
    );

    initial begin
        $dumpfile("priority_encoder.vcd");
        $dumpvars(0, priority_encoder_tb);

        $monitor(
            "Time=%0t | D=%b | Y=%b | valid=%b",
            $time, D, Y, valid
        );

        // Test 1: No input active
        D = 4'b0000;
        #10;

        // Test 2: Only D[0] active
        D = 4'b0001;
        #10;

        // Test 3: Only D[1] active
        D = 4'b0010;
        #10;

        // Test 4: Only D[2] active
        D = 4'b0100;
        #10;

        // Test 5: Only D[3] active
        D = 4'b1000;
        #10;

        // Test 6: D[1] and D[0] active
        D = 4'b0011;
        #10;

        // Test 7: D[2], D[1], and D[0] active
        D = 4'b0111;
        #10;

        // Test 8: D[3] and D[0] active
        D = 4'b1001;
        #10;

        // Test 9: All inputs active
        D = 4'b1111;
        #10;

        // Test 10: D[2] and D[0] active
        D = 4'b0101;
        #10;

        $display("All priority encoder test cases completed.");
        $finish;
    end

endmodule

