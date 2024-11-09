`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Designer: Jack Marshall
// 6/5/2023
//////////////////////////////////////////////////////////////////////////////////


module Check_FSM(
    input  A,
    input  B,
    input CLK,
    input RST,
    

    output logic ACC_LD,
    output logic Q
        );
    
    
typedef enum{STA, STB} STATES;
STATES NS, PS; 


always_ff@(posedge CLK, negedge RST)
    begin
    if (!RST) begin
        PS <= NS;
    end
    else begin
       PS <= STA; 
    end
    end


always_comb begin
// initialize outputs to 0
    ACC_LD = 0;
    Q = 0;

case (PS)

    STA: 
    begin
// do not load accumulator. do not reset timer 1
    ACC_LD = 0;
    Q = 0;
// if there is a switch turned on where a mole is (hit), go to state B
    if ((A == 1) & (B == 1)) begin
        NS = STB;
    end
    else begin
// remain in state A if no hit
        NS = STA;
    end
    end

    STB: 
    begin
// add one point to the accumulator and generate a new mole location by resetting timer 1
    ACC_LD = 1;
    Q = 1;    
// go back to state A and search for hits
    NS = STA;
    end
    
    
    default: NS = STA;
    
endcase
end 
endmodule
