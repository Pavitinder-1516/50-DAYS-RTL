
module parity_generator (
    input  wire [3:0] data_in,
    input  wire       parity_mode, // 0 = Even, 1 = Odd
    output wire       parity_bit
);

assign parity_bit = ^data_in ^ parity_mode;

endmodule

