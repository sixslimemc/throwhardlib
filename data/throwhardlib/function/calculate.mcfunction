#> throwhardlib : calculate
#--------------------
# -> current_rotation: rotation
# -> last_rotation: rotation
# -> force: ForceSpec
#--------------------
# <- result: spaceVector
#--------------------
# TODO: description
#--------------------
# 1.
#--------------------

data remove storage throwhardlib:out calculate

function throwhardlib:_/impl/calculate/main

data remove storage throwhardlib:_ v.calculate
data remove storage throwhardlib:in calculate

return 1