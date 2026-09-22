`timescale 1ns / 1ps
//
//  Add code inside the adder4 module to implement a four-bit adder, using
//   four instances of the one-bit full adder module "fulladd".
//
//  The github tests will test the output of your code.
//  If it passes, you will see a green check mark at the top of the repository.
//

module adder4(
	      input [3:0]      a,
	      input [3:0]      b,
	      output [4:0] result);
   
// add your code here -- you must use four instances of the full adder "fulladd", defined below

	wire [2:0] carry;
	
	fulladd addc0 (
		.x(a[0]),
		.y(b[0]),
		.cin(1'b0),
		.sum(result[0]),
		.cout(carry[0])
		);

	fulladd addc1 (
		.x(a[1]),
		.y(b[1]),
		.cin(carry[0]),
		.sum(result[1]),
		.cout(carry[1])
		);

	fulladd addc2 (
		.x(a[2]),
		.y(b[2]),
		.cin(carry[1]),
		.sum(result[2]),
		.cout(carry[2])
		);

	fulladd addc3 (
		.x(a[3]),
		.y(b[3]),
		.cin(carry[2]),
		.sum(result[3]),
		.cout(result[4])
		);

endmodule

module fulladd(
	       input  x,
	       input  y,
	       input  cin,
	       output sum,
	       output cout);

   assign sum = x ^ y ^ cin;
   assign cout = (x & y) | (x & cin) | (y & cin);
   
endmodule

