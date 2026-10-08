module tb_decoder_2_4;

reg a,b;
wire y0,y1,y2,y3;

decoder_2_4 dut (.a(a),.b(b),.y0(y0),.y1(y1),.y2(y2),.y3(y3));

initial begin

    $dumpfile("wave.vcd");
    $dumpvars(0,tb_decoder_2_4);

    a=0; b=0; #1;
    a=0; b=1; #1;
    a=1; b=0; #1;
    a=1; b=1; #1;

    $finish;

end

endmodule
