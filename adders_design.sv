// DAV Lab3 Arithmetic
`timescale 1 ns/1 ns

module halfAdder(a, b, cout, sout);
	input a;
	input b;
	output cout;
	output sout;
	
	assign sout = a ^ b;
	assign cout = a & b;
	
endmodule


module fullAdder(a, b, cin, cout, sout);
	input a, b, cin;
	output cout, sout;
	wire w1, w2, w3;
	
	halfAdder half1(.a(a), .b(b), .cout(w1), .sout(w2));
	halfAdder half2(.a(w2), .b(cin), .cout(w3), .sout(sout));
	assign cout = w1 | w3;

endmodule
