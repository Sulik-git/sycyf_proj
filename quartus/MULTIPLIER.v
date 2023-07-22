module MULTIPLIER (
	
	
	//Sygnały wejścia i wyjścia
	input rst,
	input [7:0] data_a,
	input [7:0] data_b,
	input clk,
	input ena,
	output reg ena_out,
	output reg [15:0] product

);

//Lokalne zmienne 
reg [15:0] prod;
reg [2:0] gate_local;
reg local_ena; 
reg c = 0;

always@(posedge clk)begin
	//Stan resetu
	if(rst) begin
		prod = 0;
	end else
	//Mnożenie dwóch podanych wartości oraz przekazanie ich dalej
	begin
	local_ena = ena;
	ena_out = 0;
		if (local_ena) begin
			product <= data_a * data_b;
				local_ena = 0;
			ena_out = 1;
			
			
	end
end
end



	
	
	
endmodule