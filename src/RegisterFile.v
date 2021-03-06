module registerFile
(
    input clk, reset,
    input [63:0] WriteData,
    input [4:0] RS1, RS2, RD,
    input RegWrite,
    output reg [63:0] ReadData1, ReadData2
);

reg [63:0] registers [31:0];
integer i;
integer register_select;
integer register_select_write;

initial
begin
    for (i=0; i<64; i=i+1)
    begin
        registers[i] = i;
    end
end

always @ (RS1 or RS2 or reset or posedge clk)
begin
    if (reset == 1'b1)
    begin
        ReadData1 = {64{1'b0}};
        ReadData2 = {64{1'b0}};
    end
    else
    begin
        register_select = RS1;
        ReadData1 = registers[register_select];
        
        register_select = RS2;
        ReadData2 = registers[register_select]; 
    end
    
end


always @ (posedge clk)
begin
    if (RegWrite == 1'b1)
    begin
        register_select_write = RD;
        registers[register_select_write] = WriteData;
    end
end

endmodule
