# IMPL > throwhardlib : calculate
# main

# init {..adds}:
data merge storage throwhardlib:_ {v:{calculate:{adds:[]}}}
data modify storage throwhardlib:_ v.calculate.adds set from storage throwhardlib:in calculate.add

# base vector:
function throwhardlib:_/impl/calculate/calc/base

# fling vector:
execute if data storage throwhardlib:in calculate.force.fling run function throwhardlib:_/impl/calculate/calc/fling

# sum vectors:
data modify storage six:in sum.vectors set from storage throwhardlib:_ v.calculate.adds
function six:vector/sum
data modify storage throwhardlib:out calculate.result set from storage six:out sum.result

#< RETURN : if vector is zero
execute if data storage throwhardlib:out calculate{result:[0d, 0d, 0d]} run return 1

# cap max magnitude:
execute if data storage throwhardlib:in calculate.force.max run function throwhardlib:_/impl/calculate/calc/max

#< RETURN : if no variation
execute unless data storage throwhardlib:in calculate.force.variation run return 1
