module Ram (
    input  logic       ce_n,    // Chip enable, activ pe 0 
    input  logic [3:0] address, // Adresa (vine de la MAR)
    output logic [7:0] bus_w    // Ieșirea spre magistrală
);

 
    logic [7:0] ram_array [0:15];

    initial begin 
        // ultimii biti sunt pentru instructiune , primii  4biti sunt pentru adresa de date
        ram_array[0]  = 8'b0000_1001; // LDA 9
        ram_array[1]  = 8'b0001_1010; // ADD 10
        ram_array[2]  = 8'b0001_1011; // ADD 11
        ram_array[3]  = 8'b0010_1100; // SUB 12
        ram_array[4]  = 8'b1110_0000; // OUT
        ram_array[5]  = 8'b1111_0000; // HLT
        ram_array[6]  = 8'b0000_0000; 
        ram_array[7]  = 8'b0000_0000; 
        ram_array[8]  = 8'b0000_0000; 
        ram_array[9]  = 8'b0001_0000; // Date (16)
        ram_array[10] = 8'b0001_0100; // Date (20)
        ram_array[11] = 8'b0001_1000; // Date (24)
        ram_array[12] = 8'b0010_0000; // Date (32)
        ram_array[13] = 8'b0000_0000; 
        ram_array[14] = 8'b0000_0000; 
        ram_array[15] = 8'b0000_0000; 
    end


    assign bus_w = (!ce_n) ? ram_array[address] : 8'hzz;

endmodule