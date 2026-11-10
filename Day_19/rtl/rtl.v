
module multi_operand_adder (
    input  wire [3:0] A,
    input  wire [3:0] B,
    input  wire [3:0] C,
    input  wire [3:0] D,
    output wire [5:0] sum
);

assign sum = {2'b00, A}
           + {2'b00, B}
           + {2'b00, C}
           + {2'b00, D};

endmodule

