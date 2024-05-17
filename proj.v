module proj(
      input signed [15:0] data_in,b0,b1,b2,b3,b4,b5,b6,b7,b8,a1,a2,a3,a4,a5,a6,
      input reset,clk,
      input [3:0]order,
      output reg signed [15:0] data_out
);
wire signed [15:0] out2,out3,out1;
reg r1,r2,r3;
always @(*) begin
    if (~reset) begin
        data_out=0;
        r1 = 4'b0;  
        r2 = 4'b0;
        r3 = 4'b0;
    end
    else    begin
        case (order)
        4'd1: begin
            r1=1'b1;
            r2=1'b0;
            r3=1'b0;
            data_out=out1;
        end
        4'd2: begin
            r1=1'b1;
            r2=1'b1;
            r3=1'b0;
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
            r2 = 4'b0;
            r3 = 4'b0;
            data_out=0;
        end
        endcase
    end
end

uart_rx uart_rx_inst (
    .clk(clk),
    .reset(reset),
    .rx_data(rx_data),
    .data_out(data_in)
);

IIR i1(data_in, b0, b1, b2, a1, a2, reset, clk, out1);
IIR i2(out1, b3, b4, b5, a3, a4, r2, clk, out2);
IIR i3(out2, b6, b7, b8, a5, a6, r3, clk, out3);

uart_tx uart_tx_inst (
    .clk(clk),
    .reset(reset),
    .data_in(out3),
    .tx_data(tx_data)
);

endmodule
