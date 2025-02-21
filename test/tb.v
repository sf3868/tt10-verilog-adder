`default_nettype none
`timescale 1ns / 1ps

module tb ();

  // Generate waveform file for debugging
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
    #1;
  end

  // Declare signals
  reg [7:0] ui_in;
  reg [7:0] uio_in;
  wire [7:0] uo_out;

  // Instantiate the module
  tt_um_project uut (
      .ui_in  (ui_in),
      .uio_in (uio_in),
      .uo_out (uo_out),
      .uio_out(), // Unused outputs
      .uio_oe(),
      .ena(1'b1),
      .clk(1'b0), // Not needed
      .rst_n(1'b1) // Not needed
  );

  // Stimulus
  initial begin
    ui_in  = 8'b00000001; uio_in = 8'b00000001; #10;
    ui_in  = 8'b00001111; uio_in = 8'b00000001; #10;
    ui_in  = 8'b11111111; uio_in = 8'b00000001; #10; // Overflow case
    ui_in  = 8'b10101010; uio_in = 8'b01010101; #10;
    $finish;
  end

endmodule
