# Banana Tracker
- An [EmoTracker](https://emotracker.net/) pack for the [Donkey Kong 64 randomizer](https://github.com/2dos/dk64-randomizer) but can also be used for vanilla Donkey Kong 64 as well.
- Current Version: **Version 1.3.1** (June 23 2023)
<img src="https://raw.githubusercontent.com/Electric-Fortune/bananatracker/master/bananatracker_example.PNG">

# Features
This tracker features tracking packs for various DK64 Randomizer settings as well as vanilla DK64 101% playthroughs.

### Standard Randomizer
- Tracking for Kongs, Cranky upgrades, Funky weapons, Candy instruments and blueprint count (up to 8 per Kong).
- Progressive Simian Slam
- Homing Ammo and Sniper Scope Funky upgrades
- Fairy Camera
- Golden Banana counter
- Keys and Battle Crowns available in each level

### Long Randomizer
- Features all existing functionality from the Standard Randomizer pack
- Adds the Nintendo and Rareware coins as a progressive counter
- Adds a Banana Medal counter

### 101% Playthrough Tracker
- Lists only items that count towards the 101% counter (plus Blueprints)

### Level Order Randomizer Race
- Features existing functionality from the Standard Randomizer pack for all moves/collectibles
- Levels now cycle through the 7 available options for Level Order Randomizer (with a placeholder for unknown lobbies)
- Per-level Battle Crown tracking is removed

### Level Order Randomizer Race w/Shops
- Adds an additional pane for tracking purchases from Funky, Cranky, and Candy in each level

### Full Item Level Order Randomizer
- Features all existing functionality from the Level Order Randomizer Race pack
- Adds tracking for the Training Ground moves (Diving, Orange Throwing, Barrel Throwing, Vine Swinging)
- Adds Shockwave as a separate upgrade from the Fairy Camera
- Adds the progressive Company Coin tracker from the Long Randomizer pack
- Adds counters for Battle Crowns, Banana Fairies, and Banana Medals
- Adds a checkmark overlay to each key (shown by right-clicking on any key)

### Full Item Level Order Randomizer (Extended)
- Features all existing functionality from the Full Item Level Order Randomizer pack
- Merges Fairy Camera and Shockwave into one progressive tracker
- Merges Homing Ammo and Sniper Scope into one progressive tracker
- Adds counters for Pearls, Rainbow Coins, and a tracker for the Bean

### Full Item Level Order Randomizer Map Tracker
- Features the same item tracking layout from the Full Item Level Order Randomizer (Extended) pack
- Adds interactive maps for each main level with locations for every item check in full item randomizer
- Adds a Pinned Locations section to pin important or hinted locations during a playthrough
- Adds a settings gear to customize the functionality of the map locations based on your randomizer settings
- Adds the ability to resize the tracker for customizable map size control

# Map Tracker Usage
### Location Accessibility
When using the Full Item Level Order Randomizer Map Tracker pack, the locations of item checks update based on the items the player has currently highlighted in the "Kongs / Abilities / Collectables / Lobbies" tracker. The color of each location represents the accessibility of the check as follows:
- Green (location) / White (text): This item check is accessible and in logic for the player to obtain
- Yellow: This item check is accessible, but not in logic
- Blue: This item check is not accessible, but can be peeked to see what type of item the check contains
- Red: This item check is not accessible and not peekable
- Orange: This location contains multiple item checks at varying levels of accessibility
- Gray: This location has been checked off and is empty

### Check Location Logic
The map tracker assumes glitchless logic to determine the logical accessibility of its map locations. Some checks may be marked yellow as out of logic if they are accessible using damage boosting, Tag Anywhere, advanced platforming, or an option not currently set in the settings menu.

The map tracker's logic also assumes a few attributes that would be too volatile to be useful:
- Every check location requires either any of the Kongs or a specific Kong, so no locations will show up until at least 1 Kong is highlighted in the tracker
- All non-Isles level check locations and level lobby check locations will not be in logic until the appropriate level lobby is selected in the tracker and the player can access that lobby from DK Isles
- The non-Isles levels will be shown as accessible in logic as soon as the player has access to that level's lobby, regardless of whether the player has enough Golden Bananas to get past the randomized B. Locker
- Each level has a "Full Level" location hub next to its title indicating checks that can be acquired anywhere in the level, such as Banana Medals or Bosses
- The Jetpac game check, which can be acquired in any Cranky's Lab, is located in the Isles Full Level hub once the player has enough Banana Medals marked on the tracker
- Bonus Barrel checks are in logic as soon as the barrel can be accessed with the Kong assigned to the barrel, without considering the potential additional requirements of the randomized minigame within
- The logic has no knowledge of Banana Coins, so shop purchases are accessible as soon as you have that Kong and can access the shop
- Due to randomized Troff 'n' Scoff values, the tracker also cannot determine when the player would have enough colored bananas for the Boss, and thus marks it as available as soon as the level is accessible
- If Kasplats are shuffled between their vanilla locations, they will be marked as accessible as soon as any Kong can defeat them, even if the proper Kong is not owned yet
- The Kong freeing puzzles are accessible in logic as soon as any valid Kong has the requirements to open the Kong cage
- The two Golden Bananas involving Diddy's cage in Japes have event flags tied to them (denoted with checkmarks), corresponding to collecting the item in front of the cage (which spawns the gun switches), and collecting the item within the cage (which opens the gates to the rest of Japes)

### Capturing Items
Many item check locations are capturable using the dashed box next to the vanilla item icon. All item checks possess this capture box except checks that cannot be seen until they are immediately collectable (such as the Squawks instrument pads on Isles or Dirt Patch rewards). The capture box items contain some quirks:
- The potions can apply to many different abilities on the tracker, and thus will not update any particular ability when the location is checked
- Similarly, the generic Key item can apply to any of the 8 Keys, but due to each Key behaving differently in the logic, the captured Key will not update any particular Key on the tracker. The generic Key counter will update to reflect the total number of specific Keys collected if a new specific Key is marked
- The Nintendo and Rareware coins will not update the progressive Company Coins on the tracker due to their progressive nature
- An ice trap option is given for checks that can be visually identified as an ice trap, checking these will increment an internal ice trap counter that is otherwise not represented on the tracker (ice trap visual borrowed from Hamsda's ZOoTR Map Tracker)
- All other items on the capture menu will correctly increment or highlight their associated item on the tracker when the captured location is checked

## Settings
The tracker features a settings menu accessible by clicking the gear icon above the "Kong / Abilities / Collectables / Lobbies" tracker. These settings include the randomizer settings that impact the logic in a trackable way, and are split into 3 groups of settings: Item Pools, Check Amount Requirements, and Logic Settings

### Item Pools
- Each item pool setting toggles the visibility of its respective vanilla item type locations
- The Tough Golden Banana Pool controls the visibility of certain Golden Bananas deemed particularly difficult (consult the generator website for more info)
- The Miscellaneous Pool controls the visibility of the Pearl treasure chest location in Galleon as well as the Bean anthill location in Forest (separate from the Golden Banana)
- The Hint Pool controls the visibility of 5 Wrinkly Door check locations in each lobby. These do not correspond to an actual check location, but are a useful tracker for determining which hints have already been read. This pool defaults to OFF

### Check Amount Requirements
- Jetpac Banana Medal Amount: represented by the Banana Medal counter, controls how many Banana Medals must be collected before the Jetpac check in the DK Isles Full Level hub is accessible
- Medal Colored Banana Amount: represented by the Donkey Kong yellow banana bunch, controls how many colored bananas must be collected for each Kong's Banana Medal check in each level. The map tracker internally converts the marked Kongs, Abilities, and Settings into a current total available vanilla colored banana amount per level per kong to determine the accessibility of these checks
- Rareware Banana Fairy Amount: represented by the Banana Fairy counter, controls how many Banana Fairies must be collected before the Rareware Golden Banana check is accessible
- Helm B. Locker Amount: represented by the Golden Banana counter, controls how many Golden Bananas the Helm B. Locker requires. Meeting or exceeding the Golden Banana amount will make the Hideout Helm level hub accessible (if the player also has Gorilla Gone, Vine Swinging, and Helm Lobby access)
- Helm Door 1 / 2 Amount: represented by both Helm Door counters along with the collectible icon beneath them, together these control the type and amount of collectibles needed for each Helm door. Note that being able to open Helm Door 1 but not Helm Door 2 allows the player to peek the Key 8 and 2 vanilla Helm Banana Fairy item checks, but otherwise the doors are interchangable

### Logic Settings
The default settings mimic those set by the "Season 2 Race Settings" preset. There are 16 available options corresponding to various toggles in the randomizer that affect location logic in some way:
- Open Lobbies: represented by the B. Locker icon, controls whether the lobbies expect their respective keys for logical access. Note that, if this setting is enabled, lobbies 2 and 6 will still need a way to access upper DK Isles
- Open Levels: represented by the Peanut Popgun Switch icon, toggles logic analogous to the "Open Levels" option in the randomizer settings
- Remove High Requirements: represented by the Gorilla Grab lever icon, toggles logic analogous to the "Remove High Requirements" option in the randomizer settings. This defaults to ON
- Progressive Switch Strength: represented by the Super Simian Slam Chunky Switch icon, changes behavior of locations behind Simian Slam switches such that switches in the first 4 randomized levels require Simian Slam, switches in levels 5 and 6 require Super Simian Slam, and switches in level 7 require Super Duper Simian Slam (including the Galleon lobby switch as the same Slam level as Galleon itself). This defaults to ON
- Fast Golden Bananas: represented by the sparkling Golden Banana icon, toggles logic analogous to the "Fast GBs" option in the randomizer settings (which only affects the logical requirements of Round 1 Arcade and Mermaid Pearl amount to turn in). This defaults to ON
- Auto Complete Bonus Barrels: represented by the Bonus Barrel icon, changes the logic of a handful of Bonus Barrels to not require certain movement to the Bonus Barrel, such as Diddy's Bonus Barrel in Snide's DK Isles Lobby no longer requiring Simian Spring
- Hard Shooting: represented by the Coconut Gun image, changes the logic of a few locations to no longer require Homing Ammo or Sniper Scope in logic. Note that these locations will display as yellow if all other logical requirements are met when this setting is turned off, indicating that they can still be acquired, but it is not expected in logic
- Free Trade Agreement: represented by the Tag Barrel icon, toggles logic for locations accessible without their assigned Kong unlocked yet (mostly vanilla Kasplat locations). Note that since the tracker has no knowledge of what the actual collectible will be from checks, this setting when enabled mirrors the logic of both the "Major Collectibles" and "Major Collectibles except Blueprints" options for Free Trade Agreement in the randomizer. This defaults to ON
- Pre-Activated Bananaports: represented by the Bananaport 1 icon, toggles logic allowing access to some areas early if the Bananaports in those areas are pre-activated. Analogous with the "Activate Bananaports" setting in the randomizer, defaults to Isles Only
- Helm Start Location: represented by the top of Krem Isle icon, toggles logic expecting certain moves for checks in the Hideout Helm level hub. Analogous to the "Helm Start Location" option in the randomizer, defaults to Skip Start (icon highlighted with ½ to denote starting halfway through Helm)
- Kongless Hint Doors: represented by the Diddy Wrinkly Hint door with Donkey Kong's thinking face, this makes all locations in the Hint Pool accessible as soon as any Kong can access the location. This defaults to ON
- Remove Wrinkly Puzzles: represented by a Boulder when right-clicking the Kongless Hint Door icon, this changes a few Hint Pool locations in Aztec, Forest, and Caves lobbies to align with the changes made by the "Remove Wrinkly Puzzles" option in the Misc Changes selector in the randomizer. This defaults to ON
- Kasplat Location Shuffler: represented by the Kasplat icon, analogous to the "Shuffle Kasplat" options in the randomizer. "Vanilla" and "Vanilla Locations" will maintain the Kasplat location boxes in each level, "Location Shuffle" (the Kasplat with ?'s) will move all Kasplat locations into each level's Full Level hub and all Kasplat rewards will show as in logic in each level as soon as you have that respective Kong
- Colored Banana Location Shuffler: represented by the 5 single bananas icon. Removes the logic pertaining to vanilla colored bananas for each level's Banana Medal checks, so each Kong's Banana Medal check in a level will simply be displayed as in logic as soon as that Kong is acquired and that level is accessible
- Battle Arena Location Shuffler: represented by the Battle Arena icon. Note that, when enabled, the Battle Arena vanilla locations will be moved into each level's Full Level hub and the check (2 checks in Isles) will show as in logic as soon as you have access to a level
- Banana Fairy Location Shuffler: represented by the X'd out Fairy icon. Note that, when enabled, the Banana Fairy vanilla locations will be moved into each level's Full Level hub and the 2 checks (4 in Isles) will show as peekable as soon as you have access to a level, and in logic as soon as you have the Fairy Camera
- Dirt Patch Location Shuffler: represented by the deconstructed Dirt Patch icon. Note that, when enabled, the Dirt Patch vanilla locations will be removed in each level and replaced by 2 checks (4 in Isles) in each level's Full Level hub. The checks will be in logic once you have the Shockwave ability, and note that while each level has 2 locations available, in practice each level will have 1 to 2 dirt patch locations, except Isles which will always have exactly 4

# Instructions for use:
1. Download EmoTracker at https://emotracker.net/
2. Download Banana Tracker as a zip file.
3. Locate your EmoTracker folder in file explorer (likely in your Documents folder).
4. Extract the Banana Tracker zip file. Open the unzipped folder and move the `BananaTracker` folder into the `\EmoTracker\packs` folder. 
   - Note: Make sure you don't drag the entire extracted folder into the packs folder. The location should look like this: `\Emotracker\packs\BananaTracker` 
5. Open EmoTracker. Click the gear, then "Installed Packages." Banana Tracker will be located under "Other."

# Changelog
### General changes
- Removed horizontal layout competing with vertical layout and consolidated down to 1 layout
- Updated default settings to match Season 2 Race Settings
- Added Rainbow Coin amount as a selectable Helm door option, with a Max quantity of 16
- Changed level colors for single checks, shops, and hubs to match colors displayed in Wrinkly hints
- Made Spider Boss check capturable to align with added item preview
- Renamed internal setting names to align with changes to the Randomizer
- Updated this README with version 1.3.1 and this changelog

### Logic changes
- Upper mushroom access in Fungi Forest is now fully in logic without any additional moves (formerly out of logic without vine, Diddy + Rocketbarrel, or every Kong + their gun)
- Tiny GB in Galleon Lobby now shows as obtainable Out of Logic by substituting Pony Tail Twirl with DK (This accounts for kicking from near the B. Locker to the Mini Monkey barrel as DK and Tagging Anywhere to Tiny)
- DK Lava GB in Caves Lobby now requires Orange to skip Strong Kong out of logic
- Llama Kong Cage Prize and Kong now require Dive in logic in addition to a Gun + Instrument combo
- Diddy Production Room GB is now obtainable Out of Logic by substituting Simian Spring with Tiny + Pony Tail Twirl (Twirling down from near Tiny's Bonus GB)
- Updated Lighthouse Dirt Patch to expect lighthouse platform access like the Lighthouse GB check
- Lanky Dungeon Toxic Waste Bonus GB can now be peeked without Baboon Balloon if the player has Tiny + Pony Tail Twirl
