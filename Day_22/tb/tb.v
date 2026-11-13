
module jk_flip_flop_tb;

    reg clk, rst, J, K;
    wire Q;

    jk_flip_flop uut (
        .clk(clk),
        .rst(rst),
        .J(J),
        .K(K),
        .Q(Q)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $dumpfile("jk_flip_flop.vcd");
        $dumpvars(0, jk_flip_flop_tb);

        clk = 0;
        rst = 1;
        J = 0;
        K = 0;

        // Reset
        @(negedge clk);
        rst = 0;

        // Hold
        J = 0; K = 0;
        @(posedge clk); #1;
        $display("Hold: Q = %b", Q);

        // Set
        @(negedge clk);
        J = 1; K = 0;
        @(posedge clk); #1;
        $display("Set: Q = %b", Q);

        // Reset
        @(negedge clk);
        J = 0; K = 1;
        @(posedge clk); #1;
        $display("Reset: Q = %b", Q);

        // Toggle
        @(negedge clk);
        J = 1; K = 1;
        @(posedge clk); #1;
        $display("Toggle: Q = %b", Q);

        // Toggle again
        @(negedge clk);
        J = 1; K = 1;
        @(posedge clk); #1;
        $display("Toggle again: Q = %b", Q);

        $finish;
    end

endmodule
