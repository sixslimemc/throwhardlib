#> throwhardlib : UTIL / randomf
#--------------------
# -> range: FloatRange
#--------------------
# <- result
#--------------------
# generates a random float(4) in <range>
#--------------------
# 1.
#--------------------

data remove storage throwhardlib:_ util.randomf.out

execute store result storage throwhardlib:_ u.randomf.min int 1 run data get storage throwhardlib:_ util.randomf.in.range.min 10000
execute store result storage throwhardlib:_ u.randomf.max int 1 run data get storage throwhardlib:_ util.randomf.in.range.max 10000

execute store result storage throwhardlib:_ util.randomf.out.result float 0.0001 run function throwhardlib:_/util/randomf/get_random with storage throwhardlib:_ u.randomf

data remove storage throwhardlib:_ u.randomf

return 1