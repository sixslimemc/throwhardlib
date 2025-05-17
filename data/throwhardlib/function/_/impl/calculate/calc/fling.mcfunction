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

# magnitude:
data modify storage six:in magnitude.vector set from storage six:out subtract.result
function six:vector/magnitude

# cap at max:
data modify storage six:in min.a set from storage six:out magnitude.result
data modify storage six:in min.b set from storage throwhardlib:in calculate.force.fling.max
execute unless data storage throwhardlib:in calculate.force.fling.max run data modify storage six:in min.b set from storage six:out magnitude.result
function six:decimal/min

# make vector:
data modify storage six:in cast.magnitude set from storage six:out min.result
data modify storage six:in cast.rotation set from storage throwhardlib:in calculate.this_tick.rotation
function six:vector/cast

data modify storage throwhardlib:_ v.calculate.adds append from storage six:out cast.result

# RETURN
return 1

# ==[DEPRICATED]==

#< RETURN : if no {@in max}:
execute unless data storage throwhardlib:in calculate.force.fling.max run return run data modify storage throwhardlib:_ v.calculate.adds append from storage six:out subtract.result

data modify storage throwhardlib:_ v.calculate.fling set from storage six:out subtract.result

# check if magnitude is greater than max:
data modify storage six:in magnitude.vector set from storage throwhardlib:_ v.calculate.fling
function six:vector/magnitude
data modify storage six:in min.a set from storage six:out magnitude.result
data modify storage six:in min.b set from storage throwhardlib:in calculate.force.fling.max
execute store result score *x _throwhardlib run function six:decimal/min

#< RETURN : if magnitude is not above max:
execute if score *x _throwhardlib matches 1 run data modify storage throwhardlib:_ v.calculate.adds append from storage throwhardlib:_ v.calculate.fling

# rescale to max magnitude:
data modify storage six:in rescale.vector set from storage throwhardlib:_ v.calculate.fling
data modify storage six:in rescale.magnitude set from storage throwhardlib:in calculate.force.fling.max
function six:vector/rescale

data modify storage throwhardlib:_ v.calculate.adds append from storage six:out rescale.result

