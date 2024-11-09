`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Designer: Jack Marshall
// 6/5/2023
//////////////////////////////////////////////////////////////////////////////////


module randomizer(
    input [27:0] NEXT,
    input CLK, 
    
    output logic [15:0] Q,
    output logic reg_enter
    );

int count;

// possible mole positions
always @ (count)
    case(count)
        0: Q = 16'b0000000000000001;
        1: Q = 16'b1000000000000000;
        2: Q = 16'b0000000000001000;
        3: Q = 16'b0000100000000000;
        4: Q = 16'b0000000001000000;
        5: Q = 16'b0000001000000000;
        6: Q = 16'b0010000000000000;
        7: Q = 16'b0000000000000010;
        8: Q = 16'b0000000000010000;
        9: Q = 16'b0001000000000000;
        10: Q = 16'b0000000100000000;
        default: Q = 16'b1000000000000000;
    endcase

   
  always_ff@(posedge CLK) begin
  // if timer1 has couted down to 00000001
      if (NEXT == {27'b0, 1'b1}) begin
 // the current case (mole position) is inputted to the register
        reg_enter <= 1'b1;
 // the mole position will change with the next iteration
        count += 1;
 // if the case reaches 10, it will just go back to the first case. the mole will go back to the first position
        if (count >= 11) begin
            count = 0;
        end
      end
      else begin
 // the register is not updated if timer 1 has not counted down
        reg_enter <= 1'b0;
      end
  end



endmodule
