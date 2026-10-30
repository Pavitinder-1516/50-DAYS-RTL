
`timescale 1ns / 1ps

module parity_generator_tb;

    reg  [3:0] data_in;
    reg        parity_mode;
    wire       parity_bit;

    parity_generator uut (
        .data_in(data_in),
        .parity_mode(parity_mode),
        .parity_bit(parity_bit)
    );

    integer i;

    initial begin
        $dumpfile("parity_generator.vcd");
        $dumpvars(0, parity_generator_tb);

        $monitor(
            "Time=%0t | Data=%b | Mode=%b | Parity=%b",
            $time, data_in, parity_mode, parity_bit
        );

        // Test all 16 inputs in even and odd modes
        for (i = 0; i < 16; i = i + 1) begin
            data_in = i;
            parity_mode = 0;
            #10;

            parity_mode = 1;
            #10;
        end

        $display("Parity generator testing completed.");
        $finish;
    end

endmodule

