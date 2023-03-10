using YaoBlocks, Braket, YaoBlocksBraket
using Test

@testset "YaoBlocksBraket.jl" begin
    yao_qc = chain(3, put(1=>YaoBlocks.X), 
                put(2=>YaoBlocks.Y),             
                put(3=>YaoBlocks.Z), 
                put(2=>YaoBlocks.T), 
                put(3=>YaoBlocks.Ry(0.7)),
                swap(1, 2),
                control((2, 3), 1=>YaoBlocks.X), 
                control(3, 2=>YaoBlocks.Z), 
                YaoBlocks.Measure(3, locs=1:2))
    braket_inst = [
        (Braket.X, [0]),
        (Braket.Y, [1]),
        (Braket.Z, [2]),
        (Braket.T, [1]),
        (Braket.Ry, [2], 0.7),
        (Braket.Swap, [0, 1]),
        (Braket.CCNot, [1, 2, 0]),
        (Braket.CZ, [2, 1]),
        (Braket.Probability, [0, 1])
    ]
    @test generate_inst(yao_qc) == braket_inst

    braket_circ = Circuit(braket_inst)
    @test convert_to_braket(yao_qc) == braket_circ
end
