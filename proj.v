module proj(
      input [15:0] address,
      input [15:0] data_in,
      input write_enable, input reset, input clk,
      output [15:0] data_out
);
wire [15:0] coeff_x0 =16'b0000100000000000; wire [15:0] coeff_x1=16'b0001000000000000; wire [15:0] coeff_x2=16'b0001100000000000; wire [15:0] coeff_x3=16'b0010000000000000; wire [15:0] coeff_x4=16'b0010100000000000;
     wire [15:0] coeff_x5=16'b0011000000000000;wire [15:0] coeff_y1=16'b0011100000000000; wire [15:0] coeff_y2=16'b0100000000000000; wire [15:0] coeff_y3=16'b0100000000000000;
parameter [3:0] order=4'b0011;
reg [15:0] ram [0:255];wire [12:0] delay_1y;wire [12:0] delay_2y;//wire [12:0] delay_3y;
/*reg signed [12:0] delay_4y;reg signed [12:0] delay_5y;reg signed [12:0] delay_6y;reg signed [12:0] delay_7y;reg signed [12:0] delay_8y;
reg signed [12:0] delay_9y;reg signed [12:0] delay_10y;reg signed [12:0] delay_11y;reg signed [12:0] delay_12y;reg signed [12:0] delay_13y;
reg signed [12:0] delay_14y;*/
always @(posedge clk,negedge reset) begin
    if (!reset) begin 
	    ram[0] <= 16'd0;
        ram[1] <= 16'd0;
        ram[2] <= 16'd0;
        ram[3] <= 16'd0; 
        ram[4] <= 16'd0;
        ram[5] <= 16'd0;
        ram[6] <= 16'd0;
        ram[7] <= 16'd0;
        ram[8] <= 16'd0;
        ram[9] <= 16'd0;
        ram[10] <= 16'd0;
        ram[11] <= 16'd0;
        ram[12] <= 16'd0;
        ram[13] <= 16'd0;
        ram[14] <= 16'd0;
        ram[15] <= 16'd0;
        ram[16] <= 16'd0;
        ram[17] <= 16'd0;
        ram[18] <= 16'd0;
        ram[19] <= 16'd0;
        ram[20] <= 16'd0;
        ram[21] <= 16'd0;
        ram[22] <= 16'd0;
        ram[23] <= 16'd0;
        ram[24] <= 16'd0;
        ram[25] <= 16'd0;
        ram[26] <= 16'd0;
        ram[27] <= 16'd0;
        ram[28] <= 16'd0;
        ram[29] <= 16'd0;
    end
    else if (write_enable) begin
        
        ram[0] <= coeff_x0;
        ram[1] <= coeff_x1;
        ram[2] <= coeff_x2;
        ram[3] <= coeff_x3; 
        ram[4] <= coeff_x4;
        ram[5] <= coeff_x5;
        /*ram[6] <= coeff_x6;
        ram[7] <= coeff_x7;
        ram[8] <= coeff_x8;
        ram[9] <= coeff_x9;
        ram[10] <= coeff_x10;
        ram[11] <= coeff_x11;
        ram[12] <= coeff_x12;
        ram[13] <= coeff_x13;
        ram[14] <= coeff_x14;*/
        ram[15] <= coeff_y1;
        ram[16] <= coeff_y2;
        ram[17] <= coeff_y3;
        /*ram[18] <= coeff_y4;
        ram[19] <= coeff_y5;
        ram[20] <= coeff_y6;
        ram[21] <= coeff_y7;
        ram[22] <= coeff_y8;
        ram[23] <= coeff_y9;
        ram[24] <= coeff_y10;
        ram[25] <= coeff_y11;
        ram[26] <= coeff_y12;
        ram[27] <= coeff_y13;
        ram[28] <= coeff_y14;*/
        ram[29] <= data_out;
   
    end 
    end
        generate
        if (order == 4'b0011) begin
            IIR r1(
                .x(data_in),
                .reset(reset),
                .clk(clk),
                .a0(ram[0]),
                .a1(ram[1]),
                .b1(ram[15]),
                .y(data_out)
            );
            IIR r2(
                .x(data_out),
                .reset(reset),
                .clk(clk),
                .a0(ram[2]),
                .a1(ram[3]),
                .b1(ram[16]),
                .y(delay_1y)
            );
            IIR r3(
                .x(delay_1y),
                .reset(reset),
                .clk(clk),
                .a0(ram[4]),
                .a1(ram[5]),
                .b1(ram[17]),
                .y(delay_2y)
            );
        end
        
    endgenerate
	 endmodule
	 
	 module IIR (
    input [15:0] x,
    input reset,clk,
    input wire [15:0] a0,a1,b1,
    output  [15:0] y
);
reg [15:0] x1,x2,y1,t1;
wire [15:0] p1,p2,p3;
//parameter
//a0 =16'b1111100111110110,
//a1 =16'b0000010000010100,
//b1 =16'b0000011000001010;
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

module multiplier (
    input [15:0] a,b,
    output [15:0] p
);
  wire [31:0] temp_product;
   assign temp_product = a * b;
   assign p = temp_product[26:11];
    
endmodule