# Sokoban-FPGA-core

Sokoban-FPGA-core is the controller for my Sokoban-FPGA project, this module receives the input from an PS2 mouse module and update the game states. 

In order to test this module, as using ModelSim to display game state is weird, I used cocotb + Tkinter to display the game state, which looks like the below. 

To run this testbench, you need IVerilog installed, and go to `project_dir/uut/game_core/` , then `make` , you will see a window popped out. 

![1](https://user-images.githubusercontent.com/1665437/30519625-a780baa2-9bcd-11e7-85d5-0b4d99e19392.png)

![2](https://user-images.githubusercontent.com/1665437/30519626-a7baf262-9bcd-11e7-99fe-21485be09d56.png)
