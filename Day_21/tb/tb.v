
`timescale 1ns / 1ps

module d_flip_flop_tb;

    reg clk;
    reg rst;
    reg D;
    wire Q;

    // Instantiate DUT
    d_flip_flop uut (
        .clk(clk),
        .rst(rst),
        .D(D),
        .Q(Q)
    );

    // Clock generation: 10 ns period
    always #5 clk = ~clk;

    initial begin
        $dumpfile("d_flip_flop.vcd");
        $dumpvars(0, d_flip_flop_tb);

        $monitor(
            "Time=%0t | clk=%b rst=%b D=%b Q=%b",
            $time, clk, rst, D, Q
        );

        // Initialize signals
        clk = 0;
        rst = 1;
        D = 0;

        // Apply synchronous reset
        @(posedge clk);
        #1 rst = 0;

        // Test 1: Capture D = 1
        D = 1;
        @(posedge clk);
        #1;

        // Test 2: Change D between clock edges
        D = 0;
        #2;

        // Test 3: Capture D = 0
        @(posedge clk);
        #1;

        // Test 4: Capture D = 1 again
        D = 1;
        @(posedge clk);
        #1;

        // Test 5: Apply reset
        rst = 1;
        @(posedge clk);
        #1;

        rst = 0;
        D = 1;
        @(posedge clk);
        #1;

        $display("D Flip-Flop testing completed.");
        $finish;
    end

endmodule

