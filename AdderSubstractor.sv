module AdderSubstractor (

    input  logic                su, //substract
    input  logic                eu, //en alu
    input  logic   [7:0]     reg_a,
    input  logic   [7:0]     reg_b,
    output logic   [7:0] bus_write

);

logic   [7:0]     result;
always_comb begin
    if(su) result = reg_a - reg_b;
    else   result = reg_a + reg_b ; 
    end 

assign bus_write = (eu)? result : 8'hzz; 
 endmodule