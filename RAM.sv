module RAM(

    logic       input            wr_en_n;
    logic       input   [3:0]    address;
    logic       output  [7:0]  bus_write;

);
logic   [3:0]   ram     [15:0]
initial begin 
    case(address) 
    0:ram[address] 
    endcase

end


 endmodule