`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:27:01 04/18/2017 
// Design Name: 
// Module Name:    serdes 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module serdes(
    input [7:0] para_in,
    output [7:0] para_out,
    input clk,
	 wire connect,
    input reset

    );
	   serializer u1 (.paralel_in(para_in),.serial_out(connect), .clk(clk), .nreset(reset));
	 deserializer u2 (.paralel_out(para_out),.serial_in(connect), .clk(clk), .nreset(reset));
endmodule
