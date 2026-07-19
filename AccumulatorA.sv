module AccumulatorA(
    input  logic             clk,
    input  logic             rst_n,
    input  logic             la_n,      // Load A (activ pe 0)
    input  logic             ea,        // Enable A
    input  logic [7:0]       bus_read,  
    output logic [7:0]       bus_write, // Scrie pe magistrală (are nevoie de 'z')
    output logic [7:0]       alu_out    // Trimite datele direct către ALU
);

    logic [7:0] a_reg; // Memoria internă a acumulatorului

    // TODO 1: always_ff pentru reset (rst_n) și încărcare (memorează bus_read când la_n e 0)
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            a_reg <= 8'b0; // Resetarea acumulatorului la 0
        end else if (!la_n) begin
            a_reg <= bus_read; // Încărcarea valorii de pe magistrală în acumulator
        end
    end
    assign alu_out = a_reg;
    // TODO 3: assign pentru buffer-ul tri-state spre magistrală (bus_write)
    assign bus_write = ea ? a_reg : 8'hzz; 
endmodule