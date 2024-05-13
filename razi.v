// module project3(
//     input wire signed [15:0] x,
//     input reset,clk,
//     input wire signed [15:0] a1, input wire signed [15:0] a2,input wire signed [15:0] b0,input wire signed [15:0] b1,
//     input wire signed [15:0] b2,output reg signed [15:0] y
    
// );  
//     reg signed [15:0] z1; reg signed [15:0] z2;
//     wire signed [15:0] p1;wire signed [15:0] p2;wire signed [15:0] p3;wire signed [15:0] p4;wire signed [15:0] p5;
//     wire signed [15:0] a_1 = -a1;
//     wire signed [15:0] a_2 = -a2;
//     multiplier m1(b0,x,p1);
//     multiplier m2(b1,x,p2);
//     multiplier m3(b2,x,p3);
//     multiplier m4(a_1,y,p4);
//     multiplier m5(a_2,y,p5);
// always @(posedge clk,negedge reset ) begin
//     if(!reset) begin
//         z1 <= 0;
//         z2 <= 0;
//     end
// 	 else begin
//   z1 <= p3+p5;
//   z2 <= z1+p4+p2;
// end
// end
// always @(*) begin
//     y=z2+p1;
// end
// endmodule

// module multiplier (
//     input wire signed[15:0] a1, input wire signed [15:0] x,output reg signed [15:0] y
// );
//     reg signed [20:0] product;
//     always@(*) begin
//         product = a1*x;
//         y = product[20:8];
//     end
// endmodule