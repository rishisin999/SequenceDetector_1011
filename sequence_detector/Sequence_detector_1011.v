module SQ_1011(S_input, CLK, RST, D_output);
    input S_input, CLK, RST;
    output reg D_output;
    parameter Zero = 3'b000,
    One = 3'b001,
    OneZero = 3'b010,
    OneZeroOne = 3'b011,
    OneZeroOneOne = 3'b100;
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
                if(S_input == 0)
                    next_state = Zero;
                else
                    next_state = One;
            end
            One:begin
                if(S_input == 0)
                    next_state = OneZero;
                else
                    next_state = One;
            end
            OneZero:begin
                if(S_input == 0)
                    next_state = Zero;
                else
                    next_state = OneZeroOne;
            end
            OneZeroOne:begin
                if(S_input == 0)
                    next_state = OneZero;
                else
                    next_state = OneZeroOneOne;
            end
            OneZeroOneOne:begin
                if(S_input == 0)
                    next_state = OneZero;
                else
                    next_state = One;
            end
            default: next_state = Zero;
        endcase
    end

    always @(current_state) begin
        case (current_state)
            Zero: D_output = 0;
            One: D_output = 0;
            OneZero: D_output = 0; 
            OneZeroOne: D_output = 0; 
            OneZeroOneOne: D_output = 1;  
            default: D_output = 0;
        endcase
    end

    initial begin
        $monitor($time, " current_state = %b, next_state = %b", current_state, next_state);
    end
endmodule