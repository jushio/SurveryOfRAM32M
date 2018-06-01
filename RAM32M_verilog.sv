`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/01 17:05:17
// Design Name: 
// Module Name: RAM32M_verilog
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


module RAM32M_verilog
#
(parameter WIDTH = 8,
parameter ADDRWIDTH = 5
)
(
    input clk,
    input [ADDRWIDTH - 1:0] waddr_in,
    output reg [WIDTH - 1:0] rdata_out,
    input [ADDRWIDTH - 1:0] raddr_in,
    input we_in
    );
    (* ram_style = "register" *) reg [WIDTH - 1:0] array [2**ADDRWIDTH - 1:0];
    reg [ADDRWIDTH - 1:0] waddr;
    reg [ADDRWIDTH - 1:0] raddr;
    reg we;
    wire [WIDTH - 1:0] wdata = 1 + rdata_out;
    wire [WIDTH - 1:0] rdata;
    assign rdata = array[raddr];
    always@(posedge clk) begin 
        if (we)
            array[waddr] <= wdata;
        rdata_out <= rdata; 
        waddr <= waddr_in;
        we <= we_in;
    end
    always@* begin
       raddr <= raddr_in;
    end
endmodule
