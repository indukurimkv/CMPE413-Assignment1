# 8 Function 4 Bit ALU


This project implements an 8-function 4-bit ALU that is controlled by inputs S0, S1, and Cin. Generally, it always output signal G and Cout, where G=X+Y+Cin. X corresponds to a 4-bit input signal(A) and Y corresponds to the output of a MUX that selects between 1111, B, B_n, and 0000 using the S0 and S1 bits.

The project is heirarchical and broken down into the following componenets:

- B signal inverter: provides the inverted B signal
- Y signal MUX: selects between 1111, B, B_n, and 0000 for the Y input into the Adder
    - Composed of 4 identical components that each select one bit of the bus.
- Adder: 4 bit adder that uses standard gates like XOR, AND, and OR. This generates the G and Cout signals
    - Composed of 4 identical components that each add one bit of the input signals and output the corresponding bit of G and a Cin for the subsequent component. The MSB adder component will output the Cout signal for the 4-bit adder.



## Running the project
Clone this repo into a computer with the cadence tools installed(e.g. ite375pc20). Then, from the root of the project directory, run
```
/umbc/software/scripts/launch_cadence_xrun.sh -access +rwc -work worklib -top ALU_TB:ALU_TB_SIM ./*.vhd
```

This will run the simulation and output the results to `ALU_OUT.txt`. The expected results are in `ALU_OUT.sample.txt`. To compare the results, run

```
diff ALU_OUT.txt ALU_OUT.sample.txt
```


The project can also be configured to output the results to the terminal by running
```
/umbc/software/scripts/launch_cadence_xrun.sh -access +rwc -work worklib -top ALU_TB:ALU_TB_SIM_STDOUT ./*.vhd
```
