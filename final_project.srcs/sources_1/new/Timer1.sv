`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Designer: Brayden Daly
// 6/5/2023
//////////////////////////////////////////////////////////////////////////////////


module Timer1(
    input RST,
    input CLK,
    output logic [27:0] Q_out
    );
    
      
always_ff @(posedge CLK)

begin

   Q_out <= Q_out + 1;  // add one to q every positive edge(counter)
    
if (RST == 1) // if reset is 1 (reset button pressed) restart timer
    begin
    Q_out <= 1; 
    end
else if (Q_out == 60) //add one to Q_out until it hits 2e8 (2e8 posedges in 2 seconds)
    begin
    Q_out <= 1;
    end

end


endmodule
