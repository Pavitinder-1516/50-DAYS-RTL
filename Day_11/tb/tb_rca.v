module tb_rca;
reg [3:0] A, B;
reg Cin;
wire [3:0] Sum;
wire Cout;
rca uut (.A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout));
initial begin
    $dumpfile("rca.vcd");
    $dumpvars(0, tb_rca);
    A = 4'd0;  B = 4'd0;  Cin = 0;
    #10;
    A = 4'd5;  B = 4'd3;  Cin = 0;
    #10;
    A = 4'd7;  B = 4'd8;  Cin = 1;
    #10;
    A = 4'd15; B = 4'd1;  Cin = 0;
   #10;
    A = 4'd15; B = 4'd15; Cin = 1;
    #10;
    $finish;
end
endmodule

