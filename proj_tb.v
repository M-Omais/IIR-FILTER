module proj_tb;
    reg clk, reset;
    reg rx_data;
    wire tx_data;

    proj dut (
        .clk(clk),
        .reset(reset),
        .rx_data(rx_data),
        .tx_data(tx_data)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    reg [15:0] input_data;
    reg [15:0] expected_output;
    integer input_file, output_file, scan_result, error_count;

    initial begin
        reset = 1;
        #10 reset = 0;

        input_file = $fopen("input.txt", "r");
        output_file = $fopen("output.txt", "w");
        error_count = 0;

        while (!$feof(input_file)) begin
            scan_result = $fscanf(input_file, "%b", input_data);
            if (scan_result == 1) begin
                // Apply input_data to rx_data and wait for output on tx_data
                @(posedge clk) rx_data <= input_data[15:8];
                @(posedge clk) rx_data <= input_data[7:0];
                @(posedge clk) expected_output = input_data; // Expected output is the same as input for this testbench

                // Wait for tx_data to be updated
                @(posedge tx_data);
                $fscanf(output_file, "%b", expected_output);

                if (expected_output !== input_data) begin
                    $display("Error: Input %b, Expected Output %b, Actual Output %b", input_data, expected_output, tx_data);
                    error_count++;
                end
            end
        end

        $fclose(input_file);
        $fclose(output_file);

        if (error_count == 0)
            $display("Test passed");
        else
            $display("%d errors occurred during testing", error_count);

        #1000 $finish;
    end
endmodule
