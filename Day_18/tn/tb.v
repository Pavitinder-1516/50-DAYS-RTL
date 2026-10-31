
`timescale 1ns / 1ps

module binary_to_gray_tb;

    reg  [3:0] binary;
    wire [3:0] gray;

    integer i;

    // Instantiate the DUT
    binary_to_gray uut (
        .binary(binary),
        .gray(gray)
    );

    initial begin
        $dumpfile("binary_to_gray.vcd");
        $dumpvars(0, binary_to_gray_tb);

        $monitor(
            "Time=%0t | Binary=%b | Gray=%b",
            $time, binary, gray
        );

        // Test all 16 possible input combinations
        for (i = 0; i < 16; i = i + 1) begin
            binary = i;
            #10;
        end

        $display("All Binary-to-Gray test cases completed.");

        $finish;
    end

endmodule

