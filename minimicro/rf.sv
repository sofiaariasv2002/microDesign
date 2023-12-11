//data_width=16
//DM_ADDRESSES=256

import arm_cortex_m0p_pkg::*;

module rf(
	input logic	clk, 
	input logic rst_n,
	input logic we,						// write enable
	input logic [3:0] rs1,				//read adder
	input logic [3:0] rs2, 				//read adder
	input logic [3:0] rd,				//write addr
	input logic [DATA_WIDTH-1:0] d,		//write dat
	output logic[DATA_WIDTH-1:0] qs1,//read data
	output logic[DATA_WIDTH-1:0] qs2	//read data
);

logic [DATA_WIDTH-1:0]rf_reg[16];

always_ff @(posedge clk, negedge rst_n) begin
	if(!rst_n)begin
		for(int i=0; i<16;i++) begin
		rf_reg [i]<=i;
		end
		rf_reg[6]<=0;
	end else begin
		if(we==1'b1) begin
			rf_reg[rd] <= d;
		end
	end
end

always_comb begin
	qs1=rf_reg [rs1];
	qs2=rf_reg [rs2];
end

endmodule