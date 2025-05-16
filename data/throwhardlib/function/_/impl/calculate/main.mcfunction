# IMPL > throwhardlib : calculate
# main

# base vector:
data modify storage six:in cast.rotation set from storage throwhardlib:in calculate.current_rotation
data modify storage six:in cast.magnitude set from storage throwhardlib:in force.base
function six:vector/cast
data modify storage throwhardlib:_ v.calculate.base set from storage six:out cast.result

data modify storage six:in subtract.a set from storage throwhardlib:in calculate.current_rotation
data modify storage six:in subtract.b set from storage throwhardlib:in calculate.last_rotation
function six:vector/subtract
data modify storage throwhardlib:_ v.calculate.tvec set from storage six:out subtract.result

data modify storage six:in magnitude.vector set from storage throwhardlib:_ v.calculate.tvec
function six:vector/magnitude

