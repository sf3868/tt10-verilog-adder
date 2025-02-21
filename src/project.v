`default_nettype none

module tt_um_project (
    input  wire [7:0] ui_in,    // First 8-bit input
    input  wire [7:0] uio_in,   // Second 8-bit input
    output wire [7:0] uo_out,   // 8-bit output (sum)
    output wire [7:0] uio_out,  // Unused output, set to 0
    output wire [7:0] uio_oe,   // IO enable path (set to 0)
    input  wire       ena,      // Always 1 when powered (ignore)
    input  wire       clk,      // Clock (not needed for combinational logic)
    input  wire       rst_n     // Active-low reset
);

  // Perform 8-bit addition
  assign uo_out = ui_in + uio_in;

  // Unused signals must be assigned to avoid warnings
  assign uio_out = 8'b00000000;
  assign uio_oe  = 8'b00000000;

  // Prevent warnings by listing unused signals
  wire _unused = &{ena, clk, rst_n, 1'b0};

endmodule
