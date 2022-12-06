`timescale 1ns / 1ps
// fpga4student.com: FPGA projects, Verilog projects, VHDL projects
// Verilog project: Verilog code for Sequence Detector using Moore FSM
// Verilog Testbench for Sequence Detector using Moore FSM 
module Sequence_detector_1011_tb;

 // Inputs
 reg sequence_in;
 reg clock;
 reg reset;

 // Outputs
 wire detector_out;

 // Instantiate the Sequence Detector using Moore FSM
 SQ_1011 uut (
  .S_input(sequence_in), 
  .CLK(clock), 
  .RST(reset), 
  .D_output(detector_out)
 );
 initial begin
 clock = 0;
 forever #5 clock = ~clock;
 end 
 initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1, Sequence_detector_1011_tb);
  // Initialize Inputs
  sequence_in = 0;
  reset = 1;
  // Wait 100 ns for global reset to finish
  #40;
      reset = 0;
  #30;
  sequence_in = 1;
  #10;
  sequence_in = 0;
  #10;
  sequence_in = 1; 
  #20;
  sequence_in = 0; 
  #20;
  sequence_in = 1; 
  #20;
  sequence_in = 1;  
  // Add stimulus here
  $monitor($time ," y = %b",$time, detector_out);
  #10 $finish;

 end
      
endmodule