module d_flip_flop(
    input Din,
    input clk,
    output reg Q
);

always @(posedge clk)
begin
    Q <= Din;
end

endmodule
