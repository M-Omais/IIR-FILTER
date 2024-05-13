module proj_tb;

// Inputs
reg [15:0] x, b0, b1, b2,a1,a2,a3;
reg reset, clk;
reg [3:0] order;

// Outputs
wire [15:0] y;

// Instantiate the Unit Under Test (UUT)
proj uut (
    .data_in(x),
    .b0(b0),
    .b1(b1),
    .b2(b2),
    .a1(a1),
    .a2(a1),
    .a3(a2),
    .reset(reset),
    .clk(clk),
    .order(order),
    .data_out(y)
);
// Read input values from file
    integer file_handle,file_output;
    reg [15:0] input_value;
    integer scan_file;
// Clock generation
initial clk = 0;
always #5 clk = ~clk;
    
initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, proj_tb);
    b0 =16'b0000011000001010;
    b1 =16'b0000011000001010;
    b2 =16'b0000011000001010;
    a1 =16'b0000011000001010;
    a2 =16'b0000010000010100;
    a3 =16'b0000010000010100;
    
        // Open the input file
    file_handle = $fopen("wave.txt", "r");
    file_output = $fopen("output.txt", "w");
        
        // Reset the DUT
        reset = 1;
        x=0;
        #10 reset = 0;
        #10 reset = 1;
        // Read input values from file and apply them to the DUT
        while (!$feof(file_handle)) begin
            scan_file = $fscanf(file_handle, "%b", input_value);
            if (scan_file == 1) begin
                #20; // Wait for 5 time units
                x = input_value;
                $fdisplay (file_output,"%b",y);
                
            end
        end       
        // Close the input file
        $fclose(file_handle);       
        // Wait for some time and finish the simulation
        #100 $finish;
    end
  

endmodule
