`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Jack Marshall
//////////////////////////////////////////////////////////////////////////////////


module randomizer_TB();

logic [27:0] NEXT_TB;
logic CLK_TB;

logic [15:0] Q_TB;
logic reg_enter_TB;


always begin
CLK_TB = 1'b1;
#5;
CLK_TB= 1'b0;
#5;
end

randomizer UUT (.NEXT(NEXT_TB), .Q(Q_TB), .reg_enter(reg_enter_TB), .CLK(CLK_TB));

always begin
    #10 NEXT_TB = {27'b0, 1'b1};

    #10 NEXT_TB = {28'b0};

    #10 NEXT_TB = {27'b0, 1'b1};

    #10 NEXT_TB = {28'b0};
        
    #10 NEXT_TB = {27'b0, 1'b1};      

    #10 NEXT_TB = {28'b0};
        
end
endmodule
