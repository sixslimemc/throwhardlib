# IMPL > throwhardlib : calculate
# main

# init {..adds}:
data merge storage throwhardlib:_ {v:{calculate:{adds:[]}}}
data modify storage throwhardlib:_ v.calculate.adds set from storage throwhardlib:in calculate.add

# base vector:
function throwhardlib:_/impl/calculate/calc/base

# fling vector:
execute if data storage throwhardlib:in calculate.force.fling run function throwhardlib:_/impl/calculate/calc/fling

# sum vectors to {@out result}:
data modify storage six:in sum.vectors set from storage throwhardlib:_ v.calculate.adds
function six:vector/sum
data modify storage throwhardlib:out calculate.result set from storage six:out sum.result

#< RETURN : if vector is zero
execute if data storage throwhardlib:out calculate{result:[0d, 0d, 0d]} run return 1

# cap max magnitude:
execute if data storage throwhardlib:in calculate.force.max run function throwhardlib:_/impl/calculate/calc/max

#< RETURN : if no variation
execute unless data storage throwhardlib:in calculate.force.variation run return 1

# get {..direction} and {..magnitude}
data modify storage six:in direction.vector set from storage throwhardlib:out calculate.result
function six:vector/direction
data modify storage throwhardlib:_ c.calculate.direction set from storage six:out direction.result
data modify storage six:in magnitude.vector set from storage throwhardlib:out calculate.result
function six:vector/magnitude
data modify storage throwhardlib:_ c.calculate.magnitude set from storage six:out magnitude.result

# variation of {..direction}:
execute if data storage throwhardlib:in calculate.force.variation.rotation.horizontal run function throwhardlib:_/impl/calculate/calc/variation/rotation/horizontal
execute if data storage throwhardlib:in calculate.force.variation.rotation.vertical run function throwhardlib:_/impl/calculate/calc/variation/rotation/vertical
execute if data storage throwhardlib:in calculate.force.variation.rotation.radial run function throwhardlib:_/impl/calculate/calc/variation/rotation/radial

# variation of {..magnitude}:
execute if data storage throwhardlib:in calculate.force.variation.magnitude run function throwhardlib:_/impl/calculate/calc/variation/magnitude