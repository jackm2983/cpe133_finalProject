`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Designer: Brayden Daly
// 6/5/2023
//////////////////////////////////////////////////////////////////////////////////


module Timer2(
    input CLR_t2,
    input CLK_t2,
    output logic [8:0] Q_out_t2
    );
    
    integer A = 1; //Set upper bound
    
always_ff @(posedge CLK_t2)
    
begin

   Q_out_t2 <= Q_out_t2 + 1;
    
if (CLR_t2 == 1)
    begin
    Q_out_t2 <= 1; 
    A = 1;
    end
else if (Q_out_t2 == 330)
    begin
    Q_out_t2 <= 1;
    A = A - 1; //decrease upper bound ( need 1 for and gate)
    end
if (A == 0)
    begin
    Q_out_t2 <= 9'b111111111;
    end
end

endmodule

