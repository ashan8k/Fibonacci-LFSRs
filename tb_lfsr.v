// Test bench for N-bit Fibonacci LFSR
// Ashan Liyanage
`timescale 1ns/1ns
module tb_lfsr;
parameter MSB = 16;
reg clk;
reg rstn;
wire [MSB-1:0]out;

always #5 clk = ~clk; // 10ns clock time period. 100MHz

lfsr #(.MSB(MSB)) u0 (	.clk(clk),
						.rstn(rstn),
						.out(out));

initial begin
	$dumpfile("wave.vcd");
	$dumpvars(1);
	clk <= 0;
	rstn<=0;
	
	repeat (4) @ (negedge clk);

	rstn <= 1;
	
	repeat (100) @ (negedge clk);

	$finish;
end

initial
      $monitor ("clk=%0b rstn=%b, out=0x%4h", clk, rstn, out);

endmodule
