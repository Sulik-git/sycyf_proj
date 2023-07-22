//Główny moduł
module DSP (

	//Sygnały wejścia i wyjścia
	input clk,
	input rst,
	input ena,
	output [11:0] solved_dsp
	
);
//Lokalne zmienne 
wire [7:0] q_a_dsp;
wire [7:0] q_b_dsp;
wire ena_ram;
wire [15:0] product_multi;
wire [20:0] sum_dsp;
wire next;
wire ena_multi;
wire ena_add;

ROM dsp_rom(
 .rst		(rst),
 .clk		(clk),
 .ena_in	(ena),
 .next_add (next),
 .ena_out(ena_ram),
 .q_a		(q_a_dsp),
 .q_b		(q_b_dsp)
);

MULTIPLIER dsp_multiplier(
 .data_a		(q_a_dsp),
 .data_b		(q_b_dsp),
 .clk			(clk),
 .rst			(rst),
 .ena			(ena_ram),
 .ena_out	(ena_multi),
 .product	(product_multi)
);

ADDER dsp_adder(
 .rst		(rst),
 .clk		(clk),
 .ena	(ena_multi),
 .data	(product_multi),
 .sum		(sum_dsp),
 .next_add 	(next),
 .ena_out	(ena_add)
);

SOLVER dsp_solver(
 .rst		(rst),
 .clk		(clk),
 .ena		(ena_add),
 .data	(sum_dsp),
 .solved	(solved_dsp)
);

endmodule