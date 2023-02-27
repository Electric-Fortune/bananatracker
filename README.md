# Banana Tracker
- An [EmoTracker](https://emotracker.net/) pack for the [Donkey Kong 64 randomizer](https://github.com/2dos/dk64-randomizer) but can also be used for vanilla Donkey Kong 64 as well.
- Current Version: **Version 1.2.7** (February ?? 2023)
<img src="https://raw.githubusercontent.com/jxjacob/bananatracker/master/bananatracker_example.PNG">

# Features
This tracker features tracking packs for various DK64 Randomizer settings as well as 101% playthroughs.

### Standard Randomizer
- All kongs' Cranky upgrades, Funky guns, Candy instruments and blueprint count (up to 8).
- Progressive Simian Slam
- Homing Ammo and Sniper Scope Funky upgrades
- Fairy Camera
- Golden Banana Count
- Keys and Crowns available in each level

### Long Randomizer
- Features all existing functionality from the Standard Randomizer pack
- Adds the Nintendo and Rareware coins as a progressive counter
- Adds a Banana Medal counter

### 101% Playthrough Tracker
- Lists only items that count towards the 101% counter (plus Blueprints)

### Level Order Randomizer Race
- Features existing functionality from the Standard Randomizer pack for all moves/collectibles
- Levels now cycle through the 7 available options for Level Order Randomizer (Crown tracking is removed)

### Level Order Randomizer Race w/Shops
- Adds an additional pane for tracking purchases from Funky, Cranky, and Candy in each level

### Full Item Level Order Randomizer
- Features all existing functionality from the Level Order Randomizer Race pack
- Adds tracking for the Training Ground moves (Diving, Orange Throwing, Barrel Throwing, Vine Swinging)
- Adds Shockwave as a separate upgrade from the Fairy Camera
- Adds the progressive Company Coin tracker from the Long Randomizer pack
- Adds counters for Battle Crowns, Banana Fairies, and Banana Medals
- Adds a checkmark overlay to each key (shown by right clicking on any key)

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

## Map Tracker Usage
When using the Full Item Level Order Randomizer Map Tracker pack, the locations of item checks update based on the items the player has currently highlighted in the Items tracker. The color of each location represents the accessibility of the check as follows:
- White: This item check is accessible and in logic for the player to obtain
- Yellow: This item check is accessible, but not in logic
- Blue: This item check is not accessible, but can be peeked to see what type of item the check contains
- Red: This item check is not accessible and not peekable
- Orange: This location contains multiple item checks at varying levels of accessibility
- Gray: This location has been checked off and is empty

Note that the map tracker is using glitchless logic to determine the accessibility of its map locations. Some checks may be marked yellow as out of logic if they are accessible using damage boosting, Tag Anywhere, advanced platforming, or an option not currently set in the settings menu
The tracker's logic also assumes a few attributes that would be too volatile to be useful:
- Every location requires either a specific Kong or any Kong, so no locations will show up until a Kong is highlighted in the Item tracker
- All non-Isles level locations and level lobby locations will not be in logic until the appropriate level is selected in the Item tracker and the player can access that lobby from DK Isles
- Each level has a "Full Level" location hub next to its title indicating checks that can be acquired anywhere in the level, such as Banana Medals or Bosses
- The Jetpac game check, which can be acquired in any Cranky's Lab, is located in the Isles Full Level hub once the player has enough Banana Medals marked on the Item tracker
- Bonus Barrel checks are in logic as soon as the barrel can be accessed with the Kong assigned to the barrel, without considering the potential additional requirements of the minigame within
- The logic has no knowledge of Colored Bananas or Banana Coins, so Bosses are marked as accessible in logic as soon as you have access to a level, Banana Medals are accessible as soon as you have their corresponding Kong, and Shop purchases are accessible as soon as you have that Kong and can access the shop
- If Kasplats are shuffled between their vanilla locations, they will be marked as accessible as soon as any Kong can defeat them, even if the proper Kong is not owned yet
- The Kong freeing puzzles are accessible in logic as soon as any valid Kong has the requirements to open the Kong cage
- The two Golden Bananas involving Diddy's cage in Japes have event flags tied to them, corresponding to collecting the item in front of the cage (which spawns the gun switches), and collecting the item within the cage (which opens the gates to the rest of Japes)

Many item check locations are capturable using the dashed box next to the vanilla item icon. Only item checks that cannot be seen until they are immediately collectable lack this capture box (such as the Squawks instrument pads on Isles or Dirt Patch rewards). The capture box items contain some quirks:
- The generic potion can apply to many different abilities on the Item tracker, and thus will not update any particular ability when the location is checked
- Similarly the generic key can apply to any of the 8 keys, but due to each key behaving differently in the logic, the captured key will not update any particular key on the Item tracker
- The Nintendo and Rareware coins will not update the Item tracker Company Coin slot due to its progressive nature
- An ice trap option is given for checks that can be visually identified as an ice trap, checking these will increment an internal ice trap counter that is otherwise not represented on the Item tracker (ice trap visual borrowed from Hamsda's ZOoTR Map Tracker)
- All other items on the capture menu will correctly increment or toggle their associated item on the Item tracker when the captured location is checked

The tracker features a settings menu accessible by clicking the gear icon above the Item tracker. These settings include the randomizer settings that impact the logic in a trackable way, and are split into 4 groups of settings: Item Pools, Logic Settings, Location Randomizers, and Check Amount Requirements
- Each item pool setting toggles the visibility of its respective vanilla item type locations. The Miscellaneous Pool controls the visibility of the Pearl treasure chest location in Galleon and the Bean anthill location in Forest (separate from the Golden Banana)
There are 10 available options corresponding to various toggles in the randomizer that affect location logic in some way:
- Open Lobbies: represented by the B. Locker icon, controls whether the lobbies expect their respective keys for logical access. Note that lobbies 2 and 6 will still need a way to access upper DK Isles
- Open Levels: represented by the Peanut Popgun Switch icon, toggles logic analogous to the "Open Levels" option in the randomizer settings
- Remove High Requirements: represented by the Gorilla Grab lever icon, toggles logic analogous to the "Remove High Requirements" option in the randomizer settings. This defaults to ON
- Pre-Activated Bananaports: represented by the 1 Bananaport icon, toggles logic allowing access to some areas early if the Bananaports in those areas are pre-activated. Comes with 3 settings: Off, Isles Only, and On to align with the "Activate Bananaports" setting in the randomizer, defaults to Isles Only
- Helm Skip Amount: represented by the top of Krem Isle icon, toggles logic expecting certain moves for checks in the Hideout Helm location hub. Analogous to the "Helm Start Location" option in the randomizer, this option comes with 3 settings: Skip None, Skip Half, and Skip Full, analogous to Vanilla, Skip Start, and Skip All settings respectively, defaults to Skip Half
- Progressive Switch Strength: represented by the Super Simian Slam Chunky Switch icon, changes behavior of locations behind Simian Slam switches such that switches in the first 4 randomized levels require Simian Slam, switches in levels 5 and 6 require Super Simian Slam, and switches in level 7 require Super Duper Simian Slam. Defaults to ON
- Hard Shooting: represented by the Coconut Gun image, changes the logic of a few locations to no longer require Homing Ammo or Sniper Scope in logic. Note that these locations will display as yellow if all other logical requirements are met when this setting is turned off, indicating that they can still be acquired, but it is not expected in logic
- Auto Complete Bonus Barrels: represented by the Bonus Barrel icon, changes the logic of a handful of Bonus Barrels to not require certain movement to the Bonus Barrel, such as Tiny's Bonus Barrel in Aztec Lobby no longer requiring Pony Tail Twirl if this setting is enabled
- Fast Golden Bananas: represented by the sparkling Golden Banana icon, toggles logic analogous to the "Fast GBs" option in the randomizer settings (which only affects the logical requirements of Round 1 Arcade and Mermaid Pearl amount to turn in). This defaults to ON
- Free Trade Agreement: represented by the Tag Barrel icon, toggles logic for locations accessible without their assigned Kong unlocked yet (mostly vanilla Kasplat locations). Note that since the tracker has no knowledge of what the actual collectible will be from checks, both the "Major Collectibles" and "Major Collectibles except Blueprints" options for Free Trade Agreement in the randomizer are included when this setting is enabled
The next 4 options control the enabling of custom location randomizers. When enabled, these options will remove their respective vanilla locations from each level and place a location for that/those item(s) in that level's "Full Level" location hub instead
- Kasplat Location Randomizer: represented by the Kasplat icon, comes with 3 settings: Vanilla, Swap, and Randomized, analogous to the "Shuffle Kasplat" options in the randomizer: "Vanilla", "Vanilla Locations", and "Location Shuffle", respectively. Defaults to "Swap (Vanilla Locations)", note that when Randomized (the Kasplat with ?'s), all Kasplat rewards will show as in logic in each level as soon as you have their respective Kong
- Battle Arena Location Randomizer: represented by the Battle Arena icon, note that the location in each level (2 in Isles) will show as in logic as soon as you have access to a level
- Banana Fairy Location Randomizer: represented by the X'd out Fairy icon, note that the 2 locations in each level (4 in Isles) will show as peekable as soon as you have access to a level, and in logic as soon as you have the Fairy Camera
- Dirt Patch Location Randomizer: represented by the deconstructed Dirt Patch icon, note that the 2 locations in each level (4 in Isles) will be in logic once you have the Shockwave ability, and note that while each level has 2 locations available, in practice each level will have 1 or 2 dirt patch locations
- The last 4 options control the amounts of certain collectibles needed for certain checks as input by the player when creating the seed or found on hints if randomized
- Rareware Banana Fairy Amount: represented by the Banana Fairy counter, controls how many Banana Fairies the Banana Fairy Queen expects before opening the door to the Rareware Golden Banana check
- Jetpac Banana Medal Amount: represented by the Banana Medal counter, controls how many Banana Medals Cranky requires before allowing you to play Jetpac and check the reward for it
- Helm Door 1/2 Amount: represented by both Helm Door counters along with the collectible icon beneath them, together these control the type and amount of collectibles needed for each Helm door. Note that being able to open Helm Door 1 but not Helm Door 2 allows the player to peek the Key 8 and 2 Helm Banana Fairy items, but otherwise the doors are interchangable

# Instructions for use:
1. Download EmoTracker at https://emotracker.net/
2. Download Banana Tracker as a zip file.
3. Locate your EmoTracker folder in file explorer (likely in your Documents folder).
4. Extract the Banana Tracker zip file. Open the unzipped folder and move the `BananaTracker` folder into the `\EmoTracker\packs` folder. 
   - Note: Make sure you don't drag the entire extracted folder into the packs folder. The location should look like this: `\Emotracker\packs\BananaTracker` 
5. Open EmoTracker. Click the gear, then "Installed Packages." Banana Tracker will be located under "Other."
