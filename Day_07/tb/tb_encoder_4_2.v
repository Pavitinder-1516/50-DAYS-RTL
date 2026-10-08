module tb_encoder_4_2;

reg i0,i1,i2,i3;
wire y0,y1;

encoder_4_2 dut (.i0(i0),.i1(i1),.i2(i2),.i3(i3),
                 .y0(y0),.y1(y1));

initial begin

    $dumpfile("wave.vcd");
    $dumpvars(0,tb_encoder_4_2);

    i3=0; i2=0; i1=0; i0=1; #1;
    i3=0; i2=0; i1=1; i0=0; #1;
    i3=0; i2=1; i1=0; i0=0; #1;
    i3=1; i2=0; i1=0; i0=0; #1;

    $finish;

end

endmodule
