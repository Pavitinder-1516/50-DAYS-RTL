module encoder_4_2(i0,i1,i2,i3,y0,y1);

input i0,i1,i2,i3;
output reg y0,y1;

always @(*) begin

    y0 = 0;
    y1 = 0;

    case({i3,i2,i1,i0})
        4'b0001: begin y1=0; y0=0; end
        4'b0010: begin y1=0; y0=1; end
        4'b0100: begin y1=1; y0=0; end
        4'b1000: begin y1=1; y0=1; end
    endcase

end

endmodule
