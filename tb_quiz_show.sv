`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2022 00:01:22
// Design Name: 
// Module Name: testbench
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


module testbench();

reg  clk;
reg  X5;// Host reset
reg  X0,X1;// Pupil Group Inputs  (Any one)
reg  X2;// High school group      
reg  X3,X4; // Professor Group     (Both must enabled)
wire Y0;// Pulpil group lamp 
wire Y1;// High school Lamp
wire Y2 ;// Professor group lamp

Quiz_show_logic dut(
.clk(clk),     
.X5 (X5 ),  
.X0 (X0 ),  
.X1 (X1 ),  
.X2 (X2 ),   
.X3 (X3 ),  
.X4 (X4 ), 
.Y0 (Y0 ),  
.Y1 (Y1 ),  
.Y2 (Y2 )      
);

always
#5 clk = ~clk;

initial begin
    clk =0; X5=1; X0=0; X1=0; X2=0; X3=0; X4=0; 
    #10 X5=0; X0=0; X1=0; X2=0; X3=0; X4=0; 
    #10 X5=0; X0=1; X1=0; X2=0; X3=0; X4=0; 
    #10 X5=0; X0=0; X1=0; X2=1; X3=0; X4=0; 
    #10 X5=0; X0=0; X1=1; X2=0; X3=1; X4=0; 
    #10 X5=0; X0=0; X1=0; X2=0; X3=1; X4=1; 
    #10 X5=0; X0=1; X1=0; X2=0; X3=0; X4=0; 
    #10 X5=1; X0=0; X1=0; X2=0; X3=1; X4=1; 
    #10 X5=0; X0=0; X1=0; X2=1; X3=0; X4=0; 
    #10 X5=0; X0=0; X1=0; X2=0; X3=1; X4=0; 
    #10 X5=1; X0=0; X1=0; X2=0; X3=0; X4=0; 
    #10 X5=0; X0=0; X1=0; X2=0; X3=1; X4=0; 
    #10 X5=0; X0=0; X1=0; X2=0; X3=1; X4=1; 
    #10 X5=1; X0=0; X1=0; X2=0; X3=0; X4=0; 
end


endmodule
