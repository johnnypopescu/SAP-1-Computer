module ProgramCounter(

input       logic                          cp,
input       logic                       clk_n,
input       logic                       rst_n,               
input       logic                          ep, // enable pc pentru output  sa comunice cu busul
output      logic   [7:0]              bus_w
)

logic       [3:0]       count;

always_ff @(negedge clk_n or negedge rst_n) begin
    if(!rst_n)  begin
         count<= 0 ;
          end
    else if (cp)begin
        count <= count + 1;
    end
end

assign bus_w = ep? {4'b0000,count} : 8'hzz;
//buffer tristate
endmodule    
