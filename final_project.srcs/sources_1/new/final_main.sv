`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Jack Marshall and Brayden Daly
//////////////////////////////////////////////////////////////////////////////////


module final_main(

input RST,
input CLK,
input [15:0] SWITCHES,

output logic [15:0] LEDS,
output logic [7:0] SEGMENTS,
output logic [3:0] DISP_EN
);
    
logic [15:0] t1, t2;
logic t3, t6, t7, t8, t5, t4, t12;
logic [27:0] t10;
logic [13:0] t14;

// these not used
logic  t15;
logic [8:0] t9;

 logic t11 = t8 | RST;
    
 randomizer RDM (.NEXT(t10), .CLK(CLK), .Q(t1), .reg_enter(t3));
 Check_FSM FSM (.A(t12), .B(t4), .CLK(t5), .RST(RST), .ACC_LD(t7), .Q(t8));
 register register (.D(t1), .CLK(CLK), .RESET(RST), .SET(1'b0), .ENTER(t3), .Q(t2));
 Accumulator acc(.CLK(t5), .LD(t6), .CLR(RST), .D(14'b00000000000001), .Q(t14));
 univ_sseg sseg (.cnt1(t14), .cnt2(7'b0), .valid(1'b1), .dp_en(1'b0), .dp_sel(2'b0), .mod_sel(2'b0), .sign(1'b0), .clk(CLK), .ssegs(SEGMENTS), .disp_en(DISP_EN));
 
 seq_dvr sqdvr (.CLK(t5), .SWITCHES(SWITCHES), .LEDS(), .X(t4));
 seq_dvr sqdvr2 (.CLK(t5), .SWITCHES(t2), .LEDS(), .X(t12));
 clk_div2 clkdiv (.clk(CLK), .sclk(t5));
 
 MUX MUX1 (.GND(16'b0), .B(t2), .SPL(t9), .an(LEDS));
 MUX2 MUX2 (.GND(1'b0), .B(t7), .SPL(t9), .an(t6));
 Timer1 Timer1 (.RST(t11), .CLK(t5), .Q_out(t10));
 Timer2 Timer2 (.CLR_t2(RST), .CLK_t2(t5), .Q_out_t2(t9));

endmodule


