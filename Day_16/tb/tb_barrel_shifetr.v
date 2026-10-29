
`timescale 1ns / 1ps

module barrel_shifter_4bit_tb;

    reg  [3:0] data_in;
    reg  [1:0] shift_amt;
    reg        dir;
    wire [3:0] data_out;

    // Instantiate the DUT
    barrel_shifter_4bit uut (
        .data_in(data_in),
        .shift_amt(shift_amt),
        .dir(dir),
        .data_out(data_out)
    );

    integer i;
    integer j;

    initial begin
        $dumpfile("barrel_shifter_4bit.vcd");
        $dumpvars(0, barrel_shifter_4bit_tb);

        $monitor(
            "Time=%0t | data_in=%b | dir=%b | shift_amt=%0d | data_out=%b",
            $time, data_in, dir, shift_amt, data_out
        );

        // Test left and right shifts for all shift amounts
        data_in = 4'b1011;

        for (i = 0; i < 2; i = i + 1) begin
            dir = i;

            for (j = 0; j < 4; j = j + 1) begin
                shift_amt = j;
                #10;
            end
        end

        // Test all-zero input
        data_in = 4'b0000;
        dir = 1'b0;
        shift_amt = 2'd1;
        #10;

        // Test all-one input
        data_in = 4'b1111;
        dir = 1'b1;
        shift_amt = 2'd2;
        #10;

        // Test MSB boundary
        data_in = 4'b1000;
        dir = 1'b0;
        shift_amt = 2'd1;
        #10;

        // Test LSB boundary
        data_in = 4'b0001;
        dir = 1'b1;
        shift_amt = 2'd1;
        #10;

        $display("All barrel shifter test cases completed.");
        $finish;
    end

endmodule

