`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Bridget Benson 
// Create Date: 10/26/2018 12:57:18 PM
// Description: 8 bit acculumator.  Adds new value to the
// current value when LD is 1.  
//////////////////////////////////////////////////////////////////////////////////


module Accumulator(
    input CLK, LD, CLR,
// D is connected to 1 bit always.
    input [13:0] D,
    
    output logic [13:0] Q
    );
    
    
    always_ff @ (posedge CLK)
    
    begin
    
        if (CLR)
            Q <= 14'b0;
        else if (LD)
            Q <= D + Q;
         
    
    end
endmodule
