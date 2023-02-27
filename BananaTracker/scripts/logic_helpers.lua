-- Underscore prefixed functions return booleans.
-- For use with other functions because to Lua, '0' is truthy. /shrug
-- Otherwise most return an integer that's what the tracker expects.

--[[
  fn has(string, string) -> boolean

  Queries the tracker with a code and returns `true` if player has collected
  greater than or equal to `amount`, otherwise returns `false`.
]]--
function has(code, amount)
  local count = Tracker:ProviderCountForCode(code)
  amount = tonumber(amount)
  if not amount then
    amount = 1
  end
  return count >= amount
end

--[[
  fn not_has(string) -> boolean

  Queries the tracker with a code and returns `true` if the player has NOT
  collected that code, otherwise returns `false`.
]]
function not_has(code)
  local count = Tracker:ProviderCountForCode(code)
  return count < 1
end

--[[
  fn get_object(string) -> Option<Item>

  Queries the tracker with a code and returns the item object if exists,
  otherwise prints an error and returns `nil`.
]]--
function get_object(code)
  local object = Tracker:FindObjectForCode(code)
  if object then
    return object
  end
  print("[!ERR] unable to get_object: ", code)
  return nil
end

function wrinkly_puzzles()
  if has("no_wrinkly_puzzles") then
    return 0
  end
  return 1
end

function japes_slam()
  if has("ss") and (has("l1_japes") or has("l2_japes") or has("l3_japes") or has("l4_japes")) then
    return 1
  end
  if has("sss") and (has("l5_japes") or has("l6_japes")) then
    return 1
  end
  if has("sdss") and has("l7_japes") then
    return 1
  end
  return 0
end

function aztec_slam()
  if has("ss") and (has("l1_aztec") or has("l2_aztec") or has("l3_aztec") or has("l4_aztec")) then
    return 1
  end
  if has("sss") and (has("l5_aztec") or has("l6_aztec")) then
    return 1
  end
  if has("sdss") and has("l7_aztec") then
    return 1
  end
  return 0
end

function factory_slam()
  if has("ss") and (has("l1_factory") or has("l2_factory") or has("l3_factory") or has("l4_factory")) then
    return 1
  end
  if has("sss") and (has("l5_factory") or has("l6_factory")) then
    return 1
  end
  if has("sdss") and has("l7_factory") then
    return 1
  end
  return 0
end

function galleon_slam()
  if has("ss") and (has("l1_galleon") or has("l2_galleon") or has("l3_galleon") or has("l4_galleon")) then
    return 1
  end
  if has("sss") and (has("l5_galleon") or has("l6_galleon")) then
    return 1
  end
  if has("sdss") and has("l7_galleon") then
    return 1
  end
  return 0
end

function forest_slam()
  if has("ss") and (has("l1_forest") or has("l2_forest") or has("l3_forest") or has("l4_forest")) then
    return 1
  end
  if has("sss") and (has("l5_forest") or has("l6_forest")) then
    return 1
  end
  if has("sdss") and has("l7_forest") then
    return 1
  end
  return 0
end

function caves_slam()
  if has("ss") and (has("l1_caves") or has("l2_caves") or has("l3_caves") or has("l4_caves")) then
    return 1
  end
  if has("sss") and (has("l5_caves") or has("l6_caves")) then
    return 1
  end
  if has("sdss") and has("l7_caves") then
    return 1
  end
  return 0
end

function castle_slam()
  if has("ss") and (has("l1_castle") or has("l2_castle") or has("l3_castle") or has("l4_castle")) then
    return 1
  end
  if has("sss") and (has("l5_castle") or has("l6_castle")) then
    return 1
  end
  if has("sdss") and has("l7_castle") then
    return 1
  end
  return 0
end

function japes_dk_cbs(logic)
  logic = logic or ""
  if not_has("dk") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 36 --2x warp 3 bunches + 3x hillside tree bunches + T&S alcove bunch + 6 on hills near mountain
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if has("vine") or (logic == "ool") then
    cb_total = cb_total + 5 --5 in starting area between vines
  end
  if has("dkg") then
    cb_total = cb_total + 20 --Balloon by Chunky rock and balloon near Snide
  end
  if has("vine") and has("dkp") then
    cb_total = cb_total + 10 --2x bunches in Barrel Blast course
  end
  if has("japes_kong_freed") or has("open_levels") then
    cb_total = cb_total + 9 --Line of 9 between warp 4s
	if has("dkg") then
	  cb_total = cb_total + 20 --Balloon in front of Cranky's + bunch under Rambi crate + bunch in DK Rambi hut
	end
  end
  return cb_total >= cb_amount
end

function japes_di_cbs(logic)
  logic = logic or ""
  if not_has("di") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 32 --5 in starting area + 4x ground level tree bunches + 7 around mountain
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if has("dive") then
    cb_total = cb_total + 10 --2x bunches in underwater bushes near Warp 4 gate
  end
  if has("dig") then
    cb_total = cb_total + 30 --Balloon in first tunnel peanut room + balloon on top of mountain + bunch in mountain before peanut switch + 5 in mountain stream
	if (has("prog_switch_off") and has("ss")) or (has("prog_switch_on") and (japes_slam() == 1)) then
	  cb_total = cb_total + 15 --Balloon and bunch in conveyor room beyond slam switch door
	  if has("dim") or (logic == "ool") then
	    cb_total = cb_total + 5 --Bunch in minecart
	  end
	end
  end
  if has("japes_kong_freed") or has("open_levels") then
    cb_total = cb_total + 3 --3 near Diddy Kasplat
	if has("dk") and has ("dkg") then
	  cb_total = cb_total + 5 --Bunch in Diddy Rambi hut
	end
  end
  return cb_total >= cb_amount
end

function japes_la_cbs(logic)
  logic = logic or ""
  if not_has("la") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 10 --Bunch near Snide's HQ + Bunch on tree near Snide's HQ
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if has("lam") or (logic == "ool") then
    cb_total = cb_total + 2 --Lower 2 on slippery hill to painting room
  end
  if has("lam") or ((logic == "ool") and (has("dk") or (has("ti") and has("tim")))) then
    cb_total = cb_total + 1 --Upper 1 on slippery hill to painting room
	if has("di") and has("dig") then
	  cb_total = cb_total + 20 --2x bunches on stairs in painting room + 2x bunches on pegs
	  if has("lag") then
	    cb_total = cb_total + 10 --Balloon in painting room
	  end
	end
  end
  if has("dive") then
    cb_total = cb_total + 5 --Line of 5 in water
  end
  if has("di") and has("dig") and has("lag") then
    cb_total = cb_total + 5 --Bunch under Bonus Barrel in first tunnel peanut room
  end
  if has("japes_kong_freed") or has("open_levels") then
    cb_total = cb_total + 6 --Bunch on tree near Cranky's Lab + 1 to Lanky Kasplat
	if has("lam") or (logic == "ool") then
	  cb_total = cb_total + 4 --Lower 2 on both slippery hills in Lanky Kasplat room
	end
	if has("lam") then
	  cb_total = cb_total + 7 --Upper 1 on both slippery hills in Lanky Kasplat room + bunch at top of right hill
	end
	if has("lag") then
	  cb_total = cb_total + 20 --Balloon in Lanky Kasplat room + balloon near Lanky Rambi Hut
	end
	if has("dk") and has("dkg") then
	  cb_total = cb_total + 10 --Bunch in Lanky Rambi hut + 5 around Chunky switch beyond Rambi wall
	end
  end
  return cb_total >= cb_amount
end

function japes_ti_cbs(logic)
  logic = logic or ""
  if not_has("ti") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 5 --Line of 5 in first tunnel
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if has("di") and has("dig") and has("tig") then
    cb_total = cb_total + 5 --Bunch under Bonus Barrel in first tunnel peanut room
  end
  if has("japes_kong_freed") or has("open_levels") then
    cb_total = cb_total + 7 --Bunch on tree near Cranky's Lab + 2 before Rambi wall
	if has("dk") and has("dkg") then
	  cb_total = cb_total + 10 --Bunch in Tiny Rambi hut + line of 5 beyond Rambi wall
	  if has("tig") then
	    cb_total = cb_total + 10 --Balloon above Fairy pond beyond Rambi wall
	  end
	end
	if has("tig") then
	  cb_total = cb_total + 10 --Balloon near Tiny Rambi hut
	end
  end
  if has("open_levels") or (has("japes_kong_freed") and has("tig")) or (has("bananaport_all") and has("di") and has("dig")) then 
	cb_total = cb_total + 5 --Bunch in front of hive
	if has("tib") then
	  cb_total = cb_total + 30 --6x bunches in stump tunnels
	  if (has("prog_switch_off") and has("ss")) or (has("prog_switch_on") and (japes_slam() == 1)) then
		cb_total = cb_total + 8 --Ring of 8 around GB pedastal in hive
	  end
	  if has("tig") then
		cb_total = cb_total + 10 --Balloon in first room of hive
	  end
    end	  
  end
  return cb_total >= cb_amount
end

function japes_ch_cbs(logic)
  logic = logic or ""
  if not_has("ch") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 15 --2x bunches on Funky's Armory + 5 around underground X
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if has("brrl") and has("ss") then
    cb_total = cb_total + 15 --Line of 5 + 2x bunches in Chunky underground
  end
  if has("japes_kong_freed") or has("open_levels") then
    cb_total = cb_total + 5 --Bunch on Cranky's Lab
	if has("dk") and has("dkg") then
	  if has("chg") then
	    cb_total = cb_total + 30 --3x balloons around Chunky switch beyond Rambi wall
	  end
	  if has("brrl") then
	    cb_total = cb_total + 5 --Bunch inside boulder on top of Chunky switch beyond Rambi wall
	  end
	end
  end
  if has("japes_kong_freed") or has("open_levels") or (has("bananaport_all") and has("di") and has("dig") and (logic == "ool")) then
    cb_total = cb_total + 10 --Line of 10 in tunnel to feather gate
  end
  if (has("japes_kong_freed") and has("ti") and has("tig")) or has("open_levels") or (has("bananaport_all") and has("di") and has("dig")) then
	if has("chb") then
	  cb_total = cb_total + 20 --4x bunches on trees around Hunky Chunky barrel
    end
  end
  return cb_total >= cb_amount
end

function aztec_dk_cbs(logic)
  logic = logic or ""
  if not_has("dk") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 0 --All of Aztec requires some logic
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if has("vine") or (has("ti") and has("tim")) or (logic == "ool") then
    cb_total = cb_total + 18 --3x bunches on oasis trees + line of 3 to llama cage
	if has("dkg") and (has("dkb") or (logic == "ool")) then
	  cb_total = cb_total + 10 --2x bunches in sand bridge Kasplat room
	end
	if (has("di") and has("dii") and (has("dib") or has("vine"))) or has("open_levels") or has("bananaport_all") then
	  cb_total = cb_total + 7 --Line of 3 toward Snide's HQ + line of 4 up to llama temple
	  if has("dkg") then
	    cb_total = cb_total + 30 --2x balloons near Cranky's Lab + balloon behind llama temple
	  end
	  if has("dkg") or (has("la") and has("lag")) or (has("ti") and has("tig")) then
	    cb_total = cb_total + 15 --4x lines of 3 going up stairs to llama in temple + line of 3 going up to Kong freeing instrument pad
	  end
	  if ((has("dkg") or (has("la") and has("lag")) or (has("ti") and has("tig"))) and ((has("prog_switch_off") and has("ss")) or (has("prog_switch_on") and (aztec_slam() == 1)))) or has("bananaport_all") then
	    if has("dkb") or (logic == "ool") then
		  cb_total = cb_total + 20 --4x bunches in quicksand tunnel
		end
	  end
	end
  end
  return cb_total >= cb_amount
end

function aztec_di_cbs(logic)
  logic = logic or ""
  if not_has("di") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 0 --All of Aztec requires some logic
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if has("vine") or (has("ti") and has("tim")) or (logic == "ool") then
    cb_total = cb_total + 5 --Bunch on warp 2
	if has("dig") then
	  cb_total = cb_total + 10 --Balloon above warp 2
	end
	if has("dig") or ((logic == "ool") and ((has("la") and has("lag")) or (has("ti") and has("tig")) or (has("ch") and has("chg")))) then
	  if (logic == "ool") or (aztec_slam() == 1) then
	    cb_total = cb_total + 1 --Lowest monkey tongue banana
	  end
	  if ((has("prog_switch_off") and has("ss")) or (has("prog_switch_on") and (aztec_slam() == 1))) then
	    cb_total = cb_total + 2 --Upper 2 monkey tongue bananas
		if (logic == "ool") or has("dig") then
		  cb_total = cb_total + 5 --Nearest bunch on long tongue to guitar pad
		end
		if has("dig") then
		  cb_total = cb_total + 10 --2x further bunches on long tongue to guitar pad
		end
      end
	  if has("dive") then
	    cb_total = cb_total + 7 --Line of 3 from start to middle + line of 4 from middle to Kong cage
	  end
	end
	if (has("dii") and (has("dib") or has("vine"))) or has("open_levels") or has("bananaport_all") then
	  cb_total = cb_total + 30 --Line of 5 from Aztec door to pressure plate + line of 3 up to Rocketbarrel barrel + line of 3 up to gong tower + 3x bunches on trees around gong tower + line of 4 going up stairs on 5 door temple
	  if has("dib") then
	    cb_total = cb_total + 10 --Bunch in sun above totem + bunch above llama temple
	  end
	  if has("dig") and (has("no_hi_reqs") or (has("dib") and ((has("prog_switch_off") and has("ss")) or (has("prog_switch_on") and (aztec_slam() == 1))))) then
	    cb_total = cb_total + 10 --Balloon in Diddy 5 door temple
	  end
	  if has("dig") and (has("bananaport_all") or (has("dk") and (has("dkg") or (has("la") and has("lag")) or (has("ti") and has("tig"))) and ((has("prog_switch_off") and has("ss")) or (has("prog_switch_on") and (aztec_slam() == 1))) and (has("dkb") or (logic == "ool")))) then
	    cb_total = cb_total + 10 --Balloon in quicksand tunnel
	  end
	end
  end
  return cb_total >= cb_amount
end

function aztec_la_cbs(logic)
  logic = logic or ""
  if not_has("la") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 0 --All of Aztec requires some logic
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if has("vine") or (has("ti") and has("tim")) or (logic == "ool") then
    cb_total = cb_total + 5 --Line of 5 from coconut door in early tunnel to oasis
	if has("lag") or ((logic == "ool") and ((has("di") and has("dig")) or (has("ti") and has("tig")) or (has("ch") and has("chg")))) then
	  if has("dive") then
	    cb_total = cb_total + 14 --Set of 9 approaching and around vulture pillar + bunch above slam switch on vulture pillar
	  end
	end
	if (has("di") and has("dii") and (has("dib") or has("vine"))) or has("open_levels") or has("bananaport_all") then
	  cb_total = cb_total + 35 --Line of 5 on winding skinny path to Cranky's Lab + bunch near Cranky's Lab + 5x bunches on trees around totem
	  if has("lag") and (has("no_hi_reqs") or (has("di") and has("dig") and has("dib") and ((has("prog_switch_off") and has("ss")) or (has("prog_switch_on") and (aztec_slam() == 1))))) then
	    cb_total = cb_total + 10 --Balloon in Lanky 5 door temple
	  end
	  if has("lag") or (has("dk") and has("dkg")) or (has("ti") and has("tig")) then
	    cb_total = cb_total + 11 --2x lines of 3 going up stairs to entrance + bunch on entrance warp 1
        if has("lag") and has("vine") then
		  cb_total = cb_total + 5 --Bunch after defeating enemies in matching game room
		end
		if has("lag") and ((has("dk") and has("dki")) or (has("di") and has("dii")) or has("lai") or (has("ti") and has("tii")) or (has("ch") and has("chi"))) then
		  cb_total = cb_total + 20 --2x balloons in llama temple Kong cage room
		end
	  end
	end
  end
  return cb_total >= cb_amount
end

function aztec_ti_cbs(logic)
  logic = logic or ""
  if not_has("ti") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 0 --All of Aztec requires some logic
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if has("vine") or has("tim") or (logic == "ool") then
    if has("tig") or ((logic == "ool") and ((has("di") and has("dig")) or (has("la") and has("lag")) or (has("ch") and has("chg")))) then
	  if has("dive") and has("tig") then
	    cb_total = cb_total + 20 --2x balloons in Kong cage room
	  end
	  if has("dive") and has("tib") then
	    cb_total = cb_total + 5 --Line of 5 entering enemy gauntlet room
	  end
	end
	if (has("di") and has("dii") and (has("dib") or has("vine"))) or has("open_levels") or has("bananaport_all") then
	  cb_total = cb_total + 50 --Line of 10 from pressure plate to totem area + bunch under Tiny barrel by gong tower + bunch on warp 5 + line of 5 leading to 5 door temple + 5x bunches on trees around 5 door temple
	  if has("tig") or (has("dk") and has("dkg")) or (has("la") and has("lag")) then
	    cb_total = cb_total + 3 --Line of 3 entering bottle in fairy room
		if has("tig") then
		  cb_total = cb_total + 10 --Balloon above lava/water pool
		end
		if has("tib") or has("bananaport_all") then
		  cb_total = cb_total + 2 --Line of 2 on the lava room side of the bottle
		  if has("tim") or (logic == "ool") or ((has("prog_switch_off") and has("ss")) or (has("prog_switch_on") and (aztec_slam() == 1))) then
		    cb_total = cb_total + 10 --2x bunches on side platforms in lava room
		  end
		end
	  end
	end
  end
  return cb_total >= cb_amount
end

function aztec_ch_cbs(logic)
  logic = logic or ""
  if not_has("ch") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 0 --All of Aztec requires some logic
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if has("vine") or (has("ti") and has("tim")) or (logic == "ool") then
    cb_total = cb_total + 5 --Line of 5 between sand pits in first tunnel
	if has("chg") then
	  cb_total = cb_total + 20 --4x bunches on thin walkways in vase room
	end
	if has("chg") or ((logic == "ool") and ((has("di") and has("dig")) or (has("la") and has("lag")) or (has("ti") and has("tig")))) then
	  cb_total = cb_total + 29 --5x bunches in back left corner around torch + line of 4 leading to rotating enemy gauntlet room
	  if has("chg") and has("dive") then
	    cb_total = cb_total + 10 --Balloon in vulture room
	  end
	end
	if (has("di") and has("dii") and (has("dib") or has("vine"))) or has("open_levels") or has("bananaport_all") then
	  cb_total = cb_total + 16 --10 on lowest stairs surrounding totem + 2x lines of 3 on tri-stairs near Snide's HQ
	  if has("chg") and (has("no_hi_reqs") or (has("di") and has("dig") and has("dib") and ((has("prog_switch_off") and has("ss")) or (has("prog_switch_on") and (aztec_slam() == 1))))) then
	    cb_total = cb_total + 20 --2x balloons in Chunky 5 door temple
	  end
	end
  end
  return cb_total >= cb_amount
end

function factory_dk_cbs(logic)
  logic = logic or ""
  if not_has("dk") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 20 --5 in tunnel from start to hatch + 6 in tunnel from bottom of hatch pole to Production room + 4 in tunnel between Production room and Storage + 5 in tunnel to counting game
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if has("dkp") then
    cb_total = cb_total + 20 --4x bunches in Barrel Blast course
  end
  if has("dkg") then
    cb_total = cb_total + 45 --Balloon near Cranky's Lab and Candy's Music Store + balloon around counting game + balloon above hole to power hut + 3x bunches in power hut
  end
  if has("no_hi_reqs") or (has("dkg") and has("dkm")) then
    if has("dkb") or (logic == "ool") then
	  cb_total = cb_total + 15 --3x bunches in crusher room
	end
  end
  return cb_total >= cb_amount
end

function factory_di_cbs(logic)
  logic = logic or ""
  if not_has("di") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 30 --Circle of 12 around Production room floor + 5 in tunnel to DK arcade + bunch on arcade warp 5 + 3 in tunnel to Funky's Armory + bunch on Funky's Armory warp 5
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if has("dip") or (logic == "ool") then
    cb_total = cb_total + 5 --Lowest bunch on block tower
  end
  if has("dip") then
    cb_total = cb_total + 20 --4x bunches on the rest of block tower
  end
  if has("dii") and has("dig") then
    cb_total = cb_total + 30 --3x balloons in enemy code room
  end
  if has("no_hi_reqs") or (has("dk") and has("dkg") and has("dkm")) then
    cb_total = cb_total + 15 --3x bunches on rotating cylinders and Simian Spring pad in upper Production room
  end
  return cb_total >= cb_amount
end

function factory_la_cbs(logic)
  logic = logic or ""
  if not_has("la") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 25 --Bunch on entrance warp 2 + 5 in tunnel to Cranky's Lab and Candy's Music Store + 10 around R&D + bunch on R&D warp 2
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if has("lam") or (logic == "ool") then
    cb_total = cb_total + 2 --lowest 2 bananas on pipe to vanilla Kong freeing switch
  end
  if has("lam") then
    cb_total = cb_total + 3 --upper 3 bananas on pipe to vanilla Kong freeing switch
  end
  if has("lai") and has ("lag") then
    cb_total = cb_total + 10 --Balloon in piano room
  end
  if has("bananaport_all") or has("no_hi_reqs") or (has("dk") and has("dkg") and has("dkm")) then
    cb_total = cb_total + 15 --3x bunches on stairs leading to rotating machine
  end
  if has("no_hi_reqs") or (has("dk") and has("dkg") and has("dkm")) then
    if has("lag") then
	  cb_total = cb_total + 20 --balloon in crusher room + balloon near vanilla Production room T&S portal
	end
	if has("lam") or (logic == "ool") then 
	  cb_total = cb_total + 15 --Lower 3x bunches on pipe in upper Production room
	end
	if has("lam") then
	  cb_total = cb_total + 10 --Upper 2x bunches on pipe in upper Production room
	end
  end
  return cb_total >= cb_amount
end

function factory_ti_cbs(logic)
  logic = logic or ""
  if not_has("ti") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 40 --2x bunches in window halfway down hatch pole + bunch before air vent in DK arcade room + 3 past door from entrance to Testing room + 7 in tunnel to Testing room + bunch in front of duct to shooting gallery + 10 in tunnel to car race
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if has("tib") then
    cb_total = cb_total + 5 --Bunch near duct in shooting gallery room
  end
  if has("tig") then
    cb_total = cb_total + 20 --Balloon near Snide's HQ + balloon near Funky's Armory
  end
  if has("bananaport_all") or has("no_hi_reqs") or (has("dk") and has("dkg") and has("dkm")) then
    if has("tig") then
	  cb_total = cb_total + 10 --Balloon at the base of the Production room machine
	end
  end
  if has("no_hi_reqs") or (has("dk") and has("dkg") and has("dkm")) then
    cb_total = cb_total + 20 --4x bunches on fast conveyors leading to top of Production room
	if has("tim") then
	  cb_total = cb_total + 5 --Bunch on ledge beyond Bonus Barrel
	end
  end
  return cb_total >= cb_amount
end

function factory_ch_cbs(logic)
  logic = logic or ""
  if not_has("ch") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 25 --Bunch on entrance warp 1 + 10 on pole under hatch + bunch on Storage room warp 1 + bunch on warp 3 near Snide's HQ
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if has("chm") then
    cb_total = cb_total + 15 --3x bunches above pistons in dark room
	if has("chi") then
	  cb_total = cb_total + 10 --2x lines of 5 in monster fight room
	  if has("chg") then
	    cb_total = cb_total + 10 --Balloon in monster fight room
	  end
	end
  end
  if has("chg") then
    cb_total = cb_total + 20 --Balloon above hatch + balloon above pole to Snide's HQ
  end
  if has("bananaport_all") or has("no_hi_reqs") or (has("dk") and has("dkg") and has("dkm")) then
	cb_total = cb_total + 20 --4x bunches around spinning Production room machine
  end
  return cb_total >= cb_amount
end

function galleon_dk_cbs(logic)
  logic = logic or ""
  if not_has("dk") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 0
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if has("dkg") then
    cb_total = cb_total + 10 --Balloon above Primate Punch chests
  end
  if has("dive") then
    cb_total = cb_total + 15 --3x bunches in hollow ship tunnel
	if has("dki") then
	  cb_total = cb_total + 10 --10 in 5 door ship
	end
  end
  if has("dkg") or has("open_levels") or has("bananaport_all") then
    if has("dive") and has("la") then
	  cb_total = cb_total + 10 --10 behind Enguarde wall
	end
	if has("dive") or has("bananaport_all") or ((logic == "ool") and has("ti") and has("tim") and has("no_hi_reqs")) then
	  if has("dkg") then
	    cb_total = cb_total + 10 --Balloon floating around lighthouse
	  end
	  if has("dkp") then
	    cb_total = cb_total + 15 --3x bunches in Barrel Blast course
      end
	  if (has("prog_switch_off") and has("ss")) or (has("prog_switch_on") and (galleon_slam() == 1)) then
	    cb_total = cb_total + 20 --4x bunches going up whomp's fortress
		if has("dkg") then
		  cb_total = cb_total + 10 --Balloon within lighthouse
		end
	  end
	end
  end
  return cb_total >= cb_amount
end

function galleon_di_cbs(logic)
  logic = logic or ""
  if not_has("di") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 10 --2x bunches in cannon path to Cranky's Lab
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if has("dig") then
    cb_total = cb_total + 10 --Balloon around instrument cactus
  end
  if has("dive") then
    cb_total = cb_total + 36 --4x bunches around mech fish cage + line of 6 into treasure room + 10 around 2 door ship
	if has("dii") then
	  cb_total = cb_total + 14 --Line of 4 from entrance to 5 door ship + 2x bunches in corners of 5 door ship
	end
  end
  if has("dig") and (has("bananaport_all") or (has("dive") and has("la") and ((logic == "ool") or (has("dk") and has("dkg")) or has("open_levels")))) then
    cb_total = cb_total + 10 --Balloon in treasure room
  end
  if (has("dk") and has("dkg")) or has("open_levels") or has("bananaport_all") then
    if has("dive") or has("bananaport_all") or ((logic == "ool") and has("ti") and has("tim") and has("no_hi_reqs")) then
	  if has("dig") then
	    cb_total = cb_total + 10 --Balloon above seal cage
	  end
	  if has("dib") then
	    cb_total = cb_total + 10 --2x bunches at the top of the lighthouse
	  end
	end
  end
  return cb_total >= cb_amount
end

function galleon_la_cbs(logic)
  logic = logic or ""
  if not_has("la") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 10 --Line of 5 from start to intersection + bunch on trombone pad on instrument cactus
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if has("lag") then
    cb_total = cb_total + 10 --Balloon above 5 door ship
	if has("ch") and has("chm") then
	  cb_total = cb_total + 20 --2x balloons above Battle Arena pad
	end
  end
  if has("dive") then
    cb_total = cb_total + 5 --Bunch under shipyard Enguarde box
	if (has("prog_switch_off") and has("ss")) or (has("prog_switch_on") and (galleon_slam() == 1)) then
	  cb_total = cb_total + 10 --Line of 5 to Enguarde box in 2 door ship + bunch at end of tunnel before Golden Banana
	end
	if has("lai") then
	  cb_total = cb_total + 15 --3x bunches in 5 door ship
	end
	if (has("dk") and has("dkg")) or has("open_levels") or has("bananaport_all") then
	  cb_total = cb_total + 25 --Ring of 5 under lighthouse Enguarde crate + 4x bunches in lighthouse Enguarde chests
	end
  end
  if (has("bananaport_all") and (((logic == "ool") and has("ti") and has("tim")) or has("dive"))) or (has("dive") and ((logic == "ool") or has("open_levels") or (has("dk") and has("dkg")))) then
    cb_total = cb_total + 1 --Banana on lowest balloon pad
	if has("lap") or ((logic == "ool") and (has("bananaport_all") and has("ti") and has("tim")) or (has("di") and has("dip") and has("ti") and has("tim"))) then
	  cb_total = cb_total + 4 --Upper 4 bananas on balloon pad gold pile
	end
  end 
  return cb_total >= cb_amount
end

function galleon_ti_cbs(logic)
  logic = logic or ""
  if not_has("ti") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 9 --Line of 5 from intersection to lighthouse gate + line of 4 from intersection to shipyard gate
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if has("vine") or (has("bananaport_all") and (has("dive") or (has("di") and has("dib")) or ((logic == "ool") and has("tim") and (has("no_hi_reqs") or (has("dk") and has("dkm") and ((has("prog_switch_off") and has("ss")) or (has("prog_switch_on") and (galleon_slam() == 1)))))))) then
    cb_total = cb_total + 8 --Bunch on warp 3 by Cranky's Lab + line of 3 from warp 3 to Kasplat alcove
  end
  if (has("bananaport_all") and has("vine")) or (has("bananaport_all") and (has("dive") or (has("di") and has("dib")) or ((logic == "ool") and has("tim") and (has("no_hi_reqs") or (has("dk") and has("dkm") and ((has("prog_switch_off") and has("ss")) or (has("prog_switch_on") and (galleon_slam() == 1)))))))) or ((has("open_levels") or (has("dk") and has("dkg"))) and (has("dive") or (has("no_hi_reqs") and has("tim") and (logic == "ool")))) then
    cb_total = cb_total + 5 --Bunch on warp 3 by Snide's HQ
	if has("tig") then
	  cb_total = cb_total + 10 --Balloon by Snide's HQ
	end
  end
  if has("ch") and has("chg") and ((logic == "ool") or (has("dive") and ((has("dk") and has("dkg")) or has("open_levels") or has("bananaport_all")))) then
    cb_total = cb_total + 15 --3x bunches on cannon room thin platforms
  end
  if (has("dk") and has("dkg")) or has("open_levels") or has("bananaport_all") then
    if has("tig") then
	  cb_total = cb_total + 10 --Balloon in low tide alcove
	end
  end
  if has("tii") and has("dive") then 
    cb_total = cb_total + 18 --8 singles in 5 door ship + 2x bunches in bushes in 5 door ship
  end
  if has("dive") and ((has("prog_switch_off") and has("ss")) or (has("prog_switch_on") and (galleon_slam() == 1))) then
    cb_total = cb_total + 10 --2x bunches in 2 door ship
  end
  if has("bananaport_all") or (has("la") and has("dive") and ((logic == "ool") or (has("dk") and has("dkg")) or has("open_levels"))) then
    if has("dive") then
	  cb_total = cb_total + 5 --Bunch in front of oyster chest
	end
	if has("tig") then
	  cb_total = cb_total + 10 --Balloon in treasure room
	end
  end
  return cb_total >= cb_amount
end

function galleon_ch_cbs(logic)
  logic = logic or ""
  if not_has("ch") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 12 --Line of 2 from intersection to warp 1 + line of 5 toward Primate Punch chests + bunch on warp 2
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if has("vine") or (has("bananaport_all") and (has("dive") or (has("di") and has("dib")) or ((logic == "ool") and (has("ti") and has("tim")) and (has("no_hi_reqs") or (has("dk") and has("dkm") and ((has("prog_switch_off") and has("ss")) or (has("prog_switch_on") and (galleon_slam() == 1)))))))) then
    cb_total = cb_total + 3 --Line of 3 from warp 3 to T&S portal
  end
  if has("chg") and ((logic == "ool") or (has("dive") and ((has("dk") and has("dkg")) or has("open_levels") or has("bananaport_all")))) then
    cb_total = cb_total + 10 --Balloon behind cannon in cannon game room
  end
  if (has("dk") and has("dkg")) or has("open_levels") or has("bananaport_all") then
    if has("dive") then
	  cb_total = cb_total + 10 --Circle of 10 around base of lighthouse platforms
	end
  end
  if has("ss") and ((has("bananaport_all") and (has("no_hi_reqs") or (has("dk") and has("dkm") and ((has("prog_switch_off") and has("ss")) or (has("prog_switch_on") and (galleon_slam() == 1)))))) or ((has("open_levels") or (has("dk") and has("dkg"))) and ((has("no_hi_reqs") and (logic == "ool") and has("ti") and has("tim")) or (has("dive") and (has("no_hi_reqs") or (has("dk") and has("dkm") and ((has("prog_switch_off") and has("ss")) or (has("prog_switch_on") and (galleon_slam() == 1))))))))) then
    cb_total = cb_total + 20 --4x bunches in seasick ship
	if has("chm") then
	  cb_total = cb_total + 5 --bunch behind punch wall in seasick ship
	end
  end
  if has("chg") then
    cb_total = cb_total + 20 --Balloon over 2 door ship + balloon around instrument cactus
  end
  if has("dive") then
    cb_total = cb_total + 15 --3x bunches in hollow ship tunnel
	if (has("dk") and has("dkg")) or has("open_levels") or has("bananaport_all") then
	  cb_total = cb_total + 5 --bunch above warp 2 at high tide
	end
  end
  return cb_total >= cb_amount
end

function forest_dk_cbs(logic)
  logic = logic or ""
  if not_has("dk") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 35 --Line of 5 in tunnel to mushroom + line of 5 in tunnel to mill + bunch on lower warp 5 near mushroom + 15 singles around middle level of mushroom + bunch in conveyor mill room ? box on slam switch
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if (logic == "ool") or (has("dkg") and has("di") and has("dig") and has("la") and has("lag") and has("ti") and has("tig") and has("ch") and has("chg")) then
    cb_total = cb_total + 15 --3x lower bunches in cannon chain path in giant mushroom
  end
  if (logic == "ool") or has("bananaport_all") or has("vine") or (has("di") and has("dib")) or (has("dkg") and has("di") and has("dig") and has("la") and has("lag") and has("ti") and has("tig") and has("ch") and has("chg")) then
    cb_total = cb_total + 5 --Bunch on upper warp 5 in mushroom area
  end
  if has("dkp") then
    cb_total = cb_total + 10 --2x bunches in Barrel Blast course
  end
  if has("dkg") then
    cb_total = cb_total + 10 --Balloon behind dark attic barn
	if (has("prog_switch_off") and has("sss")) or (has("prog_switch_on") and (forest_slam() == 1)) then
	  cb_total = cb_total + 10 --Balloon in lever room in conveyor mill
	end
  end
  if has("dkg") or (has("di") and has("dig")) or (has("la") and has("lag")) or (has("ti") and has("tig")) or (has("ch") and has("chg")) or ((logic == "ool") and has("orng")) then
    cb_total = cb_total + 5 --Line of 5 leading toward rosebush barn
	if has("dkb") or (logic == "ool") then
	  cb_total = cb_total + 5 --Bunch on slam switch surrounded by thorns
	  if (has("prog_switch_off") and has("sss")) or (has("prog_switch_on") and (forest_slam() == 1)) then
	    cb_total = cb_total + 5 --Bunch in ? box on slam switch in rosebush barn
	  end
	end
  end
  return cb_total >= cb_amount
end

function forest_di_cbs(logic)
  logic = logic or ""
  if not_has("di") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 35 --2x bunches on bounce mushroom to rocketbarrel in main area + bunch on main area warp 4 + 2x bunches on bounce mushroom to rocketbarrel near giant mushroom + circle of 7 around bottom of upper giant mushroom + 3 on crates to dark attic barn
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if (logic == "ool") or has("bananaport_all") or has("vine") or (has("di") and has("dib")) or (has("dk") and has("dkg") and has("dig") and has("la") and has("lag") and has("ti") and has("tig") and has("ch") and has("chg")) then
    cb_total = cb_total + 10 --circle of 10 around mushroom top
  end
  if has("open_levels") or has("bananaport_all") or (has("la") and has("lag")) then
    cb_total = cb_total + 15 --circle of 10 around owl tree + bunch on owl tree warp 4
	if has("dib") then
	  cb_total = cb_total + 5 --bunch on top of owl tree
	end
  end
  if has("dig") then
    cb_total = cb_total + 10 --Balloon near Snide's HQ
  end
  if has("dip") then
    cb_total = cb_total + 5 --Bunch outside entrance to dark attic barn
  end
   if has("dig") or (has("dk") and has("dkg")) or (has("la") and has("lag")) or (has("ti") and has("tig")) or (has("ch") and has("chg")) or ((logic == "ool") and has("orng")) then
     if has("dip") and ((logic == "ool") or has("dii")) then
	   cb_total = cb_total + 10 --2x bunches in rafters of dark attic barn
	 end
	 if has("dig") and ((has("prog_switch_off") and has("sss")) or (has("prog_switch_on") and (forest_slam() == 1))) then
	   cb_total = cb_total + 10 --Balloon in winch room
	 end
  end
  return cb_total >= cb_amount
end

function forest_la_cbs(logic)
  logic = logic or ""
  if not_has("la") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 32 --Bunch on main area warp 1 + circle of 10 around bottom of giant mushroom + bunch on mushroom warp 3 + line of 4 along mill roof + line of 3 going up winch + bunch above Baboon Balloon pad
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if has("lag") then
    cb_total = cb_total + 10 --Balloon at bottom of giant mushroom interior
  end
  if (logic == "ool") or has("bananaport_all") or has("vine") or (has("di") and has("dib")) or (has("dk") and has("dkg") and has("dig") and has("la") and has("lag") and has("ti") and has("tig") and has("ch") and has("chg")) then
    if has("lag") then
      cb_total = cb_total + 10 --Balloon at top of giant mushroom interior
	end
	if has("lam") or ((logic == "ool") and has("di") and has("dib")) then
	  cb_total = cb_total + 5 --Bunch on slam switch at the top of the giant mushroom exterior
	  if ((has("prog_switch_off") and has("sss")) or (has("prog_switch_on") and (forest_slam() == 1))) then
	    cb_total = cb_total + 15 --2x bunches in zinger room + bunch in colored mushroom room
	  end
	end
  end
  if has("open_levels") or has("bananaport_all") or has("lag") then
    cb_total = cb_total + 18 --Line of 10 in the tunnel to the owl tree + line of 3 leading to the rabbit + bunch on trombone pad near rabbit
  end
  if has("lag") or (has("dk") and has("dkg")) or (has("di") and has("dig")) or (has("ti") and has("tig")) or (has("ch") and has("chg")) or ((logic == "ool") and has("orng")) then
    cb_total = cb_total + 10 --Bunch entering mill attic + bunch on slam switch in mill attic
  end
  return cb_total >= cb_amount
end

function forest_ti_cbs(logic)
  logic = logic or ""
  if not_has("ti") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 10 --Bunch on main area warp 3 + bunch on slam switch at bottom of giant mushroom
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if has("tig") or has("open_levels") then
    cb_total = cb_total + 4 --Line of 4 between feather gate and pineapple gate toward beanstalk area
  end
  if has("open_levels") or has("bananaport_all") or (has("tig") and has("ch") and has("chg")) then
    cb_total = cb_total + 16 --Single banana behind pineapple gate + 3x bunches on mushrooms in beanstalk area
  end
  if has("tig") then
    cb_total = cb_total + 10 --Balloon above Kasplat on lower mushroom walkways
  end
  if has("open_levels") or has("bananaport_all") or (has("la") and has("lag")) then
    cb_total = cb_total + 8 --Circle of 8 around anthill
	if (has("tib") and has("tii")) or ((logic == "ool") and has("di") and has("dib")) then
	  cb_total = cb_total + 5 --Bunch on top of anthill
	end
  end
  if has("dive") then
    cb_total = cb_total + 17 --Circle of 17 in moat around mill
  end
  if has("ch") and has("chm") then
    cb_total = cb_total + 15 --2x bunches in mill back room + bunch in ? box in mill back room
  end
  if has("tig") or (has("dk") and has("dkg")) or (has("di") and has("dig")) or (has("la") and has("lag")) or (has("ch") and has("chg")) or ((logic == "ool") and has("orng")) then
    if has("tig") then
	  cb_total = cb_total + 10 --Balloon behind rosebush barn
	end
	if has("ch") and has("chm") and has("tib") then
	  cb_total = cb_total + 5 --Bunch in spider boss room
	end
  end
  return cb_total >= cb_amount
end

function forest_ch_cbs(logic)
  logic = logic or ""
  if not_has("ch") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 40 --Bunch on main area warp 2 + bunch on well entrance + 16 climbing the lower mushroom (2x bunches + 2 sets of 3 going up ladders) + 14 climbing the upper mushroom until the vine (3x sets of 3 going up ladders + 1 bunch)
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if (logic == "ool") or has("bananaport_all") or has("vine") or (has("di") and has("dib")) or (has("dk") and has("dkg") and has("dig") and has("la") and has("lag") and has("ti") and has("tig") and has("ch") and has("chg")) then
    cb_total = cb_total + 11 --11 climbing the upper mushroom from past the vine until the top (2x sets of 3 going up ladders + bunch at the top)
	if has("vine") or has("chg") or (has("dk") and has("dkg")) or (has("di") and has("dig")) or (has("la") and has("lag")) or (has("ti") and has("tig")) or ((logic == "ool") and has("orng")) then
	  cb_total = cb_total + 5 --Bunch by night only door
	end
	if has("chg") then
	  cb_total = cb_total + 10 --Balloon outside night only door above Kasplat
	end
	if ((has("prog_switch_off") and has("sss")) or (has("prog_switch_on") and (forest_slam() == 1))) then
	  cb_total = cb_total + 5 --Bunch on slam switch in Chunky face puzzle room
	  if has("chg") then
	    cb_total = cb_total + 10 --Balloon in Chunky face puzzle room
	  end
	end
  end
  if has("open_levels") or has("bananaport_all") or (has("chg") and has("ti") and has("tig")) then
	cb_total = cb_total + 14 --Circle of 9 around worm apple + bunch on warp 2 in front of Funky's Armory
  end
  if has("chm") then
    cb_total = cb_total + 5 --Bunch in ? box with triangle pad in mill back room
  end
  return cb_total >= cb_amount
end

function caves_dk_cbs(logic)
  logic = logic or ""
  if not_has("dk") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 25 --Bunch on starting warp 1 + circle of 5 around Barrel Blast pad + bunch on igloo warp 1 + 5 in circle around igloo + bunch on bongos pad to Donkey 5 door cabin
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if has("ch") and has("chm") then
    cb_total = cb_total + 3 --Line of 3 entering big boulder cave
	if has("dkg") then
	  cb_total = cb_total + 20 --Balloon in Gorilla Gone cave + balloon in big boulder cave
	end
  end
  if has("dkp") then
    cb_total = cb_total + 20 --4x bunches in Barrel Blast course
  end
  if has("dki") and (has("no_hi_reqs") or (has("di") and has("dib"))) then
    cb_total = cb_total + 5 --Bunch above door in Donkey 5 door igloo
	if has("dkb") or (logic == "ool") then
	  cb_total = cb_total + 7 --7 in rotating ice thorn maze
	end
	if has("dkg") then
	  cb_total = cb_total + 10 --Balloon above rotating ice thorn maze
	end
  end
  if has("dki") then
    cb_total = cb_total + 10 --Bunch in rotating cabin + bunch in Donkey 5 door cabin
  end
  return cb_total >= cb_amount
end

function caves_di_cbs(logic)
  logic = logic or ""
  if not_has("di") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 5 --Line of 5 between Rocketbarrel barrel and Funky's Armory
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if (logic == "ool") or has("dib") then
    cb_total = cb_total + 10 --Bunch on pillar warp 4 + bunch under waterfall Bonus Barrel
  end
  if has("dib") then
    cb_total = cb_total + 20 --4x bunches above igloo area
  end
  if has("dig") then
    cb_total = cb_total + 20 --Balloon around warp 4 pillar + balloon above 5 door cabin
  end
  if (has("bananaport_all") and (has("dib") or ((logic == "ool")))) or ((has("ti") and has("tib") and has("tim")) and ((logic == "ool") or has("dib"))) then
    cb_total = cb_total + 10 --Bunch on cave warp 4 + 5 singles around back of Kasplat cave
  end
  if has("dii") and has("dig") and (has("no_hi_reqs") or has("dib")) then
    cb_total = cb_total + 10 --Balloon in Diddy 5 door igloo
  end
  if has("dii") then
    cb_total = cb_total + 5 --Circle of 5 in Diddy enemy cabin
	if has("dib") or (logic == "ool") then
	  cb_total = cb_total + 5 --Bunch on raised central platform in Diddy enemy cabin
	end
	if has("dip") and has("dib") then
	  cb_total = cb_total + 15 --3x bunches over candles in Diddy candle cabin
	end
  end
  return cb_total >= cb_amount
end

function caves_la_cbs(logic)
  logic = logic or ""
  if not_has("la") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 15  --Line of 5 from level entrance to warp hub + line of 10 in water between waterfalls
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if has("lap") then
    cb_total = cb_total + 15 --3x bunches floating near Cranky's Lab
  end
  if has("lag") then
    cb_total = cb_total + 10 --Balloon by backmost waterfall
  end
  if ((has("prog_switch_off") and has("sss")) or (has("prog_switch_on") and (caves_slam() == 1))) then
    if (logic == "ool") or has("lap") then
	  cb_total = cb_total + 5 --Bunch in ice castle top hatch to beetle race
	end
	if has("lag") then
	  cb_total = cb_total + 10 --Balloon in ice castle minigame room
	end
  end
  if has("bananaport_all") or (has("di") and has("dib")) or ((logic == "ool") and has("lap")) then
    cb_total = cb_total + 20 --4x bunches on Kasplat pillar
  end
  if has("lai") and (has("no_hi_reqs") or (has("di") and has("dib"))) then
    cb_total = cb_total + 1 --Banana on lowest Baboon Balloon pad in Lanky 5 door igloo
	if has("lap") or (logic == "ool") then
	  cb_total = cb_total + 4 --4 singles on ice structure above first Baboon Balloon pad in Lanky 5 door igloo
	end
	if has("lag") then
	  cb_total = cb_total + 10 --Balloon around top of ice structure in Lanky 5 door igloo
	end
  end
  if has("lap") or ((logic == "ool") and has("di") and has("dib")) then
    cb_total = cb_total + 5 --Bunch on trombone pad on Lanky cabin
	if has("lai") then
      cb_total = cb_total + 5 --Bunch on pressure switch in Lanky cabin
	end
  end
  return cb_total >= cb_amount
end

function caves_ti_cbs(logic)
  logic = logic or ""
  if not_has("ti") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 15 --Line of 10 in river from warp hub to igloo + bunch on igloo warp 3
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if has("tib") or has("bananaport_all") then
    cb_total = cb_total + 5 --Bunch on Bonus Barrel warp 3
  end
  if has("tig") then
    cb_total = cb_total + 10 --Balloon around Kasplat near warp 2
  end
  if has("tii") then
    cb_total = cb_total + 10 --2x bunches in Tiny 5 door cabin
    if has("tig") then
	  cb_total = cb_total + 10 --Balloon in Tiny 5 door cabin
	end
  end
  if (has("bananaport_all") and (has("tim") or (logic == "ool"))) or (has("tib") and has("tim")) then
    if has("tig") then
	  cb_total = cb_total + 10 --Balloon in Kasplat cave
	end
	if has("tip") then
	  cb_total = cb_total + 5 --Bunch in Tiny's ice shield
	end
  end
  if has("ch") and has("brrl") and has("chm") and has("chb") and has("tip") then
    cb_total = cb_total + 20 --4x bunches in giant Kosha arena
  end
  if has("tii") and (has("no_hi_reqs") or (has("di") and has("dib"))) then
    cb_total = cb_total + 5 --Bunch on slam target in Tiny 5 door igloo
	if has("tig") then
	  cb_total = cb_total + 10 --Balloon in Tiny 5 door igloo
	end
  end
  return cb_total >= cb_amount
end

function caves_ch_cbs(logic)
  logic = logic or ""
  if not_has("ch") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 18 --Bunch on entrance warp 2 + bunch on small boulder switch + line of 3 between boulder and small boulder switch + bunch on cabins warp 2
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if has("brrl") then
    cb_total = cb_total + 5 --Bunch under small boulder
  end
  if has("chm") then
    cb_total = cb_total + 11 --Bunch on Gorilla Gone pad in Gorilla Gone cave + line of 3 into Gorilla Gone cave + line of 3 into Snide's HQ room
	if has("chg") then
	  cb_total = cb_total + 10 --Balloon in Snide's HQ room
	end
	if has("brrl") then
	  cb_total = cb_total + 6 --Circle of 6 around big boulder within ice shield in big boulder room
	  if has("chb") then
	    cb_total = cb_total + 10 --Bunch under big boulder + circle of 5 around Chunky ice shield
	  end
	end
  end
  if has("chg") and (has("bananaport_all") or (has("ti") and has("tib"))) then
    cb_total = cb_total + 10 --Balloon in Bonus Barrel cave
  end
  if has("chg") and has("chi") and (has("no_hi_reqs") or (has("di") and has("dib"))) then
    cb_total = cb_total + 10 --Balloon in Chunky 5 door igloo
  end
  if has("chi") and has("ss") and has("chp") then
    cb_total = cb_total + 20 --4x bunches in searchlight in Chunky 5 door cabin
  end
  return cb_total >= cb_amount
end

function castle_dk_cbs(logic)
  logic = logic or ""
  if not_has("dk") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 50 --Line of 5 on bridge near entrance + line of 45 from after tree until warp 2
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if has("dkp") and has("dkg") then
    cb_total = cb_total + 15 --Balloon past coconut switch in tree + bunch above driftwood in water raising room
  end
  if (has("prog_switch_off") and has("sdss")) or (has("prog_switch_on") and (castle_slam() == 1)) then
    cb_total = cb_total + 10 --Bunch on stack of books in library + bunch on face puzzle in dungeon
	if has("dkb") or (logic == "ool") then
	  cb_total = cb_total + 10 --2x bunches in flying book hallway
	end
  end
  if has("dkg") or ((logic == "ool") and ((has("di") and has("dig")) or (has("ch") and has("chg")))) then
    cb_total = cb_total + 5 --Bunch on crypt warp 2
	if has("dkg") then
	  cb_total = cb_total + 10 --Balloon in minecart lever room
	end
  end
  return cb_total >= cb_amount
end

function castle_di_cbs(logic)
  logic = logic or ""
  if not_has("di") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 0
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if has("dib") or (logic == "ool") then
    cb_total = cb_total + 5 --Bunch on pole near Cranky's Lab
  end
  if has("dib") then
    cb_total = cb_total + 5 --Bunch on cloud at top of castle
  end
  if has("dig") then
    cb_total = cb_total + 20 --Balloon above warp 1 tunnel entrance + balloon above crypt entrance
  end  
  if has("ch") and has("chm") then
    cb_total = cb_total + 20 --4x bunches in dungeon behind punch gates
  end
  if (has("prog_switch_off") and has("sdss")) or (has("prog_switch_on") and (castle_slam() == 1)) then
    if has("dib") then
	  cb_total = cb_total + 15 --3x bunches on candles in ballroom
	end
	if has("dig") then
	  cb_total = cb_total + 20 --Balloon in ballroom + balloon in sniper vine room in dungeon
	end
  end
  if has("dig") or ((logic == "ool") and ((has("dk") and has("dkg")) or (has("ch") and has("chg")))) then
    cb_total = cb_total + 5 --Bunch on crypt warp 1
	if has("dig") and has("dim") then
	  cb_total = cb_total + 10 --Balloon in wrong casket in crypt counting room
	end
  end
  return cb_total >= cb_amount
end

function castle_la_cbs(logic)
  logic = logic or ""
  if not_has("la") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 30 --5x bunches and 5x singles in catacombs path to Funky's Armory
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if (has("prog_switch_off") and has("sdss")) or (has("prog_switch_on") and (castle_slam() == 1)) then
    cb_total = cb_total + 30 --6x bunches in greenhouse hedge maze
	if has("lag") then
	  cb_total = cb_total + 20 --Balloon in windy tower + close balloon in acid room in dungeon
	  if (has("lai") and has("lap")) or ((logic == "ool") and ((has("no_ha_sns") or has("ha_sns")))) then 
	    cb_total = cb_total + 10 --Far balloon in acid room in dungeon
	  end
	end
  end
  if has("lag") and has("lab") then
    cb_total = cb_total + 10 --Balloon at end of mausoleum sprint
  end
  return cb_total >= cb_amount
end

function castle_ti_cbs(logic)
  logic = logic or ""
  if not_has("ti") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 50 --Line of 45 from warp 2 to warp 5 + bunch on warp 5
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if has("tib") then
    cb_total = cb_total + 5 --Bunch on cheese wedge in trash can_enter_helm
  end
  if has("tig") then
    cb_total = cb_total + 10 --Balloon above Funky's Armory
  end
  if has("tig") or ((logic == "ool") and has("la") and has("lag")) then
    cb_total = cb_total + 5 --Bunch over acid pit in mausoleum
  end
  if has("di") and ((has("prog_switch_off") and has("sdss")) or (has("prog_switch_on") and (castle_slam() == 1))) then
    cb_total = cb_total + 5 --Bunch on monkeyport pad in ballroom
	if has("tip") then
	  cb_total = cb_total + 15 --3x bunches on monkeyport pads in museum rooms
	  if has("tig") then
	    cb_total = cb_total + 10 --Balloon in empty display room
	  end
	end
  end
  return cb_total >= cb_amount
end

function castle_ch_cbs(logic)
  logic = logic or ""
  if not_has("ch") then
    return 0
  end
  if has("cb_rando") then
	return 1
  end
  local cb_total = 30 --Line of 30 through the underground tunnel
  local cb_amount = get_object("medal_amount") and get_object("medal_amount").AcquiredCount or 0
  if has("dk") and has("dkp") then
    cb_total = cb_total + 5 --Bunch before cracked wood wall
	if has("chm") and has("chg") then
	  cb_total = cb_total + 10 --Balloon in tree sniper hallway
	end
  end
  if has("chm") and has("chg") then
    cb_total = cb_total + 40 --Balloon in shed + 2x balloons behind gates in dungeon + 2x bunches in caskets in crypt
  end
  if (has("prog_switch_off") and has("sdss")) or (has("prog_switch_on") and (castle_slam() == 1)) then
    if has("chm") and has("brrl") then
	  cb_total = cb_total + 5 --Bunch in boulder in skull's mouth in museum
	end
	if has("chg") then
	  cb_total = cb_total + 10 --Balloon around pressure plate in museum
	end
  end
  return cb_total >= cb_amount
end

function can_play_jetpac()
  local setting_jetpac_amount =
    get_object("jetpac_amount") and get_object("jetpac_amount").AcquiredCount or 0
  local medals = Tracker:ProviderCountForCode("bm")
  if medals >= setting_jetpac_amount then
    return 1
  end
  return 0
end

function can_open_rw_gb_door()
  local setting_rw_gb_amount =
    get_object("rw_gb_amount") and get_object("rw_gb_amount").AcquiredCount or 0
  local fairies = Tracker:ProviderCountForCode("fair")
  if fairies >= setting_rw_gb_amount then
    return 1
  end
  return 0
end

function can_enter_helm()
  local setting_helm_amount =
    get_object("helm_entry_amount") and get_object("helm_entry_amount").AcquiredCount or 0
  local gbs = Tracker:ProviderCountForCode("gb")
  if gbs >= setting_helm_amount then
    return 1
  end
  return 0
end

function update_generic_keys()
  local gen_keys = get_object("keys")
  local k1 = Tracker:ProviderCountForCode("k1")
  local k2 = Tracker:ProviderCountForCode("k2")
  local k3 = Tracker:ProviderCountForCode("k3")
  local k4 = Tracker:ProviderCountForCode("k4")
  local k5 = Tracker:ProviderCountForCode("k5")
  local k6 = Tracker:ProviderCountForCode("k6")
  local k7 = Tracker:ProviderCountForCode("k7")
  local k8 = Tracker:ProviderCountForCode("k8")
  if ((k1 + k2 + k3 + k4 + k5 + k6 + k7 + k8) > gen_keys.AcquiredCount) then
    gen_keys.AcquiredCount = (k1 + k2 + k3 + k4 + k5 + k6 + k7 + k8)
  end
end

local max_amount_per_helm_door_1_type = {10, 20, 1, 5, 201, 40, 2, 8, 40}
function update_helm_door_1_amount_max()
  local setting_helm_1_type = get_object("helm_1_type")
  local setting_helm_1_amount = get_object("helm_1_amount")
  if setting_helm_1_type and setting_helm_1_type.CurrentStage and setting_helm_1_amount then
    setting_helm_1_amount.MaxCount = max_amount_per_helm_door_1_type[setting_helm_1_type.CurrentStage + 1] or 0
  end
end

function can_open_helm_door_1()
  local setting_helm_1_amount =
    get_object("helm_1_amount") and get_object("helm_1_amount").AcquiredCount or 0
  local gbs = Tracker:ProviderCountForCode("gb")
  local medals = Tracker:ProviderCountForCode("bm")
  local fairies = Tracker:ProviderCountForCode("fair")
  local crowns = Tracker:ProviderCountForCode("cr")
  local beans = Tracker:ProviderCountForCode("bean")
  local pearls = Tracker:ProviderCountForCode("pearl")
  local dkbp = Tracker:ProviderCountForCode("dkbp")
  local dibp = Tracker:ProviderCountForCode("dibp")
  local labp = Tracker:ProviderCountForCode("labp")
  local tibp = Tracker:ProviderCountForCode("tibp")
  local chbp = Tracker:ProviderCountForCode("chbp")
  local k1 = Tracker:ProviderCountForCode("k1")
  local k2 = Tracker:ProviderCountForCode("k2")
  local k3 = Tracker:ProviderCountForCode("k3")
  local k4 = Tracker:ProviderCountForCode("k4")
  local k5 = Tracker:ProviderCountForCode("k5")
  local k6 = Tracker:ProviderCountForCode("k6")
  local k7 = Tracker:ProviderCountForCode("k7")
  local k8 = Tracker:ProviderCountForCode("k8")

  if has("helm_1_cr") then
    if crowns >= setting_helm_1_amount then
      return 1
    end
  elseif has("helm_1_fair") then
    if fairies >= setting_helm_1_amount then
      return 1
    end
  elseif has("helm_1_bean") then
    if beans >= setting_helm_1_amount then
      return 1
    end
  elseif has("helm_1_pearl") then
    if pearls >= setting_helm_1_amount then
      return 1
    end
  elseif has("helm_1_gb") then
    if gbs >= setting_helm_1_amount then
      return 1
    end
  elseif has("helm_1_bp") then
    if (dkbp + dibp + labp + tibp + chbp) >= setting_helm_1_amount then
      return 1
    end
  elseif has("helm_1_coin") then
    if (setting_helm_1_amount == 1) then
	  if has("n64coin") or has("rwcoin") or has("bothcoins") then
        return 1
	  end
	elseif (setting_helm_1_amount == 2) then
	  if has("bothcoins") then
	    return 1
	  end
	elseif (setting_helm_1_amount == 0) then
	  return 1
    end
  elseif has("helm_1_key") then
    if (k1 + k2 + k3 + k4 + k5 + k6 + k7 + k8) >= setting_helm_1_amount then
      return 1
    end
  elseif has("helm_1_bm") then
    if medals >= setting_helm_1_amount then
      return 1
    end
  end
  return 0
end

local max_amount_per_helm_door_2_type = {2, 8, 40, 10, 20, 1, 5, 201, 40}
function update_helm_door_2_amount_max()
  local setting_helm_2_type = get_object("helm_2_type")
  local setting_helm_2_amount = get_object("helm_2_amount")
  if setting_helm_2_type and setting_helm_2_type.CurrentStage and setting_helm_2_amount then
    setting_helm_2_amount.MaxCount = max_amount_per_helm_door_2_type[setting_helm_2_type.CurrentStage + 1] or 0
  end
end

function can_open_helm_door_2()
  local setting_helm_2_amount =
    get_object("helm_2_amount") and get_object("helm_2_amount").AcquiredCount or 0
  local gbs = Tracker:ProviderCountForCode("gb")
  local medals = Tracker:ProviderCountForCode("bm")
  local fairies = Tracker:ProviderCountForCode("fair")
  local crowns = Tracker:ProviderCountForCode("cr")
  local beans = Tracker:ProviderCountForCode("bean")
  local pearls = Tracker:ProviderCountForCode("pearl")
  local dkbp = Tracker:ProviderCountForCode("dkbp")
  local dibp = Tracker:ProviderCountForCode("dibp")
  local labp = Tracker:ProviderCountForCode("labp")
  local tibp = Tracker:ProviderCountForCode("tibp")
  local chbp = Tracker:ProviderCountForCode("chbp")
  local k1 = Tracker:ProviderCountForCode("k1")
  local k2 = Tracker:ProviderCountForCode("k2")
  local k3 = Tracker:ProviderCountForCode("k3")
  local k4 = Tracker:ProviderCountForCode("k4")
  local k5 = Tracker:ProviderCountForCode("k5")
  local k6 = Tracker:ProviderCountForCode("k6")
  local k7 = Tracker:ProviderCountForCode("k7")
  local k8 = Tracker:ProviderCountForCode("k8")

  if has("helm_2_cr") then
    if crowns >= setting_helm_2_amount then
      return 1
    end
  elseif has("helm_2_fair") then
    if fairies >= setting_helm_2_amount then
      return 1
    end
  elseif has("helm_2_bean") then
    if beans >= setting_helm_2_amount then
      return 1
    end
  elseif has("helm_2_pearl") then
    if pearls >= setting_helm_2_amount then
      return 1
    end
  elseif has("helm_2_gb") then
    if gbs >= setting_helm_2_amount then
      return 1
    end
  elseif has("helm_2_bp") then
    if (dkbp + dibp + labp + tibp + chbp) >= setting_helm_2_amount then
      return 1
    end
  elseif has("helm_2_coin") then
    if (setting_helm_2_amount == 1) then
	  if has("n64coin") or has("rwcoin") or has("bothcoins") then
        return 1
	  end
	elseif (setting_helm_2_amount == 2) then
	  if has("bothcoins") then
	    return 1
	  end
	elseif (setting_helm_2_amount == 0) then
	  return 1
    end
  elseif has("helm_2_key") then
    if (k1 + k2 + k3 + k4 + k5 + k6 + k7 + k8) >= setting_helm_2_amount then
      return 1
    end
  elseif has("helm_2_bm") then
    if medals >= setting_helm_2_amount then
      return 1
    end
  end
  return 0
end

function call_updaters()
  update_generic_keys()
  update_helm_door_1_amount_max()
  update_helm_door_2_amount_max()
  return 1
end