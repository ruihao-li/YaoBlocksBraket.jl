```@meta
CurrentModule = YaoBlocksBraket
```

# YaoBlocksBraket

Documentation for [YaoBlocksBraket](https://github.com/ruihao-li/YaoBlocksBraket.jl).

## Installation

To install YaoBlocksBraket, please open [Julia's interactive session (REPL)](https://docs.julialang.org/en/v1/manual/getting-started/) and press ] key in the REPL to use the package mode, then type the following command

```julia
pkg> add https://github.com/ruihao-li/YaoBlocksBraket.jl
```

## Usage

1. Create a circuit in Yao

```julia
using Yao, YaoBlocksBraket
yao_qc = chain(3, put(1=>YaoBlocks.X), 
                put(2=>YaoBlocks.Y),             
                put(3=>YaoBlocks.Z), 
                put(3=>YaoBlocks.Ry(0.7)),
                swap(1, 2),
                control((2, 3), 1=>YaoBlocks.X), 
                control(3, 2=>YaoBlocks.Z), 
                YaoBlocks.Measure(3, locs=1:2))
```

2. Convert it to a Braket circuit

```julia
braket_qc = convert_to_braket(yao_qc)
```

3. Run the circuit on Braket (with AWS credentials properly set up)

```julia
using Braket
dev = AwsDevice("arn:aws:braket:::device/quantum-simulator/amazon/sv1")
res = result(dev(braket_qc, shots=100))
```
