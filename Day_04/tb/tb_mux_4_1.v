module tb_mux_4_1;

reg i0,i1,i2,i3,s0,s1;
wire y;

mux_4_1 dut (.i0(i0),.i1(i1),.i2(i2),.i3(i3),
                     .s0(s0),.s1(s1),.y(y));

initial begin

    $dumpfile("wave.vcd");
    $dumpvars(0,tb_mux_4_1);

    i0=0; i1=1; i2=0; i3=1; s1=0; s0=0; #1;
    i0=0; i1=1; i2=0; i3=1; s1=0; s0=1; #1;
    i0=0; i1=1; i2=0; i3=1; s1=1; s0=0; #1;
    i0=0; i1=1; i2=0; i3=1; s1=1; s0=1; #1;

    $finish;

end

endmodule
