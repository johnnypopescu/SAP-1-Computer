module OutputRegister(
    input  logic       clk,
    input  logic       rst_n,
    input  logic       lo_n,
    input  logic [7:0] bus_read,
    output logic [7:0] out_data
);

    logic [7:0] out_reg;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            out_reg <= 8'b0;
        end else if (!lo_n) begin
            out_reg <= bus_read;
        end
    end

    assign out_data = out_reg;

endmodule