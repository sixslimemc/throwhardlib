#> throwhardlib : pdata <!> register

data modify storage pdata:in set.value.rotation set from entity @s Rotation
data modify storage pdata:in set.value.position set from entity @s Pos
data merge storage pdata:in {set:{path:'throwhardlib.last_tick'}}
function pdata:self/set