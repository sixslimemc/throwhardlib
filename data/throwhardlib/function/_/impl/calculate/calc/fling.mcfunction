# IMPL > throwhardlib : calculate
# calc/fling
#--------------------
# ../main
#--------------------

# source vector:
data modify storage six:in cast.rotation set from storage throwhardlib:in calculate.last_tick.rotation
data modify storage six:in cast.magnitude set from storage throwhardlib:in calculate.force.fling.multiplier
function six:vector/cast
data modify storage throwhardlib:_ v.calculate.fling_source set from storage six:out cast.result

# destination vector:
data modify storage six:in cast.rotation set from storage throwhardlib:in calculate.this_tick.rotation
data modify storage six:in cast.magnitude set from storage throwhardlib:in calculate.force.fling.multiplier
function six:vector/cast

# difference:
data modify storage six:in subtract.a set from storage six:out cast.result
data modify storage six:in subtract.b set from storage throwhardlib:_ v.calculate.fling_source
function six:vector/subtract

# RETURN if no max:
execute unless data storage throwhardlib:in calculate.force.fling.max run return run data modify storage throwhardlib:_ v.calculate.adds append from storage six:out subtract.result

data modify storage six:in magnitude.vector set from storage six:out subtract.result
function six:vector/magnitude
