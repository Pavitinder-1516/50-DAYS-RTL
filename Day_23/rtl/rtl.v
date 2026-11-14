
module t_flip_flop (
    input wire clk,
    input wire rst,
    input wire T,
    output reg Q
);

    always @(posedge clk) begin
        if (rst)
            Q <= 1'b0;
        else if (T)
            Q <= ~Q;       // Toggle
        else
            Q <= Q;        // Hold
    end

endmodule

