module tb_pri_encoder_2_4;

reg i0,i1,i2,i3,val;

wire y0,y1;



pri_encoder_2_4 dut (.i0(i0),.i1(i1),.i2(i2),.i3(i3),.val(val),.y0(y0),.y1(y1));



initial begin

$dumpfile("pri_encoder.vcd");

$dumpvars(0, tb_pri_encoder_2_4);

$monitor("t=%0t val=%b in=%b%b%b%b  y=%b%b", $time, val, i0, i1, i2, i3, y0, y1);

val=1'b1;

{i0,i1,i2,i3}=4'b1010;

#1 {i0,i1,i2,i3}=4'b0110;

#1 {i0,i1,i2,i3}=4'b0011;

#1 {i0,i1,i2,i3}=4'b0001;

#1 val=1'b0;

#1 $finish;

end

endmodule

