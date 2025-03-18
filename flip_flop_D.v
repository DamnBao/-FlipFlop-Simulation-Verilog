module flip_flop_D(
	input clk,
	input rst,
	input D,
	output reg Q
);

	always @(posedge clk)begin
		if(rst)
			Q <= 0;
		else 
			Q <= D;
	end
endmodule
