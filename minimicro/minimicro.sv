import arm_cortex_m0p_pkg::*;

module minimicro (
	input logic clk,
	input logic rst_n
);

logic [15:0]           instruction;
logic                  pc_sel;
logic  [7:0]           pc_out;
logic 		           we; 
logic [DATA_WIDTH-1:0] D; 
logic [DATA_WIDTH-1:0] Qs1; 
logic [DATA_WIDTH-1:0] Qs2; 
logic [DATA_WIDTH-1:0] rf_data_in;
logic 					  rf_we;
logic [3:0]            rs2;
logic [DATA_WIDTH-1:0] a;
logic [DATA_WIDTH-1:0] Qs2_out;
logic 				     dm;
logic 					  rtype_sel;
logic [15:0]  			  in0;
logic [15:0]           in1;
logic		     			  sel;
logic [15:0] 			  mux_out;
logic [1:0]				  flags; //checar cuantos bits son
logic [1:0]				  f; //checar cuantos bits son
logic 					  writeback_sel;
logic 					  dm_we;
logic					 	  rs2_sel;
alu_op_t   				  alu_op;
logic [DATA_WIDTH-1:0] b;
logic [DATA_WIDTH-1:0] r;
logic [DATA_WIDTH-1:0] Q;

opcode_t opcode;
assign opcode = opcode_t'(instruction[15:12]);

branch_t cond;
assign cond = branch_t'(instruction[11:8]);



pc PC_i(
	.clk(clk),
	.rst_n(rst_n),
	.pc_sel(pc_sel),
	.pc_imm(instruction[7:0]),
	.pc_out(pc_out)
);

im Instruction_memory_i(
	.address(pc_out),   
	.instruction(instruction)  
);

Mux MUX_i3 (
	.in0(instruction[11:8]),
	.in1(instruction[3:0]),
	.sel(rs2_sel),
	.mux_out(rs2)
);

rf RF_i(
	.clk(clk),
	.rst_n(rst_n),
	.we(rf_we),
	.rs1(instruction[7:4]), 
	.rs2(rs2), 
	.rd(instruction[3:0]), 
	.d(rf_data_in),
	.qs1(a), 
	.qs2(Qs2_out)
);

//4 entrada y 16 salida
logic [3:0] zero_ext_in;
assign zero_ext_in = instruction[11:8];

logic [15:0] zero_ext_out;
assign zero_ext_out = {{12{1'b0}}, zero_ext_in};

Mux MUX_i (
	.in0(Qs2_out),
	.in1(zero_ext_out),
	.sel(rs2_sel),
	.mux_out(b)

);

cu Control_unit_i(
	.flags(flags), 
	.op_code(opcode), 
	.branch(cond), 
	.writeback_sel(writeback_sel),
	.rtype_sel(rtype_sel),
	.dm_we(dm_we),
	.alu_op(alu_op),
	.rf_we(rf_we),
	.pc_sel(pc_sel),
	.rs2_sel(rs2_sel)
	
);

alu ALU_i(
	 .alu_op(alu_op), 
	 .a(a),
	 .b(b),
	 .z(f[0]),
	 .n(f[1]),
	 .r(r)
);

dm DM_i(
	.clk(clk),
	.rst_n(rst_n),
	.we(dm_we), 
	.d(Qs2_out), 
	.addr(r[7:0]), 
	.q(Q)
);

Mux MUX_i2 (
	.in0(r),
	.in1(Q),
	.sel(writeback_sel),
	.mux_out(rf_data_in)
); 

sr Status_register_i(
	.clk(clk), 
	.rst_n(rst_n),
	.n(f[0]),
	.z(f[1]),
	.n_out(flags[0]),
	.z_out(flags[1])

);

endmodule