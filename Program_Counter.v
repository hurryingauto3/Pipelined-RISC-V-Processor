module Program_Counter
(
  input clk, reset,
  input [63:0] PC_In,
  output reg [63:0] PC_Out
);

initial
PC_Out = 64'b0;

  always @(posedge clk)
    begin
      if (reset)
        begin
          PC_Out = 0;
        end
      else
        begin
          PC_Out = PC_In;
        end
    end
endmodule