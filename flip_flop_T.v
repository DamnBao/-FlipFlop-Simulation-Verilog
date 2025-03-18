module flip_flop_T(
	input clk,
	inout rst,
	input T,
	output reg Q
);

	always @(posedge clk)begin
		if(rst)
			Q <= 0;
		else if(T)
			Q <= ~Q;
	end
endmodule
	