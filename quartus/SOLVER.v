module SOLVER 
#(
	//Parametr ilości argumentów funkcji wyjściowej korelacji
	parameter corr = 4980

)(
	//Sygnały wejścia i wyjścia
	input rst,
	input clk,
	input [20:0] data,
	input ena,
	output reg [11:0] solved
);

//Lokalne zmienne 
reg [11:0] solved_local;
integer cnt;
integer saved_cnt;
reg [20:0] saved = 0;
reg local_ena;

always@(posedge clk or posedge rst) begin
	//Stan resetu
		if(rst)begin
			solved_local = 0;
			cnt = 0;
			saved_cnt = 0;
			saved = 0;
		/*Znajdowanie największej wartości z podanych przez sumator sum poprzez porównywanie kolejnych wartości do 
		siebie i zapamiętywanie największej z nich */
		end else begin
		local_ena = ena;
		if(local_ena)begin
		if (cnt < corr) begin
			if (data > saved) begin			
				saved = data;
				saved_cnt = cnt;			
			end
			cnt = cnt + 1;
		end
		if (cnt == corr) begin
			
				solved = saved_cnt;				
		end
		end
	end
end
endmodule