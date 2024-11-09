`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Jack Marshall
//////////////////////////////////////////////////////////////////////////////////



module MUX(
    input [15:0] GND,
    input [15:0] B,
    input [8:0] SPL,
    output logic [15:0] an
    );


    always_comb begin
     if (SPL == 9'b111111111) begin;
        an = GND;
        end    
     else begin;
        an = B;
        end
    end
    
endmodule