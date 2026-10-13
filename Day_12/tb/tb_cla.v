module tb_cla;
parameter n=4;
reg [n-1:0] a,b;
reg cin;
wire [n-1:0] s;
wire cout ;


cla  #(.n(n)) dut (.a(a),.b(b),.s(s),.cin(cin),.cout(cout));

initial begin
$dumpfile("cla.vcd");
$dumpvars(0,tb_cla);
#1;
{a,b,cin}=9'b000000000;
#1;
{a,b,cin}=9'b001111010;
#1;
{a,b,cin}=9'b101010010;
#1;
{a,b,cin}=9'b101110010;
#1;
{a,b,cin}=9'b011011100;
#1;
$finish;
end 
endmodule
