
module binary_tree_adder (
    input  wire [3:0] A,
    input  wire [3:0] B,
    input  wire [3:0] C,
    input  wire [3:0] D,
    output wire [5:0] sum
);

    // Intermediate sums (5 bits each)
    wire [4:0] sum1;
    wire [4:0] sum2;

    // Stage 1: Parallel pairwise addition
    assign sum1 = {1'b0, A} + {1'b0, B};
    assign sum2 = {1'b0, C} + {1'b0, D};

    // Stage 2: Final addition
    assign sum = {1'b0, sum1} + {1'b0, sum2};

endmodule

