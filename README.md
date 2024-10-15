# D Flip-Flop Module

This repository contains a Verilog implementation of an 8-bit D flip-flop with clock, clear, and enable controls. The module captures the input data on the negative edge of the clock signal, allowing for data storage and retrieval based on the enable and clear conditions.

## Module Description

The `d_flip_flop` module has the following functionality:

- **Inputs:**
  - `Din` (8-bit): The data input to be stored in the flip-flop.
  - `clk` (1-bit): The clock signal. Data is captured on the negative edge of the clock.
  - `clear` (1-bit): Clears the stored data to zero when set to high.
  - `enable` (1-bit): Enables the data storage. When low, the data is not updated.
  
- **Output:**
  - `Q` (8-bit): The current stored data in the flip-flop.

## How It Works

1. The module triggers on the negative edge of the clock (`negedge clk`).
2. If the `enable` signal is high, it performs the following:
   - If the `clear` signal is high, the output `Q` is set to zero.
   - Otherwise, the output `Q` is updated with the value of `Din`.
3. If `enable` is low, the flip-flop maintains its current state.

## Code Explanation

```verilog
module d_flip_flop(Din, clk, clear, enable, Q);
    input [7:0] Din;         // 8-bit data input
    input clk, clear, enable; // Clock, clear, and enable inputs
    output reg [7:0] Q;      // 8-bit output register

    // Always block triggered on the negative edge of the clock
    always @(negedge clk)
        if (enable) begin
            if (clear)
                Q <= 0;       // Clear the output to 0 if clear is high
            else
                Q <= Din;     // Update output with input data
        end
endmodule
