module IIR (
    input [15:0] x,
    input reset,clk,
    output  [15:0] y
);
reg [15:0] x1,x2,y1,t1;
wire [15:0] p1,p2,p3;
parameter
a0 =16'b1111100111110110,
a1 =16'b0000010000010100,
b1 =16'b0000011000001010;
multiplier m1(b1,x,p1);
multiplier m2(a1,x1,p2);
multiplier m3(y1,b1,p3);
   assign y=p1+p2-p3;
always @(posedge clk or negedge reset) begin
    if (!reset) begin
        x1<=0;
        y1<=0; 
        t1<=0; 
    end
    else begin 
    t1<=x;
    x1<=t1;
    y1<=y;

    end
end
endmodule