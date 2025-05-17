# IMPL > throwhardlib : calculate
# calc/max
#--------------------
# ../main
#--------------------

# check if magnitude is above than max
data modify storage six:in magnitude.vector set from storage throwhardlib:out calculate.result
function six:vector/magnitude
data modify storage six:in min.a set from storage six:out magnitude.result
data modify storage six:in min.b set from storage throwhardlib:in calculate.force.max
execute store result score *x _throwhardlib run function six:decimal/min

#< RETURN : if magnitude is not above max
execute if score *x _throwhardlib matches 1 run return 1

# rescale to max magnitude:
data modify storage six:in rescale.vector set from storage throwhardlib:out calculate.result
data modify storage six:in rescale.magnitude set from storage throwhardlib:in calculate.force.max
function six:vector/rescale
data modify storage throwhardlib:out calculate.result set from storage six:out rescale.result

