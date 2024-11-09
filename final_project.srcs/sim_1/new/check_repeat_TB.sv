`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Jack Marshall
//////////////////////////////////////////////////////////////////////////////////


module check_repeat_TB();

logic [15:0] new_bits_TB;
logic [15:0] old_bits_TB;

logic clk_rst_TB;
logic [15:0] reg_bits_TB;
logic ld_TB;


check_repeat UUT (.new_bits(new_bits_TB), .old_bits(old_bits_TB), .clk_rst(clk_rst_TB), .reg_bits(reg_bits_TB), .ld(ld_TB));

always begin
    #10 new_bits_TB = 16'b1000000000000000;
        old_bits_TB = 16'b0100000000000000;

    #10 new_bits_TB = 16'b1000000000000000;
        old_bits_TB = 16'b1000000000000000;


end

endmodule
