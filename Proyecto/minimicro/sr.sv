module sr #(parameter BITS = 1)(
	input logic clk, rst_n,
	input logic [BITS - 1 : 0] n,
	input logic [BITS - 1 : 0] z,
	output logic [BITS - 1 : 0] n_out,
	output logic [BITS - 1 : 0] z_out
);

always_ff @(posedge clk or negedge rst_n)
begin
	if (!rst_n)
		n_out <= 1'b0;
	else
		n_out <= n;
end

always_ff @(posedge clk or negedge rst_n)
begin
	if (!rst_n)
		z_out <= 1'b0;
	else
		z_out <= z;
end
endmodule