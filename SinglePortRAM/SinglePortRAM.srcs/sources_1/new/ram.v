`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.08.2023 10:33:50
// Design Name: 
// Module Name: ram
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

//A single port RAM allows us to perform a read/write operation, but one at a time. While, a dual port RAM allows us to read/write simultaneously.
//64X8 
module ram(
    input clk,
    input rst,
    input we,   //1 to write and 0 to read
    input [5:0] addr,   //address bus
    input [7:0] din,    //data bus
    output [7:0] dout   //output bus
//we plan to read and then store the data into a temporary var, and then equate it to the output bus, which is why we have not declared it as reg.
    );
    
reg [7:0] mem [63:0];
 //size     //width 
 reg [7:0] temp;
 integer i=0;
 
  always@(posedge clk)
  begin
    if(rst == 1)
    begin
        for(i=0;i<64;i=i+1)
        begin
            mem[i] <= 8'h00;
        end
        temp <= 8'h00;
    end
    else
    begin
        if(we == 1'b1)
        begin
            mem[addr] <= din;
        end
        else
        begin
             temp <= mem[addr]; 
        end
    end
  end
    
  assign dout = temp;
endmodule
