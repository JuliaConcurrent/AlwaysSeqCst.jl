module AlwaysSeqCst

export @atomic, @atomicswap, @atomicreplace

macro atomic(ex)
    esc(:($Base.@atomic $ex))
end

macro atomic(_ignored_order, ex)
    esc(:($Base.@atomic $ex))
end

macro atomic(a1, op, a2)
    esc(:($Base.@atomic $a1 $op $a2))
end

macro atomic(_ignored_order, a1, op, a2)
    esc(:($Base.@atomic $a1 $op $a2))
end

macro atomicswap(ex)
    esc(:($Base.@atomicswap $ex))
end

macro atomicswap(_ignored_order, ex)
    esc(:($Base.@atomicswap $ex))
end

macro atomicreplace(ex, old_new)
    esc(:($Base.@atomicreplace $ex $old_new))
end

macro atomicreplace(_ignored_order, ex, old_new)
    esc(:($Base.@atomicreplace $ex $old_new))
end

macro atomicreplace(_ignored_success_order, _ignored_fail_order, ex, old_new)
    esc(:($Base.@atomicreplace $ex $old_new))
end

end  # module AlwaysSeqCst
