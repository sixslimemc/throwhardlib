#> _/player/tick
#--------------------
# _/tick AS [player]
#--------------------

execute if data entity @s {SelectedItemSlot:0} at @s run function throwhardlib:test

execute store result storage throwhardlib:_ var.player.pindex int 1 run scoreboard players get @s pdata.index
data modify storage throwhardlib:_ var.player.last_tick.rotation set from entity @s Rotation
data modify storage throwhardlib:_ var.player.last_tick.position set from entity @s Pos
function throwhardlib:_/player/set_last_tick with storage throwhardlib:_ var.player