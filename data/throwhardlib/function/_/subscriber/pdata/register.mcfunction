#> throwhardlib : pdata <!> register

data modify storage pdata:in set.value set from entity @s Rotation
data merge storage pdata:in {set:{path:'throwhardlib.last_rotation'}}
function pdata:self/set