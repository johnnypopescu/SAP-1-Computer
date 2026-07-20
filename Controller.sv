module Controller(
    input  logic       clk,
    input  logic       rst_n,
    input  logic [3:0] opcode, // Cei 4 biți din IR gen cei mai semnificativi
    
    // Toate firele (Word-ul de control de 12 biți)
    output logic       cp, ep, lm_n, ce_n, li_n, ei_n, la_n, ea, su, eu, lb_n, lo_n
);

    // Definim numele stărilor
    typedef enum logic [2:0] {T1, T2, T3, T4, T5, T6} state_t;
    state_t current_state, next_state;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) current_state <= T1;
        else        current_state <= next_state;
    end

    // 2. Logica pentru starea următoare
    always_comb begin
        case (current_state)
            T1: next_state = T2;
            T2: next_state = T3;
            T3: next_state = T4;
            T4: next_state = T5;
            T5: next_state = T6;
            T6: next_state = T1;
            default: next_state = T1;
        endcase
    end



        cp = 0; ep = 0; lm_n = 1; ce_n = 1;
         li_n = 1; ei_n = 1; la_n = 1; ea = 0; 
         su = 0; eu = 0; lb_n = 1; lo_n = 1;
        case (current_state)
            T1: begin
                ep = 1 ; // program counter
                lm_n = 0; //Load MAR activ
            end
            
            T2: begin
                cp = 1; // counter increment
            end
            
            T3: begin
                ce_n = 0; //ram comunica cu bus on
                li_n = 0; //load instruction register
                    end
            
            // Stările T4, T5, T6 le lăsăm goale deocamdată. Acolo intră Opcode-ul în joc!
        endcase
    

endmodule