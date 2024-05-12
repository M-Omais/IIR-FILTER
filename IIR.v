module IIR (
    input [15:0] x,
    input reset,clk,
    output reg [15:0] y
);
reg [15:0] x1,x2,y1,t1,t2,o1,o2;
wire [15:0] p1,p2,p3;
parameter
a0 =16'b1111100111110110,
a1 =16'b0000010000010100,
b1 =16'b0000011000001010;
multiplier m1(b1,t2,p1);
multiplier m2(b1,x1,p2);
multiplier m3(y,a1,p3);
// register r1(o1,clk,reset,t2);
// register r4(t2,clk,reset,y);
// register r2(x,clk,reset,t1);
// register r3(t1,clk,reset,x1);
// assign o1=p1+p2-p3;
always @(posedge clk or negedge reset) begin
    if (!reset) begin
        y<=0;
        x1<=0;
        y1<=0;
        t1<=0;
        t2<=0;
        o1<=0;
        o2<=0;
    end
    else begin
    o1<=p1+p2;
    y<=o1-p3;
    y1<=y;
    t1<=x;
    t2<=t1;
    x1<=t2;
    end
end
endmodule