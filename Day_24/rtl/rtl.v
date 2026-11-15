
module register_4bit (
    input wire clk,
    input wire rst,
    input wire en,
    input wire [3:0] data_in,
    output reg [3:0] data_out
);

    always @(posedge clk) begin
        if (rst)
            data_out <= 4'b0000;
        else if (en)
            data_out <= data_in;
    end

endmodule
