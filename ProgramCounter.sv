module ProgramCounter(

input       logic               count_enable,
input       logic                        clk,
input       logic                      rst_n,               
input       logic              output_enable,
output      logic   [7:0]              bus_w
)

logic       [3:0]       count;

always_ff @(posedge clk or negedge rst_n) begin
    if(!rst_n)  begin
         count<= 0 ;
          end
    else if (count_enable)begin
        count <= count + 1;
    end
end

assign bus_w = output_enable? {4'b0000,count} : 8'hzz;
//buffer tristate
endmodule    
