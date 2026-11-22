
--Turin

-- Load and initialize the include file.
include('Mirdain-Include')
include('Lazural-Items')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "12"
MacroBook = "4"
MacroSet = "2"

-- Use "gs c food" to use the specified food item 
Food = "Grape Daifuku +1"

--Uses Items Automatically
AutoItem = false

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

-- 'TP','ACC','DT' are standard Default modes.  You may add more and assigne equipsets for them ( Idle.X and OffenseMode.X )
state.OffenseMode:options('TP','ACC','DT','PDL','SB','MEVA','CRIT') -- ACC effects WS and TP modes

--Set Mode to Damage Taken as Default
state.OffenseMode:set('TP')

--Modes for weapons.  You must define the set in sets.Weapons['X']
state.WeaponMode:options('Karambit','Godhands','Staff','ProcStaff','ProcClub','Barehanded','ProcSword','ProcGreatSword','ProcScythe','ProcPolearm','ProcGreatKatana')
state.WeaponMode:set('Karambit')

-- Initialize Player
jobsetup (LockStylePallet,MacroBook,MacroSet)

function get_sets()
	gear.jsecape_TP = { name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.jsecape_WS = { name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.jsecape_CRIT = { name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Crit.hit rate+10',}}


	-- Weapon sets
		sets.Weapons = {}
	sets.Weapons['Godhands'] = {main="Sakpata's Fists"}
	sets.Weapons['Karambit'] = {main="Karambit"}
	sets.Weapons['Barehanded'] = {main=empty}
	sets.Weapons['Staff'] = {main="Malignance Pole",sub="Bloodrain Strap"}
	sets.Weapons['ProcStaff'] = {main="Cobra Staff"}
	sets.Weapons['ProcClub'] = {main="Kitty Rod"}
	sets.Weapons['ProcSword'] = {main="Ark Sword",sub=empty}
	sets.Weapons['ProcGreatSword'] = {main="Lament",sub=empty}
	sets.Weapons['ProcScythe'] = {main="Ark Scythe",sub=empty}
	sets.Weapons['ProcPolearm'] = {main="Pitchfork +1",sub=empty}
	sets.Weapons['ProcGreatKatana'] = {main="Hardwood Katana",sub=empty}

	sets.Weapons.Shield = {}

	-- Idle sets
	sets.Idle = {ammo="Staunch Tathlum",
		head="Nyame Helm",neck="Loricate Torque +1",left_ear = "Etiolation Earring",right_ear = "Alabaster Earring",
		body="Hiza. Haramaki +2",hands="Nyame Gauntlets",left_ring = "Shneddick Ring",right_ring = "Murky Ring",
		back="Moonbeam Cape",waist="Moonbow Belt +1",legs="Nyame Flanchard",feet="Hippo. Socks +1"}
	sets.Idle.Resting = {body="Hesychast's Cyclas",right_ring = "Sheltered Ring"}
	sets.Idle.TP = {ammo="Staunch Tathlum",
		head="Nyame Helm",neck="Loricate Torque +1",left_ear = "Etiolation Earring",right_ear = "Alabaster Earring",
		body="Hiza. Haramaki +2",hands="Nyame Gauntlets",left_ring = "Shneddick Ring",right_ring = "Murky Ring",
		back="Moonbeam Cape",waist="Moonbow Belt +1",legs="Nyame Flanchard",feet="Hippo. Socks +1"}
	sets.Idle.ACC = {ammo="Staunch Tathlum",
		head="Nyame Helm",neck="Loricate Torque +1",left_ear = "Etiolation Earring",right_ear = "Alabaster Earring",
		body="Hiza. Haramaki +2",hands="Nyame Gauntlets",left_ring = "Shneddick Ring",right_ring = "Murky Ring",
		back="Moonbeam Cape",waist="Moonbow Belt +1",legs="Nyame Flanchard",feet="Hippo. Socks +1"}
	sets.Idle.DT = {ammo="Eluder's Sachet",
		head="Nyame Helm",neck="Loricate Torque +1",left_ear = "Etiolation Earring",right_ear = "Sanare Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",left_ring = "Defending Ring",right_ring = "Warden's Ring",
		back="Moonbeam Cape",waist="Moonbow Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	sets.Idle.PDL = set_combine(sets.Idle, {})
	sets.Idle.SB = set_combine(sets.Idle, {})
	sets.Idle.CRIT = set_combine(sets.Idle, {})
	sets.Idle.MEVA = {ammo="Staunch Tathlum ",
		head="Nyame Helm",neck="Warder's Charm +1",left_ear = "Etiolation Earring",right_ear = "Sanare Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",left_ring = "Archon Ring",right_ring = "Shadow Ring",
		back="Moonbeam Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	-- Engaged Sets
	sets.OffenseMode = {ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",neck="Mnk. Nodowa +1",left_ear = "Sherida Earring",right_ear = "Schere Earring",
		body="Ken. Samue +1",hands="Adhemar Wrist. +1",left_ring = "Petrov Ring",right_ring = "Niqmaddu Ring",
		back=gear.jsecape_TP,waist="Moonbow Belt +1",legs="Bhikku Hose +2",feet="Anch. Gaiters +3"}
	sets.OffenseMode.TP = {ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",neck="Mnk. Nodowa +1",left_ear = "Sherida Earring",right_ear = "Schere Earring",
		body="Ken. Samue +1",hands="Adhemar Wrist. +1",left_ring = "Petrov Ring",right_ring = "Niqmaddu Ring",
		back=gear.jsecape_TP,waist="Moonbow Belt +1",legs="Bhikku Hose +2",feet="Anch. Gaiters +3"}

	sets.OffenseMode.ACC = {ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Mnk. Nodowa +1",left_ear = "Sherida Earring",right_ear = "Bhikku Earring +1",
		body="Ken. Samue +1",hands="Adhemar Wrist. +1",left_ring = "Chirich Ring +1",right_ring = "Niqmaddu Ring",
		back=gear.jsecape_TP,waist="Moonbow Belt +1",legs="Bhikku Hose +2",feet="Anch. Gaiters +3"}

	sets.OffenseMode.DT = {ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Mnk. Nodowa +1",left_ear = "Sherida Earring",right_ear = "Schere Earring",
		body="Mpaca's Doublet",hands="Adhemar Wrist. +1",left_ring = "Murky Ring",right_ring = "Niqmaddu Ring",
		back=gear.jsecape_TP,waist="Moonbow Belt +1",legs="Bhikku Hose +2",feet="Mpaca's Boots"}

	sets.OffenseMode.PDL = {ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",neck="Mnk. Nodowa +1",left_ear = "Sherida Earring",right_ear = "Schere Earring",
		body="Ken. Samue +1",hands="Adhemar Wrist. +1",left_ring = "Petrov Ring",right_ring = "Niqmaddu Ring",
		back=gear.jsecape_TP,waist="Moonbow Belt +1",legs="Bhikku Hose +2",feet="Anch. Gaiters +3"}

	--This set is used when OffenseMode is SB and Enaged (Augments the TP base set)
	-- MNK gets 35 Native Subtle Blow
	-- Cap is 75% - 50% caps either I or II
	sets.OffenseMode.SB = {ammo="Coiste Bodhar",
		head="Bhikku Crown +2",neck="Mnk. Nodowa +1",left_ear = "Sherida Earring",right_ear = "Bhikku Earring +1",
		body="Ken. Samue +1",hands="Adhemar Wrist. +1",left_ring = "Petrov Ring",right_ring = "Niqmaddu Ring",
		back=gear.jsecape_TP,waist="Moonbow Belt +1",legs="Bhikku Hose +2",feet="Anch. Gaiters +3"} -- 35 + 16% SB I + %25 SB II = 76 one under

	sets.OffenseMode.MEVA = {ammo="Aurgelmir Orb",
		head="Malignance Chapeau",neck="Mnk. Nodowa +1",left_ear = "Sherida Earring",right_ear = "Schere Earring",
		body="Mpaca's Doublet",hands="Adhemar Wrist. +1",left_ring = "Murky Ring",right_ring = "Niqmaddu Ring",
		back=gear.jsecape_TP,waist="Moonbow Belt +1",legs="Bhikku Hose +2",feet="Mpaca's Boots"}

	sets.OffenseMode.CRIT = set_combine(sets.OffenseMode,{
		head={ name="Mpaca's Cap", augments={'Path: A',}},
		body={ name="Mpaca's Doublet", augments={'Path: A',}},
		hands={ name="Mpaca's Gloves", augments={'Path: A',}},
		legs={ name="Mpaca's Hose", augments={'Path: A',}},
		feet="Ken. Sune-Ate +1",
		left_ring="Niqmaddu Ring",
		right_ring="Lehko's Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Magic dmg. taken-10%',}},
	})

	-- Augments the OffenseMode when in DT stance
	sets.Foot_Work = {feet="Anch. Gaiters +3"}

	--Used to swap into movement gear when the player is detected movement when not engaged
	sets.Movement = {left_ring = "Shneddick Ring"}

	--Impetus set has priority over any other modes
	sets.Impetus = {body="Bhikku Cyclas +2"}

	sets.Boost = {waist="Ask Sash"}

	-- Set to be used if you get cursed
	sets.Cursna_Received = {
	    neck="Nicander's Necklace",
	    left_ring={ name="Eshmun's Ring", bag="wardrobe1", priority=2},
		right_ring={ name="Eshmun's Ring", bag="wardrobe2", priority=1},
		waist="Gishdubar Sash",
	}

	sets.Enmity = {
	    ammo="Sapience Orb", -- 2
		head="Null Masque",
		neck="Moonlight Necklace", -- 15
		body="Emet Harness +1", -- 10
		hands="Kurys Gloves", -- 9
		legs="Bhikku Hose +2",
		feet="Ahosi Leggings", -- 7
		waist="Plat. Mog. Belt",
	    left_ear="Cryptic Earring", -- 4
		right_ear="Trux Earring", -- 5
		left_ring="Eihwaz Ring", -- 5
		right_ring="Petrov Ring", -- 4
	} -- 61

	-- Used for Magic Spells
	sets.Precast = {}
	sets.Precast.FastCast = {ammo="Impatiens",
	head=gear.herculean_fc_head,neck="Voltsurge Torque",left_ear = "Enchntr. Earring +1",right_ear = "Loquac. Earring",
	body="Dread Jupon",hands="Leyline Gloves",right_ring = "Lebeche Ring",right_ring = "Kishar Ring",
	legs="Rawhide Trousers"} -- FC 66

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {
	
	})

	sets.JA = {}
	sets.JA["Hundred Fists"] = {legs="Hesychast's Hose +1"}
	sets.JA["Berserk"] = {}
	sets.JA["Warcry"] = {}
	sets.JA["Defender"] = {}
	sets.JA["Aggressor"] = {}
	sets.JA["Provoke"] = sets.Enmity
	sets.JA["Focus"] = {head="Anchorite's Crown +1"}
	sets.JA["Dodge"] = {feet="Anch. Gaiters +3"}
	sets.JA["Chakra"] = {
		head="Mpaca's Cap",
		body="Anch. Cyclas +2",hands="Hesychast's Gloves",
		legs="Bhikku Hose +2",feet="Anch. Gaiters +3"}
	sets.JA["Boost"] = {waist="Ask Sash"}
	sets.JA["Counterstance"] = {}
	sets.JA["Chi Blast"] = {}
	sets.JA["Mantra"] = {feet="Mel. Gaiters +2"}
	sets.JA["Footwork"] = {feet="Bhikku Gaiters +2"}
	sets.JA["Perfect Counter"] = {head="Bhikku Crown +2"}
	sets.JA["Impetus"] = {}
	sets.JA["Inner Strength"] = {}

	--Default WS set base
	sets.WS = {ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",neck="Monks Nodowa +1",left_ear = "Sherida Earring",right_ear = "Schere Earring",
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",left_ring = "Ifrit Ring +1",right_ring = "Niqmaddu Ring",
		back=gear.jsecape_WS,waist="Moonbow Belt +1",legs="Mpaca's Hose",feet=gear.herc_feet_TA}

	-- 35% SB I for MNK
	-- Belt SB II 10%
	-- Mpaca Legs -- SB II 5%
	-- Earring / Ring SB II 10%
	-- Need 4% SB
	sets.WS.SB = set_combine( sets.WS, { -- This maximize SB
		head="Bhikku Crown +2", --SB 9
		waist="Moonbow Belt +1", -- SB II 10
		left_ear="Sherida Earring", -- SB II 5
		left_ring="Niqmaddu Ring", -- SB II 5
		legs="Mpaca's Hose", -- SB II 5
		ammo="Coiste Bodhar", -- SB 3
		right_ear={ name="Schere Earring", augments={'Path: A',}}, -- SB 3
	})

	sets.WS.MEVA = set_combine( sets.WS, { -- This maximize SB
		neck={ name="Warder's Charm +1", augments={'Path: A',}},
		left_ring="Murky Ring",
	})

	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {ammo="Falcon Eye",head="Dampening Tam",neck="Combatant's Torque",left_ear = "Cessance Earring",right_ring = "Ramuh Ring +1",body="Malignance Tabard",waist="Olseni Belt",legs="Hiza. Hizayoroi +2",feet="Malignance Boots"}
	sets.WS.FullAcc = {ammo="Falcon Eye",head="Mummu Bonnet +2",neck="Moonbeam Nodowa",left_ear = "Mache Earring +1",right_ear = "Telos Earring",body="Malignance Tabard",hands="Malignance Gloves",left_ring = "Ramuh Ring +1",right_ring = "Ramuh Ring +1",waist="Olseni Belt",legs="Hiza. Hizayoroi +2",feet="Malignance Boots"}

	sets.WS.PDL = set_combine(sets.WS,{})

	--WS Sets
	sets.WS["Combo"] = set_combine(sets.WS,{})
	sets.WS["Shoulder Tackle"] = set_combine(sets.WS,{})
	sets.WS["One Inch Punch"] = set_combine(sets.WS,{})
	sets.WS["Backhand Blow"] = set_combine(sets.WS,{})
	sets.WS["Raging Fists"] = set_combine(sets.WS, {})
	sets.WS["Spinning Attack"] = set_combine(sets.WS, {})
	sets.WS["Howling Fist"] = set_combine(sets.WS, {head="Lilitu Headpiece",body=gear.herculean_wsd_body})
	sets.WS["Dragon Kick"] = set_combine(sets.WS, {head="Mpaca's Cap",right_ear = "Moonshade Earring",feet="Anch. Gaiters +3"})
	sets.WS["Asuran Fists"] = set_combine(sets.WS, {})
	sets.WS["Tornado Kick"] = set_combine(sets.WS, {head="Mpaca's Cap",right_ear = "Moonshade Earring",feet="Anch. Gaiters +3"})
	sets.WS["Victory Smite"] = set_combine(sets.WS, {ammo="Coiste Bodhar",left_ear = "Sherida Earring",right_ear = "Odr Earring",neck="Light Gorget",body="Ken. Samue +1",hands="Ryuo Tekko",back=gear.jsecape_CRIT})
	sets.WS["Shijin Spiral"] = set_combine(sets.WS, {head="Malignance Chapeau",right_ear = "Mache Earring",left_ring = "Ramuh Ring +1",back=gear.jsecape_TP})

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})

end

-------------------------------------------------------------------------------------------------------------------
-- DO NOT EDIT BELOW THIS LINE UNLESS YOU NEED TO MAKE JOB SPECIFIC RULES
-------------------------------------------------------------------------------------------------------------------

-- Called when the player's subjob changes.
function sub_job_change_custom(new, old)
	-- Typically used for Macro pallet changing
end

--Adjust custom precast actions
function pretarget_custom(spell,action)

end
-- Augment basic equipment sets
function precast_custom(spell)
	local equipSet = {}
	if spell.type == 'WeaponSkill' then
		if buffactive.Impetus then
			equipSet = sets.Impetus
		end
		-- Custom weaponskill accuracy adjustments
		if state.OffenseMode.value == 'ACC' then
			if spell.name == 'Victory Smite' then
				equipSet = set_combine(equipSet, {head="Mummu Bonnet +2",left_ear = "Moonshade Earring",body="Sayadio's Kaftan",hands="Ryuo Tekko",right_ring="Begrudging Ring",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
			elseif spell.name == "Ascetic's Fury" then
				equipSet = set_combine(equipSet, {head="Mummu Bonnet +2",body="Sayadio's Kaftan",hands="Ryuo Tekko",right_ring="Begrudging Ring",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
			end
		end
	end
	return equipSet
end
-- Augment basic equipment sets
function midcast_custom(spell)
	local equipSet = {}

	return equipSet
end
-- Augment basic equipment sets
function aftercast_custom(spell)
	local equipSet = {}

	return choose_gear()
end

-- Called when the pet dies or is summoned
function pet_change_custom(pet,gain)
	local equipSet = {}

	return equipSet
end

-- Called during a pet midcast
function pet_midcast_custom(spell)
	local equipSet = {}

	return equipSet
end

-- Called after the performs an action
function pet_aftercast_custom(spell)
	local equipSet = {}

	return equipSet
end

--Function is called when the player gains or loses a buff
function buff_change_custom(name,gain)
	local equipSet = {}

	return choose_gear()
end

--This function is called when a update request the correct equipment set
function choose_set_custom()
	local equipSet = {}

	return choose_gear()
end

--Function is called when the player changes states
function status_change_custom(new,old)
	local equipSet = {}

	return choose_gear()
end

--Function is called when a self command is issued
function self_command_custom(command)

end

--Custom Function
function choose_gear()
	local equipSet = {}
	if player.status == "Engaged" then
		if buffactive['Impetus'] then
			equipSet = sets.Impetus
		end	
		if buffactive['Footwork'] then
			equipSet = set_combine(equipSet, sets.Foot_Work)
		end	
	end
	if buffactive['Boost'] then
		equipSet = set_combine(equipSet, sets.Boost)
	end
	return equipSet
end

function check_buff_JA()
	local buff = 'None'
	local ja_recasts = windower.ffxi.get_ability_recasts()

	-- Sub job has least priority
	if player.sub_job == 'WAR' then
		if not buffactive['Berserk'] and ja_recasts[1] == 0 then
			buff = "Berserk"
		elseif not buffactive['Aggressor'] and ja_recasts[4] == 0 then
			buff = "Aggressor"
		elseif not buffactive['Warcry'] and ja_recasts[2] == 0 then
			buff = "Warcry"
		end
	end

	-- Mantra Max priority
	if player.hpp < 51 and ja_recasts[15] == 0 then
		buff = "Chakra"
	elseif not buffactive.Impetus and ja_recasts[31] == 0 then
		buff = "Impetus"
	elseif not buffactive.Footwork and ja_recasts[21] == 0 then
		buff = "Footwork"
	elseif not buffactive.Mantra and ja_recasts[19] == 0 then
		buff = "Mantra"
	elseif not buffactive.Dodge and ja_recasts[14] == 0 then
		buff = "Dodge"
	elseif not buffactive.Focus and ja_recasts[13] == 0 then
		buff = "Focus"
	end

	return buff
end

function check_buff_SP()
	local buff = 'None'
	--local sp_recasts = windower.ffxi.get_spell_recasts()
	return buff
end

-- This function is called when the job file is unloaded
function user_file_unload()

end