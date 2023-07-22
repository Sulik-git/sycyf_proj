module STREAM_DIVIDER(


	input stream,
	input clk,
	output [7:0] data_out,
	output data_sel,
	output ena



);
reg cnt = 0;
reg b_cnt = 0;
reg [7:0] bytes;
reg data_selector = 1'b0;
reg enabled = 1'b0;

always@(posedge clk)
begin
	
	enabled = 0;


	bytes[b_cnt] = stream;
	
	if(b_cnt == 8)begin
		enabled = 1'b1;
		b_cnt = -1;
	end
	
	
	b_cnt = b_cnt + 1;
	cnt = cnt + 1;
	
	if(cnt == 20)begin
		data_selector = 1'b1;
	end
end




assign data_out = bytes;
assign data_sel = data_selector;
assign ena = enabled;



endmodule
