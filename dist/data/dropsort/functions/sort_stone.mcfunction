execute as @s if entity @e[type=minecraft:item_frame,nbt={Item:{id:"minecraft:cobblestone",tag:{display:{Name:'{"text":"dropsortitemcategory"}'}}}},distance=0..128] run teleport @s @e[limit=1,sort=random,type=minecraft:item_frame,nbt={Item:{id:"minecraft:cobblestone",tag:{display:{Name:'{"text":"dropsortitemcategory"}'}}}},distance=0..128]
execute as @s unless entity @e[type=minecraft:item_frame,nbt={Item:{id:"minecraft:cobblestone",tag:{display:{Name:'{"text":"dropsortitemcategory"}'}}}},distance=0..128] run function dropsort:sort_misc
