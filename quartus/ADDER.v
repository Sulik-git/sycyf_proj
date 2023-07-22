module ADDER
#(
	//Parametry ilości próbek w podanych danych
	parameter signalA_samples = 20,
	parameter signalB_samples = 5000
)(
	//Sygnały wejścia i wyjścia
	input rst,
	input clk,
	input ena,
	input [15:0]data,
	output reg next_add,
	output reg ena_out,
	output reg [20:0] sum
);
//Lokalne zmienne
reg [20:0] summ;
reg [20:0] part;
integer cntA = 0;
integer cntB = 0;
reg local_ena;

always@(posedge clk or posedge rst)
	begin
	//Stan resetu
		if(rst) begin
			part = 0;
			cntA = 0;
			cntB = 0;
		end
	// Dodawanie do siebie kolejnych iloczynów liczonych przez moduł MULTIPLIER oraz przekazywanie sumy dalej
		else begin
		
		local_ena = ena;
		next_add = 0;
		ena_out = 0;
		
		if(local_ena)begin
		
			if (cntB < (signalB_samples - signalA_samples))begin
				if (cntA < signalA_samples) begin
					
						part = part + data;
						next_add = 1;
						cntA = cntA + 1;
				if (cntA == 20)begin
					sum = part;
					part = 0;
					cntA = 0;
					cntB = cntB + 1;
					ena_out = 1;
					end				
				end
			end
		end
	end
end


endmodule