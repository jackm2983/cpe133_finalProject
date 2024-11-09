`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/07/2023 04:52:12 PM
// Design Name: 
// Module Name: accumulator_TB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module accumulator_TB();

    logic CLK_TB; 
    logic LD_TB; 
    logic CLR_TB;
// D is connected to 1 bit always.
    logic [13:0] D_TB;
    
    logic [13:0] Q_TB;

always begin
CLK_TB = 1'b1;
#5;
CLK_TB= 1'b0;
#5;
end

Accumulator UUT (.CLK(CLK_TB), .LD(LD_TB), .CLR(CLR_TB), .D(D_TB), .Q(Q_TB));

always begin

#10 D_TB = 0000000000001;
    LD_TB = 1'b1;
    CLR_TB = 1'b0;
#10 D_TB = 0000000000001;
    LD_TB = 1'b0;
    CLR_TB = 1'b0;
#10 D_TB = 0000000000001;
    LD_TB = 1'b1;
    CLR_TB = 1'b0;
    // should be 2
    
#10 D_TB = 0000000000001;
    LD_TB = 1'b0;
    CLR_TB = 1'b1;
// reset should be back to 0
    
    
end


endmodule
