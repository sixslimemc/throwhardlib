# IMPL > throwhardlib : calculate
# calc/player_mation
#--------------------
# ../main
#--------------------

data modify storage six:in subtract.a set from storage throwhardlib:in calculate.this_tick.position
data modify storage six:in subtract.b set from storage throwhardlib:in calculate.last_tick.position
function six:vector/subtract

data modify storage throwhardlib:_ v.calculate.adds append from storage six:out subtract.result