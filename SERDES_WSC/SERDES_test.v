`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:37:57 04/18/2017
// Design Name:   serdes
// Module Name:   C:/Users/Gokuruto3/Documents/GitHub/Verilog-WSC/SERDES_WSC/SERDES_test.v
// Project Name:  SERDES_WSC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: serdes
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SERDES_test;

	// Inputs
	reg [7:0] para_in;
	reg clk;
	reg reset;

	// Outputs
	wire [7:0] para_out;

	// Instantiate the Unit Under Test (UUT)
	serdes uut (
		.para_in(para_in), 
		.para_out(para_out), 
		.clk(clk),
		.reset(reset)
	);
	integer file,i,file2,file3;
	reg [7:0] tofile;
	reg [7:0] inp,outp;
	integer k=0;
	initial begin
		// Initialize Inputs
		file =$fopen("input.txt", "wr");
		file2=$fopen("result.txt","a+");
		file3 =$fopen("comprasion.txt","wr");
		for(i=0;i<100;i=i+1)
			begin
				tofile =$random%255;
				$fwrite(file,"%x ",tofile);
			end
		$fclose(file);
		file=$fopen("input.txt","r");
		reset =0;
		para_in = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#10;
		reset =1;
		
       
    //use captured_data as you would any other wire or reg value;
  end
  		integer j=0;

  always
	begin
		clk<=~clk;
		#1;
	end
		 always @(posedge clk) begin
		$fscanf(file, "%x ", tofile); 
		if (!$feof(file)) begin
			para_in =10000001;
			#100;
			para_in = tofile;
			#100;
			//$fwrite(file2,"%x ",para_out);
			end
			$fwrite(file2,"%x ",para_out);
			if($feof(file))
			begin
			$fclose(file);
			$fclose(file2);
			$finish;
			end
		// Add stimulus here
				//$fwrite(file2,"%x ",para_out);
      end
endmodule

