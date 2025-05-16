# IMPL > throwhardlib : calculate
# calc/base
#--------------------
# ../main
#--------------------

data modify storage six:in cast.rotation set from storage throwhardlib:in calculate.current_rotation
data modify storage six:in cast.magnitude set from storage throwhardlib:in force.base
function six:vector/cast
data modify storage throwhardlib:_ v.calculate.base set from storage six:out cast.result



