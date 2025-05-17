# IMPL > throwhardlib : calculate
# calc/variation/rotation/radial
#--------------------
# ..../main
#--------------------

data modify storage throwhardlib:_/in randomf.range set from storage throwhardlib:in calculate.force.variation.rotation.radial
function throwhardlib:_/util/randomf/main
data modify storage six:in cast.magnitude set from storage throwhardlib:_/out randomf.result
data merge storage six:in {cast:{rotation:[0f, 0f]}}
execute store result storage six:in cast.rotation[0] float 0.001 run random value -179999..180000
function six:vector/cast

data modify storage throwhardlib:_ v.calculate.rot_variations[1][0] set from storage six:out cast.result[0]
data modify storage throwhardlib:_ v.calculate.rot_variations[1][1] set from storage six:out cast.result[1]

scoreboard players set *calculate.did_rot_variation _throwhardlib 1
