# IMPL > throwhardlib : calculate
# calc/variation/rotation/vertical
#--------------------
# ..../main
#--------------------

execute store result score *calculate.negate _throwhardlib run random value 0..1

data modify storage throwhardlib:_/in randomf.range set from storage throwhardlib:in calculate.force.variation.rotation.vertical
execute if score *calculate.negate _throwhardlib matches 1 run data merge storage throwhardlib:_/in {randomf:{negate:true}}
function throwhardlib:_/util/randomf/main

data modify storage throwhardlib:_ v.calculate.rot_variations[0][1] set from storage throwhardlib:_/out randomf.result

scoreboard players reset *calculate.negate _throwhardlib