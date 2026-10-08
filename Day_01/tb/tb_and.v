module tb_and;
  reg a,b;
  wire y;
  module and dut (.a(a),.b(b),.y(y))
    initial begin
      #1
      {a,b}=2'b00;
      
      #1
      {a,b}=2'b01;
      
      #1
      {a,b}=2'b10;
      
      #1
      {a,b}=2'b11;
    end
  endmodule
      
