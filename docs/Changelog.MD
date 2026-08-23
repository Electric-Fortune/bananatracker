# Changelog
## Version 1.5.0
### New Features
- Added Climb to the item tracker
- Added Half-Medals, Helm Medals, Holdable Objects, and Snide Reward pools/locations
- Added Shop Owners to the item tracker
- Added all Switchsanity options, moved Helm Switchsanity from Endgame tracker into Switchsanity menu
- Added Hint tracking section
- Added Helm Barriers
- Split K. Rool Phase modifiers to individual options
- Added all forms of Advanced Glitchless Logic as options to enable (Hard Shooting, Advanced Grenading, Monkey Maneuvers, Slope Resets)
- Added Season 5 Hint locations
- Added DK Portal Location Shuffler (main maps only)
- Added Boss Location Shuffler

## General Changes
- Reordered existing Pools/Locations to match Randomizer's Pool/Check system
- Changed Company Coins, Homing Ammo/Sniper Scope, and Camera/Shockwave to be double toggleable rather than progressive
- Moved all images into base pack's images folder for compatibility with EmoTracker 3.0+
- Updated many images for standardized sizing

## Logic Changes
- Added logic regions for each level to simplify logic and add compatibility with DK Portal Shuffler
- Too many individual location updates to count

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