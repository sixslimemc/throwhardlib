#> throwhardlib : calculate
# % AS [player]
#--------------------
# -> force: ForceSpec
# => add[]: spaceVector = []
#--------------------
# <- result: spaceVector
#--------------------
# TODO: description
#--------------------
# 1.
#--------------------

data merge storage pdata:in {get:{path:'data.throwhardlib.last_tick'}}
function pdata:self/get
data modify storage throwhardlib:in calculate.last_tick set from storage pdata:out get.result
data modify storage throwhardlib:in calculate.this_tick.position set from entity @s Pos
data modify storage throwhardlib:in calculate.this_tick.rotation set from entity @s Rotation
function throwhardlib:calculate