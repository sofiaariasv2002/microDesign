package arm_cortex_m0p_pkg;

localparam DATA_WIDTH = 16;
localparam DM_ADDRESSES = 256;

typedef enum logic [1:0] {
  ALU_ADD = 2'b00,
  ALU_SUB = 2'b01,
  ALU_AND = 2'b10,
  ALU_OR  = 2'b11
  
} alu_op_t;


typedef enum logic [3:0] {
ADD=4'b0000,
SUB=4'b0001,
AND=4'b0010,
OR=4'b0011,
CMP=4'b0100,
LDR=4'b0110,
STR=4'b0111,
BRANCH=4'b1000
} opcode_t;

typedef enum logic [3:0] {
BEQ= 4'b0000,
BMI= 4'b0101,
B= 4'b1111
} branch_t;

endpackage