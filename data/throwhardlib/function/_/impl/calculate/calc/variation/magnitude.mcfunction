# IMPL > throwhardlib : calculate
# variation/magnitude
#--------------------
# ../main
#--------------------

data modify storage throwhardlib:_/in randomf.range set from storage throwhardlib:in calculate.force.variation.magnitude
function throwhardlib:_/util/randomf/main

data modify storage six:in sum.values append from storage throwhardlib:_ v.calculate.magnitude
data modify storage six:in sum.values append from storage throwhardlib:_/out randomf.result
function six:decimal/sum

data modify storage throwhardlib:_ v.calculate.magnitude set from storage six:out sum.result