module tb_full_adder;
reg a,b,cin;
wire s,c;
full_adder uut(.a(a),.b(b),.cin(cin),.s(s),.c(c));
initial begin
$dumpfile("wave.vcd");
$dumpfile(0,tb_full_adder);
#1
{a,b,cin}=3'b000;
#1
{a,b,cin}=3'b001;
#1
{a,b,cin}=3'b010;
#1
{a,b,cin}=3'b011;
#1
{a,b,cin}=3'b100;
#1
{a,b,cin}=3'b101;
#1
{a,b,cin}=3'b110;
#1
{a,b,cin}=3'b111;
#1
$finish;
end
endmodule
