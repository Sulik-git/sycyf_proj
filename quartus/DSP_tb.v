// synthesis translate_off
`timescale 1 ns/1 ps
`define RTL_SIMULATION
module DSP_tb();

localparam T = 20;
localparam TD = 3;
localparam sTime = 1000 * T;




reg clk;
reg rst;
reg ena;
wire [11:0] output_rsp;


integer file_uns;


DSP UUT(
 .ena (ena),
 .clk (clk),
 .rst	(rst),
 .solved_dsp	(output_rsp)
);


initial begin : clock_generation
	clk = 0;
	#(T/2);
	forever begin 
		#(T/2) clk = ~clk; 
	end
	
	
end


initial begin : reset
	ena = 0;
	rst = 1;
	@(posedge clk);
	@(negedge clk);
	rst = 0;
end


reg [11:0] test_value = 1640;
reg waiting = 0;
time first,next;
integer diff;
initial
begin: tb_generator




	
	wait (rst == 1);
	wait (rst == 0);
	file_uns = $fopen("results_unsigned.txt","w");	
	
	@(posedge clk);
	ena = 1;
	first = $time;
	
	@(posedge clk);
	while (!waiting)begin
		@(posedge clk);
		if(output_rsp == test_value)begin
			waiting = 1;
		end
	end
	
	next = $time;
	diff = next - first;
	$fwrite(file_uns,"%d\n",$unsigned(output_rsp));
	$display("Test value = %b and output = %t:",test_value, output_rsp, $time);
	$display("result = %d\n",output_rsp);
	$display("Found after %d clk cycles", diff/T);
	$stop;

end


endmodule
// synthesis translate_on
