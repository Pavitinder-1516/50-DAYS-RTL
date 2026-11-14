
module t_flip_flop_tb;

    reg clk, rst, T;
    wire Q;

    t_flip_flop uut (
        .clk(clk),
        .rst(rst),
        .T(T),
        .Q(Q)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $dumpfile("t_flip_flop.vcd");
        $dumpvars(0, t_flip_flop_tb);

        clk = 0;
        rst = 1;
        T = 0;

        // Reset
        @(negedge clk);
        rst = 0;

        // Hold
        T = 0;
        @(posedge clk); #1;
        $display("Hold: Q = %b", Q);

        // Toggle
        @(negedge clk);
        T = 1;
        @(posedge clk); #1;
        $display("Toggle: Q = %b", Q);

        // Toggle again
        @(negedge clk);
        @(posedge clk); #1;
        $display("Toggle again: Q = %b", Q);

        // Hold
        @(negedge clk);
        T = 0;
        @(posedge clk); #1;
        $display("Hold: Q = %b", Q);

        // Toggle
        @(negedge clk);
        T = 1;
        @(posedge clk); #1;
        $display("Toggle: Q = %b", Q);

        $finish;
    end

endmodule

