# Desc: Controls all function to run on the server. Make funtions run much less
# Thanks to: https://xisumavoid.com/vanillatweaks/
# Called by: #minecraft:tick

#
# we keep things sane by throttling; 1 tick is 1/20th of a second, so we skip out
# until 20 ticks have passed
#

# increment our tick counter
scoreboard players add #drpsrt_global drpsrt_tick 1

# on tick 1 in our looping count, run the primary sorting function
execute if score #drpsrt_global drpsrt_tick matches 1 run function dropsort:second

# on the tick after the primary function, cleanup the cooldown flag which it set and which
# controls executing the in-game effects such as particles and sound; this lets those effects
# execute again for the next loop iteration
#
# in other words, the effects cooldown is to prevent excessive effects when there are lots of items to
# sort during a -single- sorting iteration, but they are allowed to run for -each- sorting iteration
execute if score #drpsrt_global drpsrt_tick matches 2 if score #drpsrt_global drpsrt_cooldown matches 1 run function dropsort:cleanup

# reset our tick counter at 20 in order to make it a once-per-second loop
#
# we use 20-or-greater to cover a situation where the tick counter somehow incremented beyond 20 before we had the opportunity to notice
execute if score #drpsrt_global drpsrt_tick matches 20.. run scoreboard players set #drpsrt_global drpsrt_tick 0
