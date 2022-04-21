module TestUses

using AlwaysSeqCst: @atomic, @atomicswap, @atomicreplace
using Test

mutable struct Atomic{T}
    @atomic x::T
end

load(a) = @atomic :ignored a.x
store!(a, x) = @atomic :ignored a.x = x
swap!(a, x) = @atomicswap :ignored a.x = x
cas!(a, old, new) = @atomicreplace(:ignored, :ignored, a.x, old => new)

function test_smoke()
    a = Atomic(111)
    @test load(a) == 111
    store!(a, 222)
    @test load(a) == 222
    @test swap!(a, 111) === 222
    @test cas!(a, 222, 333) === (; old = 111, success = false)
    @test cas!(a, 111, 333) === (; old = 111, success = true)
end

end  # module
