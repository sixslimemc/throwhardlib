

data modify storage throwhardlib:in calculate.force set value {base:5d, transfer_player_motion:false, variation:{rotation:{radial:{min:8, max:10}}}}
data merge storage pdata:in {get:{path:'data.throwhardlib.last_tick'}}
function pdata:self/get
data modify storage throwhardlib:in calculate.last_tick set from storage pdata:out get.result

data modify storage throwhardlib:in calculate.this_tick.rotation set from entity @s Rotation
data modify storage throwhardlib:in calculate.this_tick.position set from entity @s Pos
function throwhardlib:calculate
# DEBUG:
tellraw @a ["out: ", {'storage':'throwhardlib:out', 'nbt':'calculate.result'}]

execute anchored eyes positioned ^ ^ ^ run function six:context/position
data modify storage six:in sum.vectors append from storage six:out position.result
data modify storage six:in sum.vectors append from storage throwhardlib:out calculate.result
function six:vector/sum

summon marker ~ ~ ~ {Tags:["test"]}
data modify entity @n[type=marker,tag=test] Pos set from storage six:out sum.result
execute as @n[type=marker,tag=test] at @s run particle flame ~ ~ ~ 0 0 0 0 1 force
kill @e[type=marker,tag=test]