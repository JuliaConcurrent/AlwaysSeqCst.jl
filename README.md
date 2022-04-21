# AlwaysSeqCst

AlwaysSeqCst.jl provides macros `@atomic`, `@atomicswap`, and `@atomicreplace` that ignore
the ordering arguments and use `:sequentially_consistent` always.  It may be useful for a
quick debugging of miss-specified memory orderings.

## Usage

At the beginning of the module you are debugging:

```julia
using AlwaysSeqCst: @atomic, @atomicswap, @atomicreplace
```

Alternatively, to ignore the warning from the package loader:

```julia
const AlwaysSeqCst =
    Base.require(Base.PkgId(Base.UUID(0x2a0a5ff3012c40a8861a42ef8f4dfa06), "AlwaysSeqCst"))
using .AlwaysSeqCst: @atomic, @atomicswap, @atomicreplace
```
