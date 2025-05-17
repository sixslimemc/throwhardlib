# IMPL > throwhardlib : calculate
# calc/variation/rotation/horizontal
#--------------------
# ..../main
#--------------------

execute store result score *x _throwhardlib run random value 0..1
execute if score *x _throwhardlib matches 1 run data merge storage throwhardlib:_/in {randomf:{negate:true}}
data modify storage throwhardlib:_/in randomf.range set from storage throwhardlib:in calculate.force.variation.rotation.horizontal
function throwhardlib:_/util/randomf/main

data modify storage throwhardlib:_ v.calculate.rot_variations[0][0] set from storage throwhardlib:_/out randomf.result

scoreboard players set *calculate.did_rot_variation _throwhardlib 1
