module ROM
#(
	//Parametry ilości próbek w sygnałach
	parameter signalA_samples = 20,
	parameter corr_samples = 5000,
	parameter signalB_samples = 5000
)(
	
	//Wejścia i wyjścia
	input rst,
	input clk,
	input ena_in,
	input next_add,
	output reg ena_out,
	output reg [7:0] q_a,
	output reg [7:0] q_b

);

initial begin
	// Skrypt ładujący dane z pliku do pamięci ram
	// synthesis translate_off
	$readmemb("SignalSBin.txt",memory_a);
	$readmemb("SignalBBin.txt",memory_b);
	// synthesis translate_on

end

//Obszary pamięci RAM oraz inne lokalne zmienne
reg [7:0] memory_a [0:signalA_samples];
reg [7:0] memory_b [0:signalB_samples];
reg [7:0] out_a;
reg [7:0] out_b;
integer i = 0;
integer c = 0;
reg rdy = 0;
reg local_ena = 1;

always@(posedge clk)
	begin
	//Stan resetu
	if (rst) begin
		i = 0;
		c = 0;
		rdy = 0;
	end else	
	begin
	//Odczytywanie pamięci i podawanie dalej kolejnych wartości zgodnie z algorytmem korelacji
			if (ena_in) begin
			if(rdy)begin
			local_ena = next_add;
			end
			ena_out = 0;
			if(local_ena)begin
				rdy = 1;
				
				if ( c <= (signalB_samples - signalA_samples)) begin
					if(i < signalA_samples) begin 
						q_a <= memory_a [i];
						q_b <= memory_b [i + c];			
						i = i + 1;
						ena_out <= 1;
						local_ena = 0;		
					end else begin
						c = c + 1;
						i = 0;
						ena_out <= 0;
						local_ena = 1;
						rdy=0;
					end
					
					end
				end
			end
			
		end
	end

endmodule 