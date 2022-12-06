module SQ_1110 (S_input, CLK, RST, D_output);
    input S_input, CLK, RST;
    output reg D_output;
    parameter Zero = 3'b000,
    One = 3'b001,
    OneOne = 3'b010,
    OneOneOne = 3'b011,
    OneOneOneZero = 3'b100;
    reg [2:0] current_state, next_state;

    always @(posedge CLK, posedge RST) begin
        if(RST == 1)
            current_state <= Zero;
        else
            current_state <= next_state;
    end

    always @(current_state, S_input) begin
        case (current_state)
            Zero:begin
                if(S_input==0)
                    next_state = Zero;
                else
                    next_state = One;
            end
            One: begin
                if(S_input == 0)
                    next_state = Zero;
                else
                    next_state = OneOne;
            end
            OneOne: begin
                if(S_input == 0)
                    next_state = Zero;
                else
                    next_state = OneOneOne;
            end
            OneOneOne: begin
                if(S_input == 0)
                    next_state = OneOneOneZero;
                else
                    next_state = OneOneOne;
            end
            OneOneOneZero: begin
                if(S_input == 0)
                    next_state = Zero;
                else
                    next_state = One;
            end
        endcase

        always @(current_state) begin
            case (current_state)
            Zero: D_output = 0;
            One: D_output = 0;
            OneOne: = 3'b010,
            OneOneOne: = 3'b011,
            OneOneOneZero: = 3'b100;
            endcase
        end
    end

endmodule