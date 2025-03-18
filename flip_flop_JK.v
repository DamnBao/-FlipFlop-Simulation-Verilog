module flip_flop_JK(
	input clk,
	input rst,
	input J,
	input K,
	output reg Q
);

	always @(posedge clk)begin
		if (rst)
			Q <= 0;
		else begin
			case({J, K})
				2'd0: Q <= Q;
				2'd1: Q <= 0;  //K=1, reset
				2'd2: Q <= 1;  //J=1, set
				2'd3: Q <= ~Q; //J=K=1, toggle
			endcase
		end
	end
endmodule
	