module register #(
    parameter width=16
) (
    input [width-1:0] D,
    input clk,enable,
    output reg [width-1:0] Q
);
 always @(posedge clk or enable) begin
    if (enable) begin
    Q <= D;        
    end
    else Q<=0;
 end    
endmodule
