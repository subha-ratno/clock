module clock_behv(clk);
	input clk;
	
	reg [6:0] sec, min, hr;
	event sec60;
	event min60;
	
	initial begin
		sec = 0;
		min = 0;
		hr = 0;
	end
	
	always@(posedge clk) begin
		if(sec == 60) begin
			sec <= 1;
			-> sec60;
		end
		else
			sec = sec+1;
	end
	
	always@(sec60) begin
		if(min == 60) begin
			min <= 1;
			-> min60;
		end
		else
			min = min+1;
	end
	
	always@(min60) begin
		if(hr == 24)
			hr <= 1;
		else
			hr = hr+1;
	end
endmodule
