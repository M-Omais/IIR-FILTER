module test1 ();
  reg [15:0] a, b;
  wire [15:0]  d;
  multiplier m1(a, b, d);

  initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, test1);
    a = 16'b0_0011_11000000000;
    b = 16'b0_0100_10000000000; // Assigning a value to 'b' for completeness
    #10; // Delay added to allow simulation to advance
    $display("c = %d.%d", d[14:11],d[10:0]); // Displaying 'c' in binary format
  end
endmodule
