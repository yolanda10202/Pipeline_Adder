// DAV Lab3 Arithmetic
`timescale 1 ns/1 ns

module calculator_design(clk, reset, instruction, result);
	input clk;
	input reset;
	input [31:0] instruction;
	output [7:0] result;
	
	wire one_MHz_clk;
	
	wire [7:0] stage_one_output;
	wire [7:0] stage_two_output;
	wire [7:0] stage_three_output;
	
	//To Do: Designate Bit Width for each stage's register
	reg [31:0] stage_one_reg;
	reg [23:0] stage_two_reg;
	reg [15:0] stage_three_reg;
	
	/*
	Initial Instruction Bit Designation
	31-24 = First Number to Add
	23-16 = Second Number to Add
	15-8 = Third Number to Add
	7-0 = Fourth nUmber to Add
	*/
	
	//To Do: Create and/or instantiate a 1 MHz clock divider
	clk_div #(.count_from(0), .count_to(25))
				my_clockDiv(.in(clk), .out(one_MHz_clk));
	
	//To Do: Provide correct inputs and outputs for each ALU stage
	addition_design add1(.num1(stage_one_reg[31:24]), .num2(stage_one_reg[23:16]), .sout(stage_one_output));
	addition_design add2(.num1(stage_two_reg[23:16]), .num2(stage_two_reg[15:8]), .sout(stage_two_output));
	addition_design add3(.num1(stage_three_reg[15:8]), .num2(stage_three_reg[7:0]), .sout(stage_three_output));
	
	//To Do: Assign Correct Output 
	assign result = stage_three_output;
	
	//To Do: Pass correct values to each register at the proper signal triggers
	always @ (posedge one_MHz_clk or posedge reset) begin
		if (reset) begin
			stage_one_reg <= 0;
			stage_two_reg <= 0;
			stage_three_reg <= 0;
		end
		else begin
			stage_one_reg <= instruction;
			stage_two_reg <= {stage_one_output, stage_one_reg[15:0]};
			stage_three_reg <= {stage_two_output, stage_two_reg[7:0]};
		end
	end
	
endmodule 