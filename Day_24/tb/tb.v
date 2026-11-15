
module register_4bit_tb;

    reg clk, rst, en;
    reg [3:0] data_in;
    wire [3:0] data_out;

    register_4bit uut (
        .clk(clk),
        .rst(rst),
        .en(en),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $dumpfile("register_4bit.vcd");
        $dumpvars(0, register_4bit_tb);

        clk = 0;
        rst = 1;
        en = 0;
        data_in = 4'b0000;

        // Reset
        @(negedge clk);
        rst = 0;

        // Load first data
        en = 1;
        data_in = 4'b1010;
        @(posedge clk); #1;
        $display("Data loaded: %b", data_out);

        // Load second data
        @(negedge clk);
        data_in = 4'b1100;
        @(posedge clk); #1;
        $display("Data loaded: %b", data_out);

        // Disable enable - hold previous data
        @(negedge clk);
        en = 0;
        data_in = 4'b0011;
        @(posedge clk); #1;
        $display("Data held: %b", data_out);

        // Enable again
        @(negedge clk);
        en = 1;
        @(posedge clk); #1;
        $display("Data loaded: %b", data_out);

        // Apply reset
        @(negedge clk);
        rst = 1;
        @(posedge clk); #1;
        $display("After reset: %b", data_out);

        $finish;
    end

endmodule
