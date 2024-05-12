module register #(
    parameter width=16
) (
    input [width-1:0] D,
    input clk,rst,
    output reg [width-1:0] Q
);
 always @(posedge clk or negedge rst) begin
    if (~rst) begin
    Q <= 0;        
    end
    else Q<=D;
 end    
endmodule
