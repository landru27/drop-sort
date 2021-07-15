# Credits

This repo is a fork from [omwah/magic-sorting-system](https://github.com/omwah/magic-sorting-system), which is a fork from [jhuckaby/magic-sorting-system](https://github.com/jhuckaby/magic-sorting-system).  Chiefly, I have reorganized the code and the item groupings to my liking.  The orginal idea and core logic remains [jhuckaby's](https://github.com/jhuckaby).


# Overview

**Drop-Sort** is a free [datapack](https://minecraft.gamepedia.com/Data_pack) available for [Minecraft](https://minecraft.net/) v1.17 (Java Edition).  It provides an easy way to craft an automatic, extensible, and flexible item sorting system, which does not require redstone, nor console commands, nor command blocks.  Items are dropped at a drop-off area determined entirely by a specific in-game configuration of blocks, and teleported to sorting spots nearby identified by item frames representing item categories, where they can be routed via hoppers into storage and/or further distribution.  The whole system can be entirely built in survival mode, and supports both single player and multiplayer.

For example, when returning from a mining trip, exploration, or mob hunting, you can simply dump your collected items on the floor at a convenient spot in your base, and they will be automatically sorted into a number of different categories, fed into hoppers, and then stored or routed as you determine.  And, you do not need all of the supported categories to start out; you can start with just a few, and progressively build your storage system over time, because of fallback / catch-all behavior.  You can also build it to look however you want, and have different actions for different categories, from simply storing the items in a chest to something as complex as being fed into a sophisticated redstone machine for advanced processing.


# Motivation

It is already possible to build a complete item sorting and storage system using built-in vanilla Minecraft features.  There are many [incredible systems](https://www.youtube.com/results?search_query=minecraft+automatic+item+sorter), and hats off to those amazing builders.  However, in practice, actually doing it is very difficult and tedious, requires a large amount of iron for hoppers and other resources, involves complex redstone contraptions for filtering, and requires 'primer' items which cannot be used for anything except the sorting mechanism.

**Drop-Sort** is designed to make all this much easier to build.  It requires minimal resources to expand the system in order to differentiate more items (typcially less than 4 dozen categories total for sorting *all* items in the game), and performs the routing with item teleportation (eliminating the sorting machinery).  It is server-friendly (lag-free), and it keeps survival gameplay balanced by requiring some expensive resources and experience levels to start out.  And, **Drop-Sort** does *not* require having any minimum number of each item being sorted -- you can use up every last one of your diamonds and **Drop-Sort** will continue to sort new diamonds into the proper place.

At the same time, players are free to build larger systems for storing or processign items if the would like.  Players can still build out custom storage systems fed by this sorting system, using hoppers, chests, furnaces, dispensers, and more.  They can be as simple or complex as they want.  The **Drop-Sort** system *only* teleports items to special item frames; any sort of item handling can take place from there.

Importantly, this handling can start simple and grow with time, and can vary widely by category so that each category can be given the appropriate amount of handling.  Some categories might always just go into a single chest; other categories might warrant several double chests; still others might be automatically smelted; the player can even combine this system with a traditional redstone sorting system, e.g., for finer-grained sorting of specific, important items.  In the true spirit of Minecraft, it's entirely up to the player's needs and imagination!


# Features at a Glance

### player friendly
- build and setup everything in pure survival mode
- progressively add new categories over time
- design your storage system to look however you like
- no redstone, no command blocks, and no console commands required
- supports arbitrary post-sorting processing : automatic smelting, automatic food cooking, etc.

### powerful and versitile
- sorts more than a thousand unique items into just a few dozen categories
- items are sorted the moment they land on the dropoff area
- items are sorted to nearest matching item frames
- automatically distributes items across multiple item frames in same group
- support for per-category fallback groups (e.g., 'coral' falls back to 'ocean', etc.)
- support for global fallback with a 'miscellaneous' group

### balanced
- minimum of 1 gold block and 1 lapis block for drop-off area
- typical setup of 9 gold blocks and 9 lapis blocks for drop-off area
- this grows as needed and as resources are available
- each sort group has a minimal but non-trival resource cost
- each sort group costs 1 xp level to name item in item frame
- anvil needed for naming items

### server friendly
- lag-free design
- can have multiple sorting systems in same world (128+ blocks apart)
- customize sort groups by modifying config file


# Table of Contents

<!-- toc -->
- [Installation](#installation)
- [Usage](#usage)
	* [Building](#building)
	* [Creating the Dropoff Area](#creating-the-dropoff-area)
	* [Creating an Item Collector](#creating-an-item-collector)
		+ [Multiple Item Frames](#multiple-item-frames)
		+ [Fallback Groups](#fallback-groups)
	* [Advanced](#advanced)
		+ [Dropoff Chest](#dropoff-chest)
		+ [Double Speed Dropoff Chest](#double-speed-dropoff-chest)
- [Groups](#groups)
- [FAQ](#faq)
- [Development](#development)
	* [Maximum Teleport Distance](#maximum-teleport-distance)
	* [Teleport Effects](#teleport-effects)
	* [Compiling](#compiling)
- [References](#references)
- [License](#license)

# Installation

To install this datapack, clone or download this repo, and copy the contents of the `dist` directory to a new directory in your Minecraft world's `datapacks` directory.  See Minecraft documentation for the specifics on managing datapacks.  If you customize the item groupings, simply repeat the process : use the newly-generated contents of the `dist` directory to replace the contents of the datapack's directory under your Minecraft world's `datapacks` directory.

# Usage

In a nutshell, **Drop-Sort** is an item teleporter.  It will teleport unsorted items dropped onto a dropoff area to nearby spots based on what the items are, thus sorting them.  By placing hoppers at those sorting spots, the items are then fed into whatever storage or processing the player decides is good.

### Building

To build the sorting system, you will need some gold, lapis, wood, and iron.  You will also need an anvil and spare experience levels for naming items to put into the item frames.  Thus, in survival mode, you will need to play past the beginning stages, to where you can mine deep underground and accumulate enough resources to take care of more basic needs first, such as armor and decent weapons.  By that point, you will likely have enough xp levels as well.

To build the **Drop-Sort** system, you need (1) a dropoff area, and (2) item category collectors.  As already indicated, you can begin with a few and add more over time.  It is recommended that you build a 'miscellaneous' item category collector first, since it will be the catch-all for most of the categories you have not built.

### Creating the Dropoff Area

The dropoff area is created by placing down a [gold block](https://minecraft.gamepedia.com/Block_of_Gold), with a [lapis block](https://minecraft.gamepedia.com/Lapis_Lazuli_Block) on top of it.

The dropoff area is easiest to use if the lapis block is flush with the surrounding ground, so these two blocks are typically built into a floor.  The dropoff area is also easier to use if it's a bit larger, since items can spread a bit when dropped.  A 3x3 area should be fine, but you can build as much or as little as your gold and lapis supplies allow.  All that is required is that each dropoff square be a gold block underneath a lapis block, and the lapis block is available for dropping items onto.

In addition, you aren't limited to just one dropoff area.  You could have several at various points in your base, you could place them at the funnel point for any item farms you have, etc.

Finally, you do not need to be the one doing the actual dropping; any game mechanic that drops an item and can reliably drop it onto one of these gold-lapis block pairs can serve as a sorting mechanism.  For example, a chest hooked up to a dropper can serve this purpose; See the [Advanced](#advanced) section below.  (This option does require a small amount of redstone, but it has the advantages of chests being easier to use than item dropping is, smoother pacing, and being able to be part of a larger item input system).

### Creating an Item Collector

An "item category collector" or just "item collector" is just an [item frame](https://minecraft.gamepedia.com/Item_Frame) that contains a specific item which has been named a specfic way and situated above a hopper.  This item frame and item represent one of the sorting categories.  The items to be sorted within that group will teleport to that item frame and fall into the hopper.  The hopper then feeds whatever the player deems good, be it as simple as directly into a chest or as complex as a sophisticated redstone mechanism.

And, strictly speaking, the hopper isn't necessary -- it's just the typical arrangement.  The category item frame could hover over a water stream which carries the items away, or over some lava as a way of disposing of all items in that category, or simply fall onto the ground in order to make them freely available to other players, villagers, etc.

**TODO** : add screenshot of single chest setup

**TODO** : add screenshot of multiple chest setup

**TODO** : add screenshot of multiple hopper setup

**TODO** : add screenshot of multiple item frames setup

**TODO** : add screenshot of auto-cooking setup

**TODO** : add screenshot of auto-smelting setup

**TODO** : add screenshot of redstone mechanism setup

##### Multiple Item Frames

**Drop-Sort** supports multiple item frames for the same category.  Items will be distributed randomly among all nearby matching item frames.  This can be used for quicker handling of high-traffic items (cobblestone, anyone?), distribution between usage and storage (such as storing some coal in addition to using some of it for automated cooking and/or smelting), storing the same items in multiple locations throughout your base for convenience, etc.

Since the distribution is random, you can bias it simply by placing more item frames where you want the distribution to be more heavily weighted.  You can do this with multiple hoppers, or with multiple item frames in a column above a single hopper.  But, in this case, take care to enclose the 'feeding' column, so that teleported items don't fall to the side as they appear.

##### Fallback Groups / Subgroups

**Drop-Sort** supports subgroups, by allowing any item category to use any other item category as a fallback.  Most item categories typically use a 'miscellaneous' category as their fallback, but for example you could have an 'ocean' category for most aquatic things, and 'coral' and 'prismarine' for those specific kinds of aquatic items.  If they are set up with 'ocean' as their fallback group, they will operate like subgroups, collecting into the 'ocean' collector unless / until the player creates specific collectors for them.  For example, it might be quite a while before there is enough 'prismarine' to have it as a separate group, since it is likely to be late in the game before looting an ocean monument.  Until that time, it makes perfect sense to have it just be a subgroup of 'ocean' for the few prismarine items you might happen across.

All item groups fall back to a 'miscellaneous' group, which therefore serves as the universal "catch-all".  That is, if no suitable item frame can be found for an item, it will teleport to the miscellaneous group, which uses the [carrot on a stick](https://minecraft.gamepedia.com/Carrot_on_a_Stick) display item.

This is a great way to start out your storage system, so that items have a default place to be collected from the very beginning.

Item collection ultimately falls back to the player's inventory; if the 'miscellaneous' item category collector cannot itself be found, items will teleport back to the player.

### Advanced

##### Dropoff Chest

One of the features of **Drop-Sort** is that no redstone is required.  That is true, however with a simple redstone clock you can build a drop-off chest that automatically sorts all items placed inside it.  It is much easier to dump your entire inventory into a chest versus tossing it out onto the floor.  Also, this has another nice side effect in that it "throttles" item sorting so your hoppers do not overload.  Here is how to build it:

![Auto-Drop Chest 1](https://pixlcore.com/software/mss/screenshots/v2/auto-chest-redstone.png)

This requires a one [chest](https://minecraft.gamepedia.com/Chest), one [hopper](https://minecraft.gamepedia.com/Hopper), one [dropper](https://minecraft.gamepedia.com/Dropper) facing downward, one [comparator](https://minecraft.gamepedia.com/Redstone_Comparator), one [repeater](https://minecraft.gamepedia.com/Redstone_Repeater) and 5 [redstone dust](https://minecraft.gamepedia.com/Redstone_Dust).  The redstone circuit is copied verbatim from [this video tutorial](https://www.youtube.com/watch?v=-oUSS5jTHps), so please watch that to see how to orient the blocks.  In particular, the comparator must be facing *away* from the dropper.  Here is a view from above:

![Auto-Drop Chest 2](https://pixlcore.com/software/mss/screenshots/v2/auto-chest-above.png)

The key here is to face the dropper downward, leave one block of empty space below it, and then place your [lapis block](https://minecraft.gamepedia.com/Lapis_Lazuli_Block) on top of a [gold block](https://minecraft.gamepedia.com/Block_of_Gold) underneath all that.  Here is a cross section view:

![Auto-Drop Chest 3](https://pixlcore.com/software/mss/screenshots/v2/auto-chest-cross-section.png)

Then, simply place items or entire stacks into the chest and they'll automatically start sorting themselves.  This redstone clock only ticks if there are items in the chest, so it makes no noise unless items are dropped into it.

**Tip:** If the dropper ticking noise bothers you, consider using a resource pack.  Check out [Vanilla Tweaks](https://vanillatweaks.net/picker/resource-packs/), click to expand the "**Peace and Quiet**" group and then download the "**Quieter Dispensers and Droppers**" pack.

**Tip:** If you use a [trapped chest](https://minecraft.gamepedia.com/Trapped_Chest) instead of a normal one, the system will not start sorting items until you close the chest lid.  This is a nice safeguard in case you shift-click on the wrong item in your inventory.

##### Double Speed Dropoff Chest

If the auto-drop chest is too slow for your taste, you can build a much faster one with some more materials.  For this you will need two [chests](https://minecraft.gamepedia.com/Chest), two [hoppers](https://minecraft.gamepedia.com/Hopper), two [droppers](https://minecraft.gamepedia.com/Dropper) facing downward, two [comparators](https://minecraft.gamepedia.com/Redstone_Comparator), two [repeaters](https://minecraft.gamepedia.com/Redstone_Repeater) and 10 [redstone dust](https://minecraft.gamepedia.com/Redstone_Dust).  The double-speed redstone circuit is copied verbatim from [this video tutorial](https://www.youtube.com/watch?v=w5tiFl74cSI), so please watch that to see how to orient the blocks.  Here is how it should look:

![Double Auto-Drop Chest 1](https://pixlcore.com/software/mss/screenshots/v2/double-auto-chest.png)

Note that each comparator faces away from the droppers, but the redstone is mirrored on each side.  The [video](https://www.youtube.com/watch?v=w5tiFl74cSI) does a much better job of explaining this, but here is a view from above:

![Double Auto-Drop Chest 2](https://pixlcore.com/software/mss/screenshots/v2/double-auto-chest-above.png)

Just like the single drop chest, you should face both droppers downward, leave one block of empty space below them, and then place your [lapis blocks](https://minecraft.gamepedia.com/Lapis_Lazuli_Block) on top of [gold blocks](https://minecraft.gamepedia.com/Block_of_Gold) underneath all that.  Here is a cross section view:

![Double Auto-Drop Chest 3](https://pixlcore.com/software/mss/screenshots/v2/double-auto-chest-cross-section.png)

Feel free to bury the entire thing (leave some air for the redstone to breathe), and just have the drop chest sticking up above ground.

# Groups

**TODO** : the list of items changes with each Minecraft version; this section should be a general discription, with the focus on the next section, about reviewing and customizing the groupings

**TODO** : auto-generate a summary of the categories while generating the datapack from source

# FAQ

**Q. Why do some of my items teleport to my friend's storage system?**

A. If you have multiple Drop-Sort sorting systems in the same world or on the same server, make sure they are at least 8 chunks (128 blocks) away from each other.  This is the maximum teleport distance of items in the sorting system.  You can use the [F3 debug screen](https://minecraft.gamepedia.com/Debug_screen) to measure distance between locations using your player X/Y/Z coordinates.

**Q. Why do some of my items keep teleporting back to ME?**

A. This happens when a suitable [item frame](https://minecraft.gamepedia.com/Item_Frame) cannot be found for the items, which can happen for a number of reasons.  First, make sure you have an item frame displaying the *correct item* that matches the target group.  This may not be the exact item in your inventory, but rather a specific item that represents the whole group.  See [Groups](#groups) for a list of these special items -- the item frames must contain those *exact* items!  Second, the item frame must be within 8 chunks (128 blocks) of the drop-off chest, and the chunks all have to be loaded.  Finally, you may not have a [misc category](#misc) setup.  That is, you need an item frame with a [carrot on a stick](https://minecraft.gamepedia.com/Carrot_on_a_Stick), which is a universal catch-all for all unsorted items.  Add this to catch all the items that you don't have specific groups for.

**Q. Why isn't diamond ore sorted into the ores group?**

A. This was actually a deliberate decision when we made the data pack.  We assumed that most of the time, the player would not want diamond ore to be auto-smelted (which is probably where the ores group gets routed -- i.e. into a smelter).  It is more likely that the player would want to break the diamond ore themselves, using a fortune pick.  That being said, if *you* want diamond ore sorted into *your* ores group, you can edit the `config.json` file and rebuild the data pack to your liking!  See [Development](#development) for details.

**Q. Why not simply teleport items to the _nearest_ matching item frame?  Then you wouldn't even need a maximum teleport distance!**

A. That is true, however we actually don't want items teleported to the nearest matching item frame per se.  Consider that a single sort group may have double or more item frames, to load balance the deposited items between multiple hoppers and/or chests.  See [Multiple Item Frames](#multiple-item-frames) for an example.  In this case, to handle large numbers of deposited items at once, we need to randomize between the target item frames, but still maintain compatibility with multiple sorting systems in the same world.  That is where the maximum distance (8 chunks) comes into play.

**Q. I dropped off a stack of coal but it didn't split between my two item frames!**

A. Sometimes Minecraft treats a stack of items as a "single item with 64 quantity" and thus it gets teleported as one item, to a single item frame.  To fix this, you can "spread out" your stack of items in the drop-off chest, simply by holding down the left mouse button and dragging across the chest dialog, like this:

![Coal Distribution](https://pixlcore.com/software/mss/screenshots/coal-dist.png)

This spread arrangement has a much better chance of load balancing between multiple item frame targets, because the game treats the items as multiple smaller stacks when the chest is broken.

# Development

**Drop-Sort** is designed to be extensible.  You can change group sorting rules, add your own custom groups, and even add new items (possibly for supporting mod packs or when new Minecraft versions are released).  This is accomplished by editing a special JSON configuration file.

If you unzip the data pack, and look inside the `source` folder, you will find a `config.json` file.  Open this in your favorite text editor and you will find `groups` array, containing all the sorting groups.  Example snippet:

```js
"groups": {
	{
		"group_name": "dirt",
		"item_frame": "minecraft:dirt",
		"fallback": "misc",
		"items": [
			"minecraft:coarse_dirt",
			"minecraft:dirt",
			"minecraft:farmland",
			"minecraft:grass_block",
			"minecraft:grass_path",
			"minecraft:mycelium",
			"minecraft:podzol"
		]
	},
	{
		"group_name": "gravel",
		"item_frame": "minecraft:gravel",
		"fallback": "dirt",
		"items": [
			"minecraft:gravel"
		]
	},
	{
		"group_name": "misc",
		"item_frame": "minecraft:carrot_on_a_stick",
		"items": [
			"minecraft:carrot_on_a_stick"
		]
	}
}
```

Each group entry has the following properties:

| Property | Type | Description |
|----------|------|-------------|
| `group_name` | String | The name of the sort group, which should be lower-case alphanumeric.  This is an arbitrary name, and does not correspond with any Minecraft Item ID. |
| `item_frame` | String | The exact [Minecraft Item ID](https://minecraft.gamepedia.com/Java_Edition_data_values) of the item in the Item Frame that the sort group uses as a teleport target. |
| `fallback` | String | The name of the group items should fall back to, if this group's item frame cannot be found.  Omit this to fallback to teleporting to the player. |
| `items` | Array | A list of all the [Minecraft Item IDs](https://minecraft.gamepedia.com/Java_Edition_data_values) of items to be sorted into this group. |

The idea is that all the item IDs listed in the `items` array will be sorted into this group, if and only if an [item frame](https://minecraft.gamepedia.com/Item_Frame) containing the item specified in `item_frame` can be found within 128 blocks.  If not, then the item is sorted into the `fallback` group instead.

In the example JSON snippet above, you can see three separate groups described.  The cascading works as follows.  The `gravel` group would sort gravel into an item frame containing a `minecraft:gravel` block.  However, if that item frame couldn't be found, the group falls back to the `dirt` group.  The `dirt` group itself contains 7 items, which would all be sorted to an item frame containing a `minecraft:dirt` block.  However, if *that* item frame couldn't be found, those items would fall back to the `misc` group.  The `misc` group by default catches all unsorted items, and routes to an item frame containing a `minecraft:carrot_on_a_stick`.

## Maximum Teleport Distance

By default, the maximum item teleportation is 128 blocks.  This feature allows multiple sorting systems to coexist in the same world, without items teleporting to the wrong item frames.  However, if you want to change this, it is set in the `config.json` file outside of the `groups` array:

```js
"max_teleport_distance": 128,
```

Change this to any number of blocks you want, but please note that the chunks containing the item frames have to be loaded for the teleport to work.  For long distance teleportation it is recommended you build your storage system inside the spawn chunks, so it stays loaded.

## Teleport Effects

Don't like the particle effect or sound effect when items are sorted?  You can customize or disable those by editing the `effects` array:

```js
"effects": [
	"playsound minecraft:entity.illusioner.mirror_move block @a[distance=..5] ~ ~ ~ 1.0 1.0",
	"particle minecraft:entity_effect ~ ~ ~ 1 1 1 1 100"
]
```

By default we show some colorful particles and play one of the sound effects from the [illusioner](https://minecraft.gamepedia.com/Illusioner) mob, but you can change this.  For example, if you don't want any effects at all, just empty the effects array like this:

```js
"effects": []
```

Or, you can choose your own [particles](https://minecraft.gamepedia.com/Particles#Types_of_particles) and/or [sounds](https://minecraft.gamepedia.com/Sounds.json#Sound_events) from the game, and replace the commands with your custom versions.

## Compiling

When you are done making your changes to the file, save and [validate the syntax](https://jsonlint.com/) (JSON can be picky).  Then you will have to "compile" the config file into actual data pack function code.  This is done by running a special `generate.js` script that also lives in the `source` folder.  You will need [Node.js](https://nodejs.org/) installed on your machine to run this script.  Once installed, open a command prompt, change into the `source` directory and type this:

```
node generate.js
```

This will regenerate all the data pack function code (i.e. all the `.mcfunction` files) using your own `config.json` file as the source.  When the script is complete, the new data pack should be all ready to be installed to your local folder or server.

Note that data packs can be installed as a ZIP file, or as a folder.

# References

- [Minecraft Data Packs](https://minecraft.gamepedia.com/Data_pack)
- [Minecraft Item IDs](https://minecraft.gamepedia.com/Java_Edition_data_values)
- [Node.js](https://nodejs.org/)
- [JSON Validator](https://jsonlint.com/)

# License

**The MIT License (MIT)**

*Copyright (c) 2018 - 2020 Joseph Huckaby*
*Copyright (c) 2021 Andrew Witt*

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

NOT AN OFFICIAL MINECRAFT PRODUCT. NOT APPROVED BY OR ASSOCIATED WITH MOJANG.
