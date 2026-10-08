module tb_mux_2_1;

reg i0,i1,s;
wire y;

multiplexer_2_1 dut (.i0(i0),.i1(i1),.y(y),.s(s));

initial begin

    $dumpfile("wave.vcd");
    $dumpvars(0,tb_mux_2_1);

    i0=0; i1=1; s=0; #1;
    i0=0; i1=1; s=1; #1;

    $finish;

end

endmodule
