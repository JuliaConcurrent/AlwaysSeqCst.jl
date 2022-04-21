module TestMacros

import AlwaysSeqCst
using Test

function test_atomic()
    @test (@macroexpand AlwaysSeqCst.@atomic a.x) == (@macroexpand @atomic a.x)
    @test (@macroexpand AlwaysSeqCst.@atomic :monotonic a.x) == (@macroexpand @atomic a.x)
    @test (@macroexpand AlwaysSeqCst.@atomic a.x += 1) == (@macroexpand @atomic a.x += 1)
    @test (@macroexpand AlwaysSeqCst.@atomic :monotonic a.x += 1) ==
          (@macroexpand @atomic a.x += 1)

    @test (@macroexpand AlwaysSeqCst.@atomic a.x max y) == (@macroexpand @atomic a.x max y)
    @test (@macroexpand AlwaysSeqCst.@atomic :monotonic a.x max y) ==
          (@macroexpand @atomic a.x max y)

end

function test_atomicswap()
    @test (@macroexpand AlwaysSeqCst.@atomicswap a.x = 1) ==
          (@macroexpand @atomicswap a.x = 1)
    @test (@macroexpand AlwaysSeqCst.@atomicswap :monotonic a.x = 1) ==
          (@macroexpand @atomicswap a.x = 1)
end

function test_atomicreplace()
    @test (@macroexpand AlwaysSeqCst.@atomicreplace a.x old => new) ==
          (@macroexpand @atomicreplace a.x old => new)
    @test (@macroexpand AlwaysSeqCst.@atomicreplace :monotonic a.x old => new) ==
          (@macroexpand @atomicreplace a.x old => new)
    @test (@macroexpand AlwaysSeqCst.@atomicreplace :monotonic :monotonic a.x old => new) ==
          (@macroexpand @atomicreplace a.x old => new)
end

end  # module
