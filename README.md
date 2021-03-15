# Pipeline_Adder
IEEE Student Branch at UCLA Digital Audio Visualizer (DAV) Project Lab 3 Part D

## Description
This is project creates a *three-stage calculator* that will add four numbers together. It connects three adders together to carry out the task. 

### Why Pipeline
In my previous project [**Arithmetic Logical Unit**](https://github.com/yolanda10202/Arithmetic_Logic_Unit), I created an [Adder](https://github.com/yolanda10202/Arithmetic_Logic_Unit/blob/main/addition_design.sv) that basically adds two 8 bit numbers together by connecting 8 full/half adders together. Although this produces the correct addition result, if it were to put onto real circuitry, it will be pretty slow because each adder needs to wait for its previous adder to complete its addition before continuing. In other words, the total time spent in one addition operation is the sum of all the time spent on each adder. If we consider optimization, this doesn't seem too ideal.

To make this operation faster, we can consider breaking the operation into smaller, discrete operations that can happen at the same time. In this case, pipelining would be a good idea. Pipelining is the idea to separate each operation into stages, with registers in between each stage to save intermediate values. If each adder is doing some addition at the same time, the total operation time would decrease. 

However, pipeline isn't always the best. Pipeline takes up more memory (because it uses registers), and may add complexity to the circuit. In fact, pipelining is only beneficial in these cases:
* The operation is executed repeatedly
* The operation is able to divide into smaller, independent stages
* The stages are similar in length or complexity

### How it Works
The pipeline adder module should be able to add four numbers together. For example, if I want the result of `(((8+2)+3)+4)`, the pipeline adder should first find the sum `8+2`, then `10+3`, and finally `13+4`. To do so, three adders are pipelined together and registers are assigned to save the results of the previous operations. The input of the pipeline adder module takes in a 32 bit number. The 32 bit number will be separated into four numbers `{a, b, c, d}` and put into the operation `(((a+b)+c)+d)`. The delay of the adder is 1000 nanoseconds, so the module should carry out new operations with that frequency. To create that frequency, my design has a 50 MHz clock input (the FPGA has a built in 50MHz clock) that will be adjusted to the desired frequency using a [clock divider](https://github.com/yolanda10202/Pipeline_Adder/blob/main/clk_div.sv).

