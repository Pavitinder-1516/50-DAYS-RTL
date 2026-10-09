module pri_encoder_2_4(y0,y1,i0,i1,i2,i3,val);

input i0,i1,i2,i3,val;

output reg y0,y1;

always @(i0,i1,i2,i3,val) begin

if (val==1) begin

casex({i0,i1,i2,i3})

4'b1xxx:{y0,y1}=2'b11;

4'b01xx:{y0,y1}=2'b10;

4'b001x:{y0,y1}=2'b01;

4'b0001:{y0,y1}=2'b00;

default:{y0,y1}=2'bxx;

endcase

end

else begin

{y0,y1}=2'bxx;

end

end

endmodule


