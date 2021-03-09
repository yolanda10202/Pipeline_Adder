// DAV Lab3 Arithmetic
`timescale 1 ns/1 ns

module addition_design(num1, num2, sout);
	input [7:0] num1, num2;
	output reg [7:0] sout;
	wire i, j, k, x, y, z, l;
	
	halfAdder a1(num1[0], num2[0], i, sout[0]);
	fullAdder a2(num1[1], num2[1], i, j, sout[1]);
	fullAdder a3(num1[2], num2[2], j, k, sout[2]);
	fullAdder a4(num1[3], num2[3], k, x, sout[3]);
	fullAdder a5(num1[4], num2[4], x, y, sout[4]);
	fullAdder a6(num1[5], num2[5], y, z, sout[5]);
	fullAdder a7(num1[6], num2[6], z, sout[7], sout[6]);
	
endmodule
	