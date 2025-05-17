# IMPL > throwhardlib : calculate
# variate_rotation
#--------------------
# ./main
#--------------------

data modify storage six:in sum.vectors set from storage throwhardlib:_ v.calculate.rot_variations
function six:vector/sum
data modify storage six:in true_rotate.rotation set from storage six:out sum.result
data remove storage six:in true_rotate.rotation[2]
data modify storage six:in true_rotate.from set from storage throwhardlib:_ v.calculate.direction
function six:rotation/true_rotate
data modify storage throwhardlib:_ v.calculate.direction set from storage six:out true_rotate.result
