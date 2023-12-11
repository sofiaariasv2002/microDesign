//data_width=16
//DM_ADDRESSES=256

import arm_cortex_m0p_pkg::*;

module dm(
	input logic	clk, 
	input logic rst_n,
	input logic we,										// write enable
	input logic [$clog2(DM_ADDRESSES)-1:0] addr,	//read/write
	input logic [DATA_WIDTH-1:0] d,						//write dat
	output logic[DATA_WIDTH-1:0] q					//read data
);

logic [DATA_WIDTH-1:0]dm_reg[DM_ADDRESSES];

always_ff @(posedge clk, negedge rst_n) begin
	if(!rst_n)begin
		for(int i=0; i<DM_ADDRESSES;i++) begin
			dm_reg [i]<=i;
		end
	end else begin
		if(we==1'b1) begin
			dm_reg[addr] <= d;
		end
	end
end

always_comb begin
	q=dm_reg [addr];
end

endmodule