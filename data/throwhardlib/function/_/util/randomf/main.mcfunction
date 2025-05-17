#> throwhardlib : UTIL / randomf
#--------------------
# -> range: FloatRange
# => negate: bool = false
#--------------------
# <- result: float
#--------------------
# generates a random float(4) in <range>
#--------------------
# 1.
#--------------------

data remove storage throwhardlib:_/out randomf

execute store result score *randomf.negate _throwhardlib if data storage throwhardlib:_/in randomf{negate:true}

execute store result storage throwhardlib:_ u.randomf.min int 1 run data get storage throwhardlib:_/in randomf.range.min 10000
execute store result storage throwhardlib:_ u.randomf.max int 1 run data get storage throwhardlib:_/in randomf.range.max 10000

execute if score *randomf.negate _throwhardlib matches 0 store result storage throwhardlib:_/out randomf.result float 0.0001 run function throwhardlib:_/util/randomf/get_random with storage throwhardlib:_ u.randomf
execute if score *randomf.negate _throwhardlib matches 1 store result storage throwhardlib:_/out randomf.result float -0.0001 run function throwhardlib:_/util/randomf/get_random with storage throwhardlib:_ u.randomf

data remove storage throwhardlib:_/in randomf
data remove storage throwhardlib:_ u.randomf

return 1