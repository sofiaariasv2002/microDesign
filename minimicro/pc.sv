module pc(
	input logic	clk,
	input logic	rst_n,
	input logic	pc_sel,
	input logic[7:0]	pc_imm,
	output logic[7:0]	pc_out
);

always_ff @(posedge clk, negedge rst_n) 
begin
	if(!rst_n)
	begin
		pc_out <= 0;
	end 
	else begin
		if(pc_sel==1)begin
			pc_out<=pc_imm;
		end
		else begin
		pc_out <= pc_out+1;
		end
	end
end

endmodule