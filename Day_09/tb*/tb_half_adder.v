module tb_half_adder;
reg A,B;
wire S,C;
half_adder dut (.a(A),.b(B),.s(S),.c(C));
initial begin
$dumpfile("wave.vdc");
$dumpvars(0,tb_half_adder);
#1
{A,B}=2'b00;
#1
{A,B}=2'b01;
#1
{A,B}=2'b10;
#1
{A,B}=2'b11;
#1
$finish;
end
endmodule



