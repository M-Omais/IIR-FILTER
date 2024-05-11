module iir_tb;
    reg [15:0] x;
    reg rst, clk;
    wire [15:0] y;
    
    IIR i1(x, rst, clk, y);
    
    // Clock generation
    initial clk = 0;
    always #10 clk = ~clk;
    
    // Read input values from file
    integer file_handle,file_output;
    reg [15:0] input_value;
    integer scan_file;
    
    initial begin
        $dumpfile("waveform.vcd");
    $dumpvars(0, iir_tb);
        // Open the input file
        file_handle = $fopen("wave.txt", "r");
        file_output = $fopen("output.txt", "w");
        
        // Reset the DUT
        rst = 0;
        x=0;
        #10 rst = 1;
        // Read input values from file and apply them to the DUT
        while (!$feof(file_handle)) begin
            scan_file = $fscanf(file_handle, "%b", input_value);
            if (scan_file == 1) begin
                x = input_value;
                $fdisplay (file_output,"%b",y);
                #20; // Wait for 5 time units
            end
        end
        
        // Close the input file
        $fclose(file_handle);
        
        // Wait for some time and finish the simulation
        #100 $finish;
    end
    
endmodule
