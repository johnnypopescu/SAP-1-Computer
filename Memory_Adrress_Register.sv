module Memory_Address_Register(

    input  logic       clk,
    input  logic       rst_n,
    input  logic       load_mar_n, 
    input  logic [7:0] bus_w,      
    output logic [3:0] mar_to_ram

);
always_ff@(posedge clk or negedge rst_n)begin 
    if(!rst_n) mar_to_ram<=0;
    else if(!load_mar_n) 
     mar_to_ram<=bus_w[3:0];

end




endmodule