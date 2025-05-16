#> throwhardlib:_/sc/manifest
#--------------------
# MANIFEST
#--------------------

data modify storage slimecore:in manifest.pack set value "throwhardlib"
data modify storage slimecore:in manifest.version set value {major:1, minor:0, patch:0}
data modify storage slimecore:in manifest.display.name set value "ThrowHardLib"
data modify storage slimecore:in manifest.display.summary set value "TODO"
data modify storage slimecore:in manifest.url.this set value "TODO"
data modify storage slimecore:in manifest.author set value {name:"SixSlime", url:"https://github.com/sixslime"}

data modify storage slimecore:in manifest.dependencies append value {pack:"pdata", url:"TODO", version:{major:1, minor:0, patch:0}}
data modify storage slimecore:in manifest.dependencies append value {pack:"six", url:"TODO", version:{major:1, minor:0, patch:0}}

data modify storage slimecore:in manifest.expected_order set value {tick:-1b}

data modify storage slimecore:in manifest.library set value true
data modify storage slimecore:in manifest.abstract set value false

data modify storage slimecore:in manifest.implements set value []

function slimecore:manifest