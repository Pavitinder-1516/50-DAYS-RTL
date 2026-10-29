
module barrel_shifter_4bit (
    input  wire [3:0] data_in,
    input  wire [1:0] shift_amt,
    input  wire       dir,       // 0 = Left, 1 = Right
    output reg  [3:0] data_out
);

always @(*) begin
    case (dir)
        1'b0: data_out = data_in << shift_amt; // Left shift
        1'b1: data_out = data_in >> shift_amt; // Right shift
        default: data_out = 4'b0000;
    endcase
end

endmodule

