import arm_cortex_m0p_pkg::*;

module cu(
	input  logic [1:0]	flags,
	input  opcode_t	   op_code, 
	input  branch_t  		branch, 
	output alu_op_t 		alu_op,
	output logic 			writeback_sel,
	output logic 			rtype_sel,
	output logic 			dm_we,
	output logic 			rf_we,
	output logic 			pc_sel,
	output logic			rs2_sel

);

always_comb 
begin
	case(op_code)
		ADD: begin 
			alu_op=ALU_ADD;
			rf_we=1;
			dm_we=0;
			rtype_sel=0;
			writeback_sel=0;
			pc_sel=0;
			rs2_sel=0;
		end
		SUB: begin 
			alu_op=ALU_SUB;
			rf_we=1;
			dm_we=0;
			rtype_sel=0;
			writeback_sel=0;
			pc_sel=0;
			rs2_sel=0;
		end
		OR: begin 
			alu_op=ALU_OR;
			rf_we=1;
			dm_we=0;
			rtype_sel=0;
			writeback_sel=0;
			pc_sel=0;
			rs2_sel=0;
		end
		AND: begin 
			alu_op=ALU_AND;
			rf_we=1;
			dm_we=0;
			rtype_sel=0;
			writeback_sel=0;
			pc_sel=0;
			rs2_sel=0;
		end
		CMP: begin 
			alu_op=ALU_SUB;
			rf_we=0;
			dm_we=0;
			rtype_sel=0;
			writeback_sel=0;
			pc_sel=0;
			rs2_sel=0;
		end
		LDR: begin 
			alu_op=ALU_ADD;
			rf_we=1;
			dm_we=0;
			rtype_sel=1;
			writeback_sel=1;
			pc_sel=0;
			rs2_sel=0;
		end
		STR: begin 
			alu_op=ALU_ADD;
			rf_we=0;
			dm_we=1;
			rtype_sel=0;
			writeback_sel=0;
			pc_sel=0;
			rs2_sel=1;
		end
		BRANCH: begin 
			alu_op=ALU_ADD;
			rf_we=0;
			dm_we=0;
			rtype_sel=0;
			writeback_sel=0;
			pc_sel=1;
			rs2_sel=0;
				if(branch==BEQ)begin
					pc_sel=flags[0];
				end
				if(branch==BMI)begin
					pc_sel=flags[1];
				end
				if(branch==BMI)begin
					pc_sel=1'b1;
				end
		end
	endcase
end

endmodule

