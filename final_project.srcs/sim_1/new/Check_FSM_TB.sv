`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/06/2023 06:42:40 PM
// Design Name: 
// Module Name: Check_FSM_TB
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


module Check_FSM_TB();

logic [15:0] A_TB;
logic [15:0] B_TB;
logic CLK_TB;
logic RST_TB;
logic ACC_LD_TB;
logic Q_TB;


always begin
CLK_TB = 1'b1;
#5;
CLK_TB= 1'b0;
#5;
end


Check_FSM UUT (.A(A_TB), .B(B_TB), .CLK(CLK_TB), .RST(RST_TB), .ACC_LD(ACC_LD_TB), .Q(Q_TB));

always begin

#100 A_TB = 16'b1000000000000000;
    B_TB = 16'b1000000000000000;
    RST_TB = 1'b0;

#10 RST_TB = 1'b1; 
#10 RST_TB = 1'b0; 

#100 A_TB = 16'b0000001000000000;
    B_TB = 16'b0000001000000000;
    RST_TB = 1'b0; 

#100 A_TB = 16'b0000000000000000;
    B_TB = 16'b0000001000000000;
    RST_TB = 1'b0; 

#100 A_TB = 16'b0000000000000000;
    B_TB = 16'b0000001000000000;
    
#10 RST_TB = 1'b1; 
#10 RST_TB = 1'b0; 

#100 A_TB = 16'b1000000000000000;
    B_TB = 16'b1000000000000000;
    RST_TB = 1'b0;
    
end


endmodule
