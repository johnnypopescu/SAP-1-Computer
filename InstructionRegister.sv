    module InstructionRegister(

        input  logic              clk,
        input  logic            rst_n,
        input  logic             li_n, //load instruction register
        input  logic             ei_n, //enable instruction register
        input  logic [7:0]   bus_read, 
        output logic [7:0]  bus_write_data_adress,     
        output logic [3:0]  controller_op_code

    );
    logic [7:0] ir_reg;

        always_ff@(posedge clk or negedge rst_n)begin 
            if(!rst_n) ir_reg<=0;
            else if(!li_n) 
            ir_reg<=bus_read;
        end

        assign controller_op_code = ir_reg[7:4];
        assign bus_write_data_adress = (!ei_n) ? {4'b0000 ,ir_reg[3:0]} : 8'hzz; 

    endmodule