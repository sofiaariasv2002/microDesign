import arm_cortex_m0p_pkg::*;

module alu (
             input  alu_op_t               alu_op,
             input  logic [DATA_WIDTH-1:0] a,
             input  logic [DATA_WIDTH-1:0] b,
				 output logic						 z,
				 output logic						 n,
             output logic [DATA_WIDTH-1:0] r
           );

always_comb begin
  case(alu_op)
    ALU_ADD: r = a + b ;   // add
    ALU_SUB: r = a - b ;   // sub
    ALU_AND: r = a & b ;   // and
    ALU_OR : r = a | b ;   // or
    default: r = '0;      // set result to 0

  endcase
 	
end

	assign z = r == 0;
	assign n = r < 0 ;

endmodule