# IMPL > throwhardlib : calculate
# main

# init {..adds}:
data merge storage throwhardlib:_ {v:{calculate:{adds:[]}}}
data modify storage throwhardlib:_ v.calculate.adds set from storage throwhardlib:in calculate.add

# append base vector {..adds}:
function throwhardlib:_/impl/calculate/calc/base

# append fling vector {..adds}:
execute if data storage throwhardlib:in calculate.force.fling run function throwhardlib:_/impl/calculate/calc/fling
