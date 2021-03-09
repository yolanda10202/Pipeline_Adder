// Lab2 Sequential Logic Design
`timescale 1 ns/1 ns

module calculator_testbench(result);
	reg clk = 1;
	reg reset;
	reg [7:0] a;
	reg [7:0] b;
	reg [7:0] c;
	reg [7:0] d;
	reg [31:0] instruction;
	output [7:0] result;
	
	calculator_design myCalc(.clk(clk), .reset(reset), .instruction(instruction), .result(result));
	
	initial begin
		reset = 1;
		a = 1;
		b = 2;
		c = 3;
		d = 4;
		instruction = {8'b00000001, 8'b00000010, 8'b00000011, 8'b00000100};
		#60000 $stop;
	end
	
	always begin
		#10;
		clk <= ~clk;
		reset = 0;
	end
	
	always begin
		#1000;
		a = a+1;
		b = b+2;
		c = c+3;
		d = d+4;
		instruction = {a, b, c, d};
	end
	
endmodule 