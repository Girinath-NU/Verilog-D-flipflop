module d_flip_flop(Din,clk,clear,enable,Q);
    input [7:0]Din;
    input clk,clear,enable;
    output reg[7:0]Q;
    always@(negedge clk)
    if(enable)
     begin
       if(clear)
          Q<=0;
       else
          Q<=Din;
   end
   endmodule   
