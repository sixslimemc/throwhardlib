# IMPL > throwhardlib : calculate
# calc/base
#--------------------
# ../main
#--------------------

data modify storage six:in cast.rotation set from storage throwhardlib:in calculate.this_tick.rotation
data modify storage six:in cast.magnitude set from storage throwhardlib:in calculate.force.base
function six:vector/cast

data modify storage throwhardlib:_ v.calculate.adds append from storage six:out cast.result




