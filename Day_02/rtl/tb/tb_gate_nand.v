module tb_gate_nand;

reg a,b;
wire y;

gate_nand dut (.a(a), .b(b), .y(y));

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb_gate_nand);

    #1 {a,b} = 2'b00;
    #1 {a,b} = 2'b01;
    #1 {a,b} = 2'b10;
    #1 {a,b} = 2'b11;

    #1 $finish;
end

endmodule
