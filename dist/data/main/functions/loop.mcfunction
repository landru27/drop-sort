# Desc: Controls all function to run on the server. Make funtions run much less
# Thanks to: https://xisumavoid.com/vanillatweaks/
# Called by: #minecraft:tick

scoreboard players add #drpsrt_global drpsrt_tick 1

# Every 1 second
execute if score #drpsrt_global drpsrt_tick matches 1 run function dropsort:second
execute if score #drpsrt_global drpsrt_tick matches 21 run function dropsort:second
execute if score #drpsrt_global drpsrt_tick matches 41 run function dropsort:second
execute if score #drpsrt_global drpsrt_tick matches 61 run function dropsort:second
execute if score #drpsrt_global drpsrt_tick matches 81 run function dropsort:second

# Every 1 second just after previous tick (cooldown)
execute if score #drpsrt_global drpsrt_tick matches 2 if score #drpsrt_global drpsrt_cooldown matches 1 run function dropsort:cleanup
execute if score #drpsrt_global drpsrt_tick matches 22 if score #drpsrt_global drpsrt_cooldown matches 1 run function dropsort:cleanup
execute if score #drpsrt_global drpsrt_tick matches 42 if score #drpsrt_global drpsrt_cooldown matches 1 run function dropsort:cleanup
execute if score #drpsrt_global drpsrt_tick matches 62 if score #drpsrt_global drpsrt_cooldown matches 1 run function dropsort:cleanup
execute if score #drpsrt_global drpsrt_tick matches 82 if score #drpsrt_global drpsrt_cooldown matches 1 run function dropsort:cleanup

# Reset at 100
execute if score #drpsrt_global drpsrt_tick matches 100.. run scoreboard players set #drpsrt_global drpsrt_tick 0
