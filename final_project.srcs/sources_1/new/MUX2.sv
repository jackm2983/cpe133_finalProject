`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Jack Marshall
//////////////////////////////////////////////////////////////////////////////////



module MUX2(
    input GND,
    input B,
    input [8:0] SPL,
    output logic an
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
