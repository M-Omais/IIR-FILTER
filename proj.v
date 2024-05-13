module proj(
      input [15:0] data_in,b0,b1,b2,a1,a2,a3,
      input reset,clk,
      input [3:0]order,
      output reg [15:0] data_out
);
wire [15:0] out2,out3,out1;
reg r1,r2,r3;
always @(*) begin
    case (order)
        4'd1: begin
            r1=1'b0;
            r2=1'b1;
            r3=1'b1;
            data_out=out1;
        end
        4'd2: begin
            r1=1'b0;
            r2=1'b0;
            r3=1'b1;
            data_out=out2;
        end
        4'd3: begin
            r1=1'b1;
            r2=1'b1;
            r3=1'b1;
            data_out=out3;
        end
        default: begin
            r1 = 4'b0;
            r1 = 4'b0;
            r1 = 4'b0;
            data_out=0;
        end
    endcase
end
IIR i1(data_in,16'b0000100000000000,b0,a1,reset,clk,out1);
IIR i2(out1,16'b0000100000000000,b1,a2,r2,clk,out2);
IIR i3(out2,16'b0000100000000000,b2,a3,r3,clk,out3);
endmodule