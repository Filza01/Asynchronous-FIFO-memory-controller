module FIFOtb ();

parameter WIDTH = 8;
parameter ADDR = 3;
parameter CELLS = 8;
    
reg clk, reset, cs, rd, we;
reg [WIDTH-1:0] dataIn;
wire [WIDTH-1:0] dataOut;
wire full, empty;

FIFO dut (
    .clk(clk),
    .reset(reset),
    .cs(cs),
    .rd(rd),
    .we(we),
    .dataIn(dataIn),
    .dataOut(dataOut),
    .empty(empty),
    .full(full)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    rd = 0;
    we = 0;
    cs = 0;
    #10;
    reset = 0;
    cs = 1;
    #10;
    reset = 1;
    #10;
    // 4 writes, 5 reads
    dataIn = 34;
    we = 1;
    #10;
    dataIn = 54;
    #10;
    dataIn = 874;
    #10;
    dataIn = 5764;
    #10;
    we = 0;
    rd = 1;
    #10;
    rd = 1;
    #10;
    rd = 1;
    #10;
    rd = 1;
    #10;
    rd = 1;
    #10;
    // reset
    rd = 0;
    reset = 0;
    #20;
    reset = 1;
    #10;
    // 2 reads, 4 writes, 2 reads
    rd = 1;
    #10;
    rd = 1;
    #10;
    rd = 0;
    dataIn = 567;
    we = 1;
    #10;
    dataIn = 46;
    #10;
    dataIn = 7;
    #10;
    dataIn = 87;
    #10;
    we = 0;
    rd = 1;
    #10;
    rd = 1;
    #10;
    rd = 0;
    // reset
    reset = 0;
    #20;
    reset = 1;
    #10;
    // 4 writes, 2 reads, 2 writes
    dataIn = 874;
    we = 1;
    #10;
    dataIn = 4;
    #10;
    dataIn = 8;
    #10;
    dataIn = 398;
    #10;
    we = 0;
    rd = 1;
    #10;
    rd = 1;
    #10;
    rd = 0;
    we = 1;
    dataIn = 39;
    #10;
    dataIn = 28;
    #10;
    we = 0;
    // reset
    reset = 0;
    #20;
    reset = 1;
    #10;
    // 2 writes, 2 reads, 1 write, 1 read
    dataIn = 94;
    we = 1;
    #10;
    dataIn = 4;
    #10;
    we = 0;
    rd = 1;
    #10;
    rd = 1;
    #10;
    dataIn = 398;
    we = 1;
    rd = 0;
    #10;
    we = 0;
    rd = 1;
    #10;
    // reset
    rd = 0;
    reset = 0;
    #20;
    reset = 1;
    #10;
    // 10 writes, numerous reads
    we= 1;
    dataIn = 83;
    #10;
    dataIn = 32;
    #10;
    dataIn = 28;
    #10;
    dataIn = 34;
    #10;
    dataIn = 65;
    #10;
    dataIn = 56;
    #10;
    dataIn = 65;
    #10;
    dataIn = 5;
    #10;
    dataIn = 36;
    #10;
    dataIn = 3;
    #10;
    we = 0;
    rd = 1;
    #100;
    $finish;
end

endmodule