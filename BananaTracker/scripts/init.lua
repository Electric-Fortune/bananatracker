ScriptHost:LoadScript("scripts/globals.lua")
if HAS_MAP then
  ScriptHost:LoadScript("scripts/logic_helpers.lua")
end

Tracker:AddItems("items/items.json")
if HAS_MAP then
  Tracker:AddItems("items/levels.json")
  Tracker:AddItems("items/progression.json")
  Tracker:AddItems("items/options.json")
  Tracker:AddItems("items/pools.json")

  Tracker:AddMaps("maps/maps.json")

  Tracker:AddLocations("locations/logic.json")
  Tracker:AddLocations("locations/world.json")
  Tracker:AddLocations("locations/hubs.json")
end

Tracker:AddLayouts("layouts/tracker.json")
Tracker:AddLayouts("layouts/broadcast.json")