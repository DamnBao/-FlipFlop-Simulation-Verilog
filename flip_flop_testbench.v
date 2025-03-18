`timescale 1ns/1ps

module flip_flop_tb;
	reg  clk, rst, D, J, K, T;
	wire Q_D, Q_JK, Q_T;
	
	flip_flop_D FFD (.clk(clk), .rst(rst), .D(D), .Q(Q_D));
	flip_flop_JK FFJK (.clk(clk), .rst(rst), .J(J), .K(K), .Q(Q_JK));
	flip_flop_T FFT (.clk(clk), .rst(rst), .T(T), .Q(Q_T));
	
	always #5 clk = ~clk;
	
	initial begin 
		clk = 0; rst = 1; D = 0; J = 0; K = 0; T = 0;
		#10 rst = 0;
		
		//Test FFD
		#50 D = 1;
		#50 D = 0;
		
		//Test FFJK
		#50 J = 1; K = 0; //Set
		#50 J = 0; K = 1; //Reset
		#50 J = 1; K = 1; //Toggle
		
		//Test FFT
		#50 T = 1; //Toggle
		#50 T = 0; //Unchange
		
		#20 $finish;
	end
	
	initial begin
      $monitor("Time=%0t | D=%b, Q_D=%b | J=%b, K=%b, Q_JK=%b | T=%b, Q_T=%b",$time, D, Q_D, J, K, Q_JK, T, Q_T);
   end
	
endmodule
	





















	