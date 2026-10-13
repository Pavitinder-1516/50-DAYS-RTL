module cla #(parameter n=4)(
input [n-1:0]a,b,
input cin,
output[n-1:0]s,
output cout);


wire [n-1:0] P,G;

assign P=a^b;
assign G=a&b;

wire c1,c2,c3,c4;

assign c1=G[0] | (P[0]&cin);
assign c2=G[1] | (P[1]&G[0] | (P[1]&P[0]&cin);
assign c3=G[2] | (P[2]&G[1]) | (P[2]&P[1]&G[0]) | (P[2]&P[1]&P[0]&cin);
assign c4=G[3] | (P[3]&G[2]) | (P[3]&P[2]&G[1]) | (P[3]&P[2]&P[1]&G[0]) | (P[3]>

assign s[0]=P[0]^cin;
assign s[1]=P[1]^c1;
assign s[2]=P[2]^c2;
assign s[3]=P[3]^c3;

assign cout =c4;
endmodule
