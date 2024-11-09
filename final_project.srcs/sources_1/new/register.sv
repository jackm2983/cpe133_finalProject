`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////



module register(
    input [15:0] D,
    input CLK,
    input RESET,
    input SET,
    input ENTER,
    
    output logic [15:0] Q
    );
    
    always_ff @(posedge CLK) begin
        if (RESET) begin
            Q <= 16'b0;
        end
        else if (SET) begin
            Q <= 16'b1;
        end
        else if (ENTER) begin
            Q <= D;
        end
        end
  
endmodule

