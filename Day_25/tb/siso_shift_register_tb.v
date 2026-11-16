
module siso_shift_register_tb;

    reg clk, rst, serial_in;
    wire serial_out;

    siso_shift_register uut (
        .clk(clk),
        .rst(rst),
        .serial_in(serial_in),
        .serial_out(serial_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $dumpfile("siso_shift_register.vcd");
        $dumpvars(0, siso_shift_register_tb);

        clk = 0;
        rst = 1;
        serial_in = 0;

        // Reset
        @(negedge clk);
        rst = 0;

        // Serial input sequence: 1, 0, 1, 1
        serial_in = 1;
        @(posedge clk); #1;
        $display("Shift Reg = %b, Serial Out = %b", uut.shift_reg, serial_out);

        @(negedge clk);
        serial_in = 0;
        @(posedge clk); #1;
        $display("Shift Reg = %b, Serial Out = %b", uut.shift_reg, serial_out);

        @(negedge clk);
        serial_in = 1;
        @(posedge clk); #1;
        $display("Shift Reg = %b, Serial Out = %b", uut.shift_reg, serial_out);

        @(negedge clk);
        serial_in = 1;
        @(posedge clk); #1;
        $display("Shift Reg = %b, Serial Out = %b", uut.shift_reg, serial_out);

        // Additional clock cycles to observe serial output
        repeat (4) begin
            @(posedge clk); #1;
            $display("Shift Reg = %b, Serial Out = %b", uut.shift_reg, serial_out);
        end

        $finish;
    end

endmodule
