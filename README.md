# Banana Tracker
- An [EmoTracker](https://emotracker.net/) pack for the [Donkey Kong 64 randomizer](https://github.com/2dos/dk64-randomizer) but can also be used for vanilla Donkey Kong 64 as well.
- Current Version: **Version 1.4.0** (June 18, 2024)
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
- Adds an Endgame Tracker for tracking Helm Access Switchsanity, Helm Order, and K. Rool Order
- Adds interactive maps for each main level with locations for every item check in full item randomizer (excluding Dropsanity)
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
- Map logic assumes default Switches for Switchsanity except for the Helm Access options

### Capturing Items
Many item check locations are capturable using the dashed box next to the vanilla item icon. All item checks possess this capture box except checks that cannot be seen until they are immediately collectable (such as the Squawks instrument pads on Isles or Dirt Patch rewards). The capture box items contain some quirks:
- The potions can apply to many different abilities on the tracker, and thus will not update any particular ability when the location is checked
- Similarly, the generic Key item can apply to any of the 8 Keys, but due to each Key behaving differently in the logic, the captured Key will not update any particular Key on the tracker. The generic Key counter will update to reflect the total number of specific Keys collected if a new specific Key is marked
- The Nintendo and Rareware coins will not update the progressive Company Coins on the tracker due to their progressive nature
- An ice trap option is given for checks that can be visually identified as an ice trap, checking these will increment an internal ice trap counter that is otherwise not represented on the tracker (ice trap visual borrowed from Hamsda's ZOoTR Map Tracker)
- All other items on the capture menu will correctly increment or highlight their associated item on the tracker when the captured location is checked

## Settings
The tracker features a settings menu accessible by clicking the gear icon above the "Kong / Abilities / Collectables / Lobbies" tracker. These settings include the randomizer settings that impact the logic in a trackable way, and are split into 5 groups of settings: Main Logic Settings, Item Pools, Check Amount Thresholds, Location Shufflers, and Open Barriers

### Main Logic Settings
The default settings mimic those set by the "Season 3 Race Settings" preset. There are 12 available options corresponding to various toggles in the randomizer that affect location logic in some way:
- Auto Complete Bonus Barrels: represented by the Bonus Barrel icon, changes the logic of a handful of Bonus Barrels to not require certain movement to the Bonus Barrel, such as Diddy's Bonus Barrel in Snide's DK Isles Lobby no longer requiring Simian Spring. Defaults to OFF in Season 3 settings
- Open Lobbies: represented by the B. Locker icon, controls whether the lobbies expect their respective keys for logical access. Note that, if this setting is enabled, lobbies 2 and 6 will still need a way to access upper DK Isles. Defaults to OFF in Season 3 settings
- Progressive Switch Strength: represented by the Super Simian Slam Chunky Switch icon, changes behavior of locations behind Simian Slam switches such that switches in the first 4 randomized levels require Simian Slam, switches in levels 5 and 6 require Super Simian Slam, and switches in level 7 require Super Duper Simian Slam (including the Galleon lobby switch as the same Slam level as Galleon itself). Defaults to ON in Season 3 settings
- Free Trade Agreement: represented by the Tag Barrel icon, toggles logic for locations accessible without their assigned Kong unlocked yet (mostly vanilla Kasplat locations). Note that since the tracker has no knowledge of what the actual collectible will be from checks, this setting when enabled mirrors the logic of both the "Major Collectibles" and "Major Collectibles except Blueprints" options for Free Trade Agreement in the randomizer
- Factory DK Arcade GB Location: represented by the shiny Golden Banana / Gorilla Grab icon, changes location of the DK Arcade GB to the Barrel Blast course if the Shiny Golden Banana is toggled, matching the Faster Check option. Defaults to ON in Season 3 settings
- Galleon Cheap Mermaid: represented by the Mermaid icon, changes behavior of the Mermaid check in Galleon to be in logic with 1 out of 5 pearls, matching the Faster Check option. Defaults to ON in Season 3 settings
- Galleon Default Water Level: represented by the Enguarde icon, changes the logic of checks in Galleon to assume either lowered or raised water by default. Defaults to Raised in Season 3 settings
- Forest Default Time: represented by the Shroom Kremling and/or Krossbones icon, changes the logic of checks in Forest to assume either Day, Night, or both (Dusk) for various access checks. Any Progressive time setting also should set time to the Dusk setting as all times can be accessed without additional logical requirements. Defaults to Day in Season 3 settings
- Hard Shooting: represented by the Coconut Gun image, changes the logic of a few locations to no longer require Homing Ammo or Sniper Scope in logic. Note that these locations will display as yellow if all other logical requirements are met when this setting is turned off, indicating that they can still be acquired, but it is not expected in logic. Defaults to OFF in Season 3 settings
- Pre-Activated Bananaports: represented by the Bananaport 1 icon, toggles logic allowing access to some areas early if the Bananaports in those areas are pre-activated. Analogous with the "Activate Bananaports" setting in the randomizer, defaults to Isles Only
- Helm Start Location: represented by the top of Krem Isle icon, toggles logic expecting certain moves for checks in the Hideout Helm level hub. Analogous to the "Helm Start Location" option in the randomizer, defaults to Skip Start (icon highlighted with ½ to denote starting halfway through Helm) in Season 3 Settings
- Kongless Hint Doors: represented by the Diddy Wrinkly Hint door with Donkey Kong's thinking face, this makes all locations in the Hint Pool accessible as soon as any Kong can access the location. Defaults to ON in Season 3 settings
- Remove Wrinkly Puzzles: represented by a Boulder when right-clicking the Kongless Hint Door icon, this changes a few Hint Pool locations in Aztec, Forest, and Caves lobbies to align with the changes made by the "Remove Wrinkly Puzzles" option in the Misc Changes selector in the randomizer. Defaults to ON in Season 3 settings

### Item Pools
- Each item pool setting toggles the visibility of its respective vanilla item type locations
- The Tough Golden Banana Pool, represented by the Rabbit, controls the visibility of certain Golden Bananas deemed particularly difficult (consult the generator website for more info)
- The Miscellaneous Pool, represented by the Bean, controls the visibility of the Pearl treasure chest location in Galleon as well as the Bean anthill location in Forest (separate from the Golden Banana)
- The Hint Pool, represented by Wrinkly's face, controls the visibility of 5 Wrinkly Door check locations in each lobby. These do not correspond to an actual check location, but are a useful tracker for determining which hints have already been read. This pool defaults to OFF

### Check Thresholds
- Jetpac Banana Medal Amount: represented by the Banana Medal counter, controls how many Banana Medals must be collected before the Jetpac check in the DK Isles Full Level hub is accessible
- Medal Colored Banana Amount: represented by the Donkey Kong yellow banana bunch, controls how many colored bananas must be collected for each Kong's Banana Medal check in each level. The map tracker internally converts the marked Kongs, Abilities, and Settings into a current total available vanilla colored banana amount per level per kong to determine the accessibility of these checks
- Rareware Banana Fairy Amount: represented by the Banana Fairy counter, controls how many Banana Fairies must be collected before the Rareware Golden Banana check is accessible
- Helm B. Locker Amount: represented by the Golden Banana counter, controls how many Golden Bananas the Helm B. Locker requires. Meeting or exceeding the Golden Banana amount will make the Hideout Helm level hub accessible (if the player also has Gorilla Gone, Vine Swinging, and Helm Lobby access)
- Helm Door 1 / 2 Amount: represented by both Helm Door counters along with the collectible icon beneath them, together these control the type and amount of collectibles needed for each Helm door. Note that being able to open Helm Door 1 but not Helm Door 2 allows the player to peek the Key 8 and 2 vanilla Helm Banana Fairy item checks, but otherwise the doors are interchangable

### Location Shufflers
- Banana Fairy Location Shuffler: represented by the X'd out Fairy icon. Note that, when enabled, the Banana Fairy vanilla locations will be moved into each level's Full Level hub and the 2 checks (4 in Isles) will show as peekable as soon as you have access to a level, and in logic as soon as you have the Fairy Camera
- Kasplat Location Shuffler: represented by the Kasplat icon, analogous to the "Shuffle Kasplat" options in the randomizer. "Vanilla" and "Vanilla Locations" will maintain the Kasplat location boxes in each level, "Location Shuffle" (the Kasplat with ?'s) will move all Kasplat locations into each level's Full Level hub and all Kasplat rewards will show as in logic in each level as soon as you have that respective Kong
- Battle Arena Location Shuffler: represented by the Battle Arena icon. Note that, when enabled, the Battle Arena vanilla locations will be moved into each level's Full Level hub and the check (2 checks in Isles) will show as in logic as soon as you have access to a level
- Colored Banana Location Shuffler: represented by the 5 single bananas icon. Removes the logic pertaining to vanilla colored bananas for each level's Banana Medal checks, so each Kong's Banana Medal check in a level will simply be displayed as in logic as soon as that Kong is acquired and that level is accessible
- Dirt Patch Location Shuffler: represented by the Dirt Patch icon. Note that, when enabled, the Dirt Patch vanilla locations will be removed in each level and replaced by 2 checks (4 in Isles) in each level's Full Level hub. The checks will be in logic once you have the Shockwave ability, and note that while each level has 2 locations available, in practice each level will have 1 to 2 Dirt Patch locations, except Isles which will always have exactly 4
- Melon Crate Location Shuffler: represented by the Melon Crate icon. Note that, when enabled, the Melon Crate vanilla locations will be removed in each level and replaced by 2 checks in each level's Full Level hub. Further note that while each level has 2 locations available, in practice each level will have 1 or 2 Melon Crate locations

### Endgame/Go Mode Tracker
- The "GET OUT" Text under the Helm selector will automatically illuminates when the tracker identifies that everything required to beat the game is satisfied based on your Endgame Tracker:
- If the K. Rool Barrel icon is illuminated, the tracker will check for Helm Entry requirements and completing Helm requirements to get to the Key 8 item location. If the K. Rool icon is illuminated, the tracker will check for the necessary moves for every selected Kong to defeat their Phase of the K. Rool fight
- The top of Krem Isle icon denotes the move needed to get to the top of Krem Isle near the entrance to Helm Lobby. It can be Monkeyport, Barrel Blast, or Baboon Balloon
- The Vines icon denotes the move needed to spawn the vines in Helm Lobby. It can be Gorilla Gone, Gorilla Grab, Chimpy Charge, or any instrument. Note you will still always need vines to actually cross the lobby once spawned
- The K. Rool Barrel icon denotes the seed's helm order. The Kongs that disable Helm should be input left to right, with any unused slots set to the Funky icon. If Key 8/An endgoal item isn't locked in Helm, the K. Rool Barrel icon itself should be right clicked to indicate it is not part of the seed's Go Mode
- The K. Rool icon denotes the seed's K. Rool order. The Kongs that fight K. Rool should be input left to right, with any unused slots set to the Funky icon. If the seed's win condition is not set to Beat K. Rool, the K. Rool icon itself should be left clicked to indicate it is not part of the seed's Go Mode
- With Season 3 settings, the K. Rool icon will start with a DK Barrel Blast icon badge to indicate Balanced K. Rool Phases are being used (DK Phase needs Barrel Blast, Chunky Phase only needs Simian Slam level 1). Right clicking the icon will disable Balanced Phases

# Instructions for use:
1. Download EmoTracker at https://emotracker.net/
2. Download Banana Tracker as a zip file.
3. Locate your EmoTracker folder in file explorer (likely in your Documents folder).
4. Extract the Banana Tracker zip file. Open the unzipped folder and move the `BananaTracker` folder into the `\EmoTracker\packs` folder. 
   - Note: Make sure you don't drag the entire extracted folder into the packs folder. The location should look like this: `\Emotracker\packs\BananaTracker` 
5. Open EmoTracker. Click the gear, then "Installed Packages." Banana Tracker will be located under "Other."


# Changelog
## Version 1.4.0
### New Features
- Implemented Melon Crate pool randomizer and location randomizer option
- Implemented ability to start without a Slam upgrade and the logic associated
- Added a new Endgame Tracker section for recording your Helm Order, K. Rool Order, and Helm Access Switchsanity requirements
- Revamped the Options Menu to split different options types into their own tabs
- Added new options for the default Galleon water level and default Forest Time of Day
- Added an Options tab for Open Barriers, to match the Removed Barriers settings (Except "Galleon Shipwreck Gates" as this setting is only a timesaver and does not affect logic)
- Built a Go Mode tracker based on your Endgame tracker options (In the form of a "GET OUT" icon under the items)

### General Changes
- Changed the Isles map to a higher quality image. Thanks to @cmcoffin on Github for providing the updated file!
- Updated a few other icons to standardize sizing
- Split the Fast GB setting into the individual DK Arcade/Barrel Course and Mermaid cost settings that affect logic. The DK Arcade/Barrel Course option keeps the shiny GB icon, the Mermaid cost option gains the Mermaid icon
- Updated all settings to match the Season 3 Preset
- Shifted some locations to make room for new Melon Crate locations
- Various other cosmetic fixes/enhancements

### Logic Changes
- Added Out-of-Logic flip to Aztec Roof Dirt Patch with Diddy/Tiny using Chunky's boulder
- Added Out-of-Logic rolling as DK to narrowly make the timer in K. Lumsy's cage room
- Fixed logic for Aztec Lobby Bonus
- Added very silly Out-of-Logic Pony Tail Twirl from a placed Chunky Boulder in Caves Lobby to skip Rocketbarrel to the Guitar Pad
- Added Out-of-Logic Diddy flip and Chunky tag to climb up to the Japes Minecart loading zone, skipping the slam requirement
- Added missing handling for free trade on the Aztec DK Kasplat
- Added the excruciating Out-of-Logic Pony Tail Twirl skip for the Caves Diddy Kasplat room
- Added Out-of-Logic Pony Tail Twirl and Chunky Boulder methods of getting to the Caves Lanky Kasplat pillar
- Removed Rocketbarrel as an in-logic requirement for the Diddy Enemy Cabin
- Added Out-of-Logic Pony Tail Twirl and Diddy tag to skip Simian Spring in Diddy Candle Cabin
- Added a Bunch of methods for various Kongs to get the Tiny Mausoleum item with an orange damage boost

## Version 1.3.1
### General Changes
- Removed horizontal layout competing with vertical layout and consolidated down to 1 layout
- Updated default settings to match Season 2 Race Settings
- Added Rainbow Coin amount as a selectable Helm door option, with a Max quantity of 16
- Changed level colors for single checks, shops, and hubs to match colors displayed in Wrinkly hints
- Made Spider Boss check capturable to align with added item preview
- Renamed internal setting names to align with changes to the Randomizer
- Updated this README with version 1.3.1 and this changelog

### Logic Changes
- Upper mushroom access in Fungi Forest is now fully in logic without any additional moves (formerly out of logic without vine, Diddy + Rocketbarrel, or every Kong + their gun)
- Tiny GB in Galleon Lobby now shows as obtainable Out of Logic by substituting Pony Tail Twirl with DK (This accounts for kicking from near the B. Locker to the Mini Monkey barrel as DK and Tagging Anywhere to Tiny)
- DK Lava GB in Caves Lobby now requires Orange to skip Strong Kong out of logic
- Llama Kong Cage Prize and Kong now require Dive in logic in addition to a Gun + Instrument combo
- Diddy Production Room GB is now obtainable Out of Logic by substituting Simian Spring with Tiny + Pony Tail Twirl (Twirling down from near Tiny's Bonus GB)
- Updated Lighthouse Dirt Patch to expect lighthouse platform access like the Lighthouse GB check
- Lanky Dungeon Toxic Waste Bonus GB can now be peeked without Baboon Balloon if the player has Tiny + Pony Tail Twirl