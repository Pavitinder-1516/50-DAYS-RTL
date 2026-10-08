module tb_or_gate;
  reg a,b;
  wire y;

  or_gate dut (.a(a),.b(b),.y(y));

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
  
 


