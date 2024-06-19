module FIFO #(
    parameter WIDTH = 8,
    parameter ADDR = 3,
    parameter CELLS = 8
)(
   input clk, reset, cs, rd, we, 
   input [WIDTH-1:0] dataIn,
   output reg empty, full,
   output reg [WIDTH-1:0] dataOut
);
    
reg [WIDTH-1:0] memory [0:CELLS-1];
reg [ADDR:0] addr, addr_we, addr_rd;
integer i;

always @(reset) begin
    if (!reset) begin
        for (i = 0; i < CELLS; i = i + 1) begin
           memory[i] = 0;
        end
        addr = 0;
        addr_we = 0;
        empty = 1;
        full = 0;
        addr_rd = 0;
        dataOut = 0;
    end
end

always @(posedge clk) begin
        if (cs & rd & addr!=0) begin
            dataOut <= memory[addr_rd];
            addr_rd <= addr_rd + 1;
            addr <= addr - 1;
        end
        
        if (cs & we & addr<8) begin
            memory[addr_we] <= dataIn;
            addr_we <= addr_we + 1;
            addr <= addr + 1;
        end
        
        if (addr_rd == 8) begin
            addr_rd <= 0;
        end
        else if (addr_we == 8) begin
            addr_we <= 0;
        end
        
        if (addr == 0) begin
            empty <= 1;
        end
        else if (addr == 8) begin
            full <= 1;
        end
        else if (addr_rd == addr_we) begin
            empty <= 1;
        end
        else begin
            empty <= 0;
            full <= 0;
        end

end

endmodule