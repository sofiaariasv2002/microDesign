`timescale 1ns/1ps
import arm_cortex_m0p_pkg::*;
module tb_minimicro;

logic 					clk;
logic 					rst_n;

logic [15:0]			instruction;
logic           		pc_sel;
logic  [7:0]    		pc_out;
logic 		    		we; 
logic [DATA_WIDTH-1:0] 	D; 
logic [DATA_WIDTH-1:0] 	Qs1; 
logic [DATA_WIDTH-1:0] 	Qs2; 
logic [DATA_WIDTH-1:0] 	rf_data_in;
logic 					rf_we;
logic [3:0]            	rs2;
logic [DATA_WIDTH-1:0] 	a;
logic [DATA_WIDTH-1:0] 	Qs2_out;
logic 				    dm;
logic 					rtype_sel;
logic [15:0]  			in0;
logic [15:0]           	in1;
logic		     		sel;
logic [15:0] 			mux_out;
logic [1:0]				flags; //checar cuantos bits son
logic [1:0]				f; //checar cuantos bits son
logic 					writeback_sel;
logic 					dm_we;
logic					rs2_sel;
alu_op_t   				alu_op;
logic [DATA_WIDTH-1:0] 	b;
logic [DATA_WIDTH-1:0] 	r;
logic [DATA_WIDTH-1:0] 	Q;

always begin
	clk = 0;
	#5ns;
	clk = 1;
	#5ns;
end

initial begin
	rst_n = 1;
	#1ns;
	rst_n = 0;
	#1ns;
	rst_n = 1;
end


minimicro top_level(
	.clk(clk),
	.rst_n(rst_n)
);

endmodule