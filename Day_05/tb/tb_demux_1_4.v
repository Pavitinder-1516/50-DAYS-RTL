module tb_demux_1_4;

reg i,s0,s1;
wire y0,y1,y2,y3;

demux_1_4 dut (.i(i),.s0(s0),.s1(s1),
                .y0(y0),.y1(y1),.y2(y2),.y3(y3));

initial begin

    $dumpfile("wave.vcd");
    $dumpvars(0,tb_demux_1_4);

    i=1; s1=0; s0=0; #1;
    i=1; s1=0; s0=1; #1;
    i=1; s1=1; s0=0; #1;
    i=1; s1=1; s0=1; #1;

    $finish;

end

endmodule
