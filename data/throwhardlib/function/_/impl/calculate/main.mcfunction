# IMPL > throwhardlib : calculate
# main

# init {..adds}:
data merge storage throwhardlib:_ {v:{calculate:{adds:[]}}}
data modify storage throwhardlib:_ v.calculate.adds set from storage throwhardlib:in calculate.add

# append base vector:
function throwhardlib:_/impl/calculate/calc/base

# append fling vector:
execute if data storage throwhardlib:in calculate.force.fling run function throwhardlib:_/impl/calculate/calc/fling

# sum vectors:
data modify storage six:in sum.vectors set from storage throwhardlib:_ v.calculate.adds
function six:vector/sum
data modify storage throwhardlib:out calculate.result set from storage six:out sum.result

# cap max magnitude:
execute if data storage throwhardlib:in calculate.force.max run function throwhardlib:_/impl/calculate/calc/max

# add variation: