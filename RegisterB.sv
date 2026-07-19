module RegisterB(
    input  logic             clk,
    input  logic             rst_n,
    input  logic             lb_n,      // Load B (activ pe 0)
    input  logic [7:0]       bus_read,  // Citește de pe magistrală
    output logic [7:0]       alu_out    // Trimite datele direct către ALU
);

logic [7:0] b_reg; // Memoria internă a registrului B

always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        b_reg <= 8'b0; // Resetarea registrului B la 0
    end else if (!lb_n) begin
        b_reg <= bus_read; // Încărcarea valorii de pe magistrală în registrul B
    end
end

assign alu_out = b_reg; // Trimite valoarea lui b_reg direct către ALU





endmodule