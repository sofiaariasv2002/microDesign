//import machine_code::*;

module im(
           input  logic [7:0] address     ,  
           output logic [15:0] instruction   
);

initial begin
  $readmemb("machine_code.txt",im_mem); 
end

logic [15:0] im_mem [256]; 
assign instruction = im_mem[address];

endmodule