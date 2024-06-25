// FPGA Top Level

`default_nettype none

module top (
  // I/O ports
  input  logic hz100, reset,
  input  logic [20:0] pb,
  output logic [7:0] left, right,
         ss7, ss6, ss5, ss4, ss3, ss2, ss1, ss0,
  output logic red, green, blue,

  // UART ports
  output logic [7:0] txdata,
  input  logic [7:0] rxdata,
  output logic txclk, rxclk,
  input  logic txready, rxready
);
logic goodCollTemp;
synchronizer toNextApple (.clk(clk), .reset(reset), .goodColl(goodColl), .edgee(goodCollTemp));
// applegenerator ag1 (

// input logic [3:0] x, y, randX, randY, 
// input logic goodColl, clk, reset, s_reset, 
// input logic [50 - 1:0][7:0] body,
// output logic apple

endmodule
