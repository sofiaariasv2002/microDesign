module Mux(
	input logic [15:0]  in0,
	input logic [15:0]  in1,
	input logic		     sel,
	output logic [15:0] mux_out
);

assign mux_out = sel ? in1:in0;
endmodule