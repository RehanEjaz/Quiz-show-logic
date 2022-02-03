`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2022 23:30:47
// Design Name: 
// Module Name: Quiz_show_logic
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
module Quiz_show_logic(
input clk,
input X5,// Host reset
input X0,X1,// Pupil Group Inputs  (Any one)
input X2,// High school group      
input X3,X4, // Professor Group     (Both must enabled)
output reg Y0,// Pulpil group lamp 
output reg Y1,// High school Lamp
output reg Y2 // Professor group lamp
    );
    wire rst_l;
    assign rst_l = ~X5; // creating active low reset
    always @(posedge clk or negedge rst_l) begin
        if(!rst_l) begin  // host reset ctrl logic
            Y0 <= 1'b0;
            Y1 <= 1'b0;
            Y2 <= 1'b0;
        end
        else begin        
            if ((X0==1 || X1==1) && X2 ==0 && X3 ==0 && X4 ==0 && Y0 ==0 && Y1 ==0 && Y2 ==0  ) begin  // Pupil group logic
                Y0 <= 1'b1; // pupil lamp on
                Y1 <= 1'b0;
                Y2 <= 1'b0;
            end
            else if (X0==0 && X1==0 && X2 ==1 && X3 ==0 && X4 ==0 && Y0 ==0 && Y1 ==0 && Y2 ==0  ) begin    // High school logic
                Y0 <= 1'b0;
                Y1 <= 1'b1; // High school lamp on
                Y2 <= 1'b0;
            end
            else if (X0==0 && X1==0 && X2 ==0 && X3 ==1 && X4 ==1 && Y0 ==0 && Y1 ==0 && Y2 ==0  ) begin
                Y0 <= 1'b0;
                Y1 <= 1'b0;
                Y2 <= 1'b1; // Professor Group lamp on
            end
            else if ((X0==1 || X1==1) && X2 ==0 && X3 ==1 && X4 ==0 && Y0 ==0 && Y1 ==0 && Y2 ==0  ) begin
                Y0 <= 1'b1; // pupil lamp on
                Y1 <= 1'b0;
                Y2 <= 1'b0; 
            end
            else if ((X0==1 || X1==1) && X2 ==0 && X3 ==0 && X4 ==1 && Y0 ==0 && Y1 ==0 && Y2 ==0  ) begin
                Y0 <= 1'b1; // pupil lamp on
                Y1 <= 1'b0;
                Y2 <= 1'b0; 
            end
            else if (X0==0 && X1==0 && X2 ==1 && X3 ==1 && X4 ==0 && Y0 ==0 && Y1 ==0 && Y2 ==0  ) begin
                Y0 <= 1'b0;
                Y1 <= 1'b1; // High school lamp on
                Y2 <= 1'b0; 
            end
            else if (X0==0 && X1==0 && X2 ==1 && X3 ==0 && X4 ==1 && Y0 ==0 && Y1 ==0 && Y2 ==0  ) begin
                Y0 <= 1'b0;
                Y1 <= 1'b1; // High school lamp on
                Y2 <= 1'b0; 
            end
            else begin // State maintain logic until reset is pressed
                Y0 <= Y0; 
                Y1 <= Y1;
                Y2 <= Y2;
            end
        end              
    end
endmodule

