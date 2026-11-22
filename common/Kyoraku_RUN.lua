--Iron gobbet
--Vanity battery
--Hippo socks +1 augmented
--Mensch strap+1
--Hermodr earring(DI)
--Refined Grip +1
--Irenic strap+1


--Turin

-- Load and initialize the include file.
include('RahvinGS/GearSets-Include')
include('RahvinGS/Rahvin-Engine')

-- Use "gs c food" to use the specified food item 
Food = "Miso Ramen"

BlueNuke = S{'Spectral Floe','Entomb', 'Magic Hammer', 'Tenebral Crush'}
BlueHealing = S{'Magic Fruit'}
BlueSkill = S{'Occultation','Erratic Flutter','Nature\'s Meditation','Cocoon','Barrier Tusk','Metallic Body','Mighty Guard'}
BlueTank = S{'Jettatura','Geist Wall','Blank Gaze','Sheep Song','Sandspin','Healing Breeze'}

-- 'TP','ACC','PARRY' are standard Default modes.  You may add more and assigne equipsets for them
state.OffenseMode:options('TP','ACC','PARRY','DT','MEVA','TANK') -- ACC effects WS and TP modes

-- Function used to change pallets based off sub job and modes
function Macro_Sub_Job()
	local macro = 1
	if player.sub_job == "BLU" then
		state.OffenseMode:set('DT')
		--Set you macro pallet for when you are /BLU
		macro = 1
		send_command('wait 2;aset set tanking')
	else
		state.OffenseMode:set('TP')
		--Set you macro pallet for when you are NOT /BLU
		macro = 1
	end
	return macro
end

Buff_Delay = 5 -- Used this to slow down auto buffing
Tank_Delay = 5 -- delays between tanking actions (only used when auto-buffing enabled and target locked on)

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "80"
MacroBook = "2"
MacroSet = Macro_Sub_Job()

--Modes for specific to Paladin.  These are defined below in "Weapons".
state.WeaponMode:options('Aettir','Naegling','Mace')
--'Great Axe','Axe'
state.WeaponMode:set('Aettir')

--Enable JobMode for UI.
UI_Name = 'Runes'
UI_Name2 = 'Auto Tank'

--Modes for specific to RUN
state.JobMode:options('None','Fire','Ice','Wind','Earth','Lightning','Water','Light','Dark') -- Modes used to use Rune Enhancement
state.JobMode:set('None')

Runes = {
	Fire = {Name = "Ignis", Description = "[ICE RESISTANCE] and deals [FIRE DAMAGE]"},
	Ice = {Name = "Gelus", Description = "[WIND RESISTANCE] and deals [ICE DAMAGE]"},
	Wind = {Name = "Flabra", Description = "[EARTH RESISTANCE] and deals [WIND DAMAGE]"},
	Earth = {Name = "Tellus", Description = "[LIGHTNING RESISTANCE] and deals [EARTH DAMAGE]"},
	Lightning = {Name = "Sulpor", Description = "[WATER RESISTANCE] and deals [LIGHTNING DAMAGE]"},
	Water = {Name = "Unda", Description = "[FIRE RESISTANCE] and deals [WATER DAMAGE]"},
	Light = {Name = "Lux", Description = "[DARK RESISTANCE] and deals [LIGHT DAMAGE]"},
	Dark = {Name = "Tenebrae", Description = "[LIGHT RESISTANCE] and deals [DARKNESS DAMAGE]"},
	None = {Name = 'None', Description = "None"}
}

jobsetup (LockStylePallet,MacroBook,MacroSet)

-- HP balancing: 3000 HP
-- MP balancing: 950 MP

function get_sets()

	sets.Weapons = {}

	sets.Weapons['Aettir'] = {
		main="Aettir",
		sub="Utu Grip",
	}

	sets.Weapons['Naegling'] = {
		main="Naegling",
		sub="Flametongue",
	}

	--sets.Weapons['Axe'] = {
		--main="Dolichenus",
		--sub="Naegling",
	--}

	--sets.Weapons['Great Axe'] = {
		--main="Lycurgos",
		--sub="Utu Grip",
	--}

	sets.Weapons['Mace'] = {
		main={ name="Loxotic Mace +1", augments={'Path: A',}},
	}

	sets.Weapons.Shield = {}
	
	sets.Weapons.Sleep = {
		main="Prime Blade",
		sub="Utu Grip",
	}

	-- Standard Idle set
	sets.Idle = {
		ammo="Homiliary", -- 1 Refresh
		--head={ name="Nyame Helm", -- 7/7
		head={ name="Herculean Helm", augments={'VIT+9','STR+3','"Refresh"+2','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
		--body="Erilaz Surcoat +2",
		--body="Runeist Coat +3",
		body="Prestige Plate.",
		--hands="Erilaz Gauntlets +2", -- 11/11
		hands="Prestige Gaunt.",
		legs={ name="Herculean Trousers", augments={'Accuracy+10','"Fast Cast"+1','"Refresh"+1','Accuracy+20 Attack+20',}},
		--legs="Eri. Leg Guards +2", -- 13/13
		--feet="Erilaz Greaves +2", -- 11/11
		feet="Prestige Sab.",
		--neck={ name="Futhark Torque +2", augments={'Path: A',}}, -- 7/7
		neck="Null Loop",
		waist="Plat. Mog. Belt",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=1}, -- 3/5
		right_ear="Sanare Earring", -- Upgrade to +1/+2 Earring
		left_ring={name="Moonbeam Ring", bag="wardrobe1", priority=4},
		right_ring="Murky Ring",
		back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Damage taken-5%',}}, -- 5/5
    } -- 75 PDT / 58 MDT		3571 HP/ 1149 MP

		--head="Prestige Crown",
		--body="Prestige Plate.",
		--hands="Prestige Gaunt.",
		--legs="Prestige Brais",
		--feet="Prestige Sab.",
		--back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Damage taken-5%',}},

	sets.Idle.PDT = set_combine( sets.Idle, {
		ammo="Staunch Tathlum",
		head="Null Masque",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		--neck="Futhark Torque +2",
		--ear2="Erilaz Earring +1",
		ear1="Tuisto Earring",
		ear2="Alabaster Earring",
		body="Runeist Coat +3",
		hands="Nyame Gauntlets",
		ring1="Moonbeam Ring",
		ring2="Murky Ring",
		back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Damage taken-5%',}},
		waist="Flume Belt +1",
		legs="Eri. Leg Guards +2",
		feet="Erilaz Greaves +2"	
	})

	sets.Idle.MEVA = set_combine( sets.Idle, {
		ammo="Staunch Tathlum",
		neck={ name="Warder's Charm +1", augments={'Path: A',}},
		head="Erilaz Galea +2",
		body="Runeist Coat +3",
		waist="Engraved Belt",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=1}, -- 3/5
		right_ear="Sanare Earring",
	})

	sets.Idle.DT = set_combine( sets.Idle, {
		ammo="Yamarang",
		head="Erilaz Galea +2",
		waist={ name="Plat. Mog. Belt", priority=2},
		left_ring={name="Moonbeam Ring", bag="wardrobe1", priority=4},
		right_ring="Murky Ring",
	})

	sets.Idle.TANK = set_combine( sets.Idle, {
		ammo="Staunch Tathlum",
		head="Prestige Crown",
		neck="Loricate Torque +1",
		ear1="Tuisto Earring",
		ear2="Odnowa Earring +1",
		--body="Adamantite Armor",
		body="Ashera Harness",
		hands="Prestige Gauntlets",
		ring1="Murky Ring",
		ring2="Gelatinous Ring +1",
		back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Damage taken-5%',}},
		waist="Engraved Belt",
		legs="Prestige Brais",
		feet="Prestige Sabatons",
	})

	-- Set is used for midcast during MEVA OffenseMode
	sets.MEVA = {
		ammo="Staunch Tathlum",
		neck={ name="Warder's Charm +1", augments={'Path: A',}},
		body="Runeist Coat +3",
		hands="Erilaz Gauntlets +2", -- 11/11
		legs="Eri. Leg Guards +2", -- 13/13
		feet="Erilaz Greaves +2", -- 11/11
		waist="Plat. Mog. Belt",
		left_ring={name="Moonbeam Ring", bag="wardrobe1", priority=4},
		right_ring={name="Moonbeam Ring", bag="wardrobe2", priority=5},
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=1}, -- 3/5
	}

	sets.Idle.TP = set_combine(sets.Idle, {
		ammo="Yamarang",
		head="Adhemar Bonnet +1",
		neck="Anu Torque",
		ear1="Sherida Earring",
		ear2="Alabaster Earring",
		body="Ashera Harness",
		hands="Adhemar Wrist. +1",
		ring1="Ilabrat Ring",
		ring2="Niqmaddu Ring",
		back="Null Shawl",
		waist="Kentarch Belt +1",
		legs={ name="Herculean Trousers", augments={'Accuracy+10','"Fast Cast"+1','"Refresh"+1','Accuracy+20 Attack+20',}},
		--legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet="Prestige Sabatons",
	})
	
	sets.Idle.ACC = set_combine(sets.Idle, {})
	sets.Idle.SB = set_combine(sets.Idle, {})
	sets.Idle.Resting = set_combine(sets.Idle, {})

	-- This gear will be equiped when the player is moving and not engaged
	sets.Movement = {
		left_ring={name="Moonbeam Ring", bag="wardrobe1"},
		right_ring={name="Moonbeam Ring", bag="wardrobe2"},
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
		--legs={ name="Carmine Cuisses +1", augments={'HP+80','STR+12','INT+12',}, priority=1},
    } -- 73 PDT / 33 MDT		3028 HP / 963 MP

	-- Set to be used if you get 
	sets.Cursna_Received = {
	    neck="Nicander's Necklace",
		left_ring="Purity Ring",
	    --left_ring={ name="Eshmun's Ring", bag="wardrobe1", priority=2},
		right_ring={ name="Saida Ring", bag="wardrobe2", priority=1},
		waist="Gishdubar Sash",
	}
sets.Cure_Received = {
		hands="Buremte Gloves",
		waist="Chuq'aba Belt",
		left_ear="Oneiros Earring",
		left_ring="Kunaji Ring",
		right_ring="Asklepian Ring",
	}
	sets.Cursna_Received = {
	    neck="Nicander's Necklace",
	    left_ring={ name="Ephedra Ring", bag="wardrobe8", priority=2},
		right_ring={ name="Ephedra Ring", bag="wardrobe8", priority=1},
		waist="Gishdubar Sash",
	}
		sets.Phalanx_Received = {}
	sets.Regen_Received = {}
	sets.Refresh_Received = {}
	sets.Waltz_Received = {}
	sets.Holy_Water = {
	    neck="Nicander's Necklace",
	}

	sets.Embolden = { back={ name="Evasionist's Cape", augments={'Enmity+1','"Embolden"+15','"Dbl.Atk."+1',}},}

	sets.OffenseMode = {
		ammo="Yamarang",
		head="Adhemar Bonnet +1",
		neck="Anu Torque",
		ear1="Sherida Earring",
		ear2="Alabaster Earring",
		body="Ashera Harness",
		hands="Adhemar Wrist. +1",
		ring1="Ilabrat Ring",
		ring2="Niqmaddu Ring",
		back="Null Shawl",
		waist="Kentarch Belt +1",
		legs={ name="Herculean Trousers", augments={'Accuracy+10','"Fast Cast"+1','"Refresh"+1','Accuracy+20 Attack+20',}},
		--legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet="Prestige Sabatons"
	}  -- Base TP set [5 Hit TP set. No Samura's Roll]

	--DPS set for tanking
	sets.OffenseMode.TP = {
		ammo="Yamarang",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		neck="Anu Torque",
		ear1="Sherida Earring",
		ear2="Alabaster Earring",
		body="Ashera Harness",
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		ring1="Ilabrat Ring",
		ring2="Niqmaddu Ring",
		back="Null Shawl",
		waist="Kentarch Belt +1",
		legs="Samnuha Tights",
		feet="Prestige Sabatons"
	} -- "glass cannon" / max-DPS

	-- Gear to swap in for ACC when TP
	sets.OffenseMode.ACC = set_combine(sets.OffenseMode, {
		ammo="Yamarang",
		head="Prestige Crown",
		neck="Anu Torque",
		ear1="Telos Earring",
		ear2="Alabaster Earring",
		body="Prestige Platemail",
		hands="Turms Mittens",
		ring1="Murky Ring",
		ring2="Chirich Ring",
		back={ name="Ogma's Cape", augments={'HP+60','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		legs="Prestige Brais",
		feet="Prestige Sabatons"
	}) -- Max acc with DT

	--Physical Damage Taken set for tanking
	sets.OffenseMode.DT = set_combine(sets.OffenseMode, {
		sub="Mensch Strap +1",
		ammo="Staunch Tathlum",
		head="Prestige Crown",
		neck="Anu Torque",
		ear1="Sherida Earring",
		ear2="Alabaster Earring",
		--body="Adamantite Armor",
		body="Ashera Harness",
		hands="Turms Mittens",
		ring1="Moonbeam Ring",
		ring2="Murky Ring",
		neck={ name="Unmoving Collar +1", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		back="Null Shawl",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
	}) -- Capped PDT with some DPS mixed in

	--Magic Evasion set for tanking
	sets.OffenseMode.MEVA = set_combine(sets.Idle.MEVA, {
		sub="Irenic Strap +1",
		ammo="Yamarang",
		head="Prestige Crown",
		neck="Futhark Torque +2",
		ear1="Erilaz Earring +1",
		ear2="Alabaster Earring",
		body="Runeist Coat +3",
		hands="Turms Mittens",
		ring1="Moonbeam Ring",
		ring2="Murky Ring",
		back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Damage taken-5%',}},
		waist="Engraved Belt",
		legs="Eri. Leg Guards +2",
		feet="Erilaz Greaves +2"
	}) -- Focus on Magic Evasion with some DPS mixed in

	-- Standard Tanking TP set
	sets.OffenseMode.PARRY = set_combine(sets.Idle.DT, {
		sub="Refined Grip +1",
		ammo="Staunch Tathlum",
		head="Prestige Crown",
		neck="Futhark Torque +2",
		ear1="Eabani Earring",
		ear2="Alabaster Earring",
		body="Prestige Platemail",
		hands="Turms Mittens",
		ring1="Moonbeam Ring",
		ring2="Murky Ring",
		back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parry rate +5',}},
		waist="Engraved Belt",
		legs="Eri. Leg Guards +2",
		feet="Turms Leggings"
	})
	
	-- Keeps you in Super Tank gear even if you lock on / engage
	sets.OffenseMode.TANK = set_combine(sets.Idle.TANK, {
		sub="Refined Grip +1",
		ammo="Staunch Tathlum",
		head="Prestige Crown",
		neck="Loricate Torque +1",
		ear1="Tuisto Earring",
		ear2="Odnowa Earring +1",
		--body="Adamantite Armor",
		body="Ashera Harness",
		hands="Prestige Gauntlets",
		ring1="Murky Ring",
		ring2="Gelatinous Ring +1",
		back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Damage taken-5%',}},
		waist="Engraved Belt",
		legs="Prestige Brais",
		feet="Prestige Sabatons"
	})
	
	
	-- Set used for hate generation on Job abilities
	sets.Enmity = { -- 23 Epo
		sub="Alber Grip",
		ammo="Sapience Orb", -- 2
		head="Halitus Helm",
		body="Emet Harness +1",
		--hands="Erilaz Gauntlets +2",
		hands="Kurys Gloves",
		legs="Eri. Leg Guards +2", -- 11
		feet="Erilaz Greaves +2", -- 8 
		neck={ name="Unmoving Collar +1", augments={'Path: A',}, priority=2}, -- 10
		--waist={ name="Plat. Mog. Belt", priority=1},
		waist="Warwolf Belt",
		--left_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=3},
		left_ear="Halasz Earring",
		right_ear={ name="Cryptic Earring", priority=5}, -- 4
		ring1={ name="Eihwaz Ring", priority=6}, -- 5
		ring2="Supershear Ring",
		back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Damage taken-5%',}}, -- 10
	} -- 99 Enmity 2884 HP / 840 MP

	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.SIRD = set_combine(sets.Idle.DT, {
		ammo="Staunch Tathlum", -- 11
		head="Erilaz Galea +2", -- 20
		hands="Regal Gauntlets", -- 10
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
		--legs={ name="Carmine Cuisses +1", augments={'HP+80','STR+12','INT+12',}}, -- 20
		neck="Moonbeam Necklace", -- 15
		waist="Audumbla Sash", -- 10
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Spell interruption rate down-10%',}}, -- 10
	})	-- 104 With Merits

	sets.Precast = {}
	-- Used for Magic Spells

	sets.Precast.FastCast = {
		ammo="Sapience Orb", -- 2
		head="Rune. Bandeau +2", -- 14
		body="Erilaz Surcoat +2", -- 13
		hands="Prestige Gaunt.",
		--hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}}, -- 8
		legs="Prestige Brais",
		--legs={ name="Futhark Trousers +4", augments={'Enhances "Inspire" effect',}},
		feet="Prestige Sab.",
		--feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}, priority=2}, -- 8
		neck="Voltsurge Torque",
		--neck="Orunmila's Torque",
		waist={ name="Plat. Mog. Belt", priority=1},
		right_ear={ name="Etiolation Earring", priority=3},
		left_ear={ name="Tuisto Earring", priority=4},
		left_ring="Kishar Ring", -- 4
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=5},
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Spell interruption rate down-10%',}}, -- 10
	} --65 FC


	sets.Precast.Enhancing = set_combine(sets.Precast.FastCast, {
		legs={ name="Futhark Trousers +4", augments={'Enhances "Inspire" effect',}}, -- 7  (15 - 8) 
		waist="Siegel Sash", -- 8
	}) -- 80+ FC

	sets.Precast.BlueMagic = set_combine (sets.Precast.FastCast, {})

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, sets.Enmity, sets.SIRD, {})

	-- Enhancing Skill
	sets.Midcast.Enhancing = {
		ammo="Staunch Tathlum",
	    head="Carmine Mask +1",
		body="Runeist Coat +3",
		--body="Manasa Chasuble",
		hands="Runeist Mitons +2",
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
		feet="Erilaz Greaves +2",
		neck={ name="Warder's Charm +1", augments={'Path: A',}},
		--neck="Hoxne Torque",
		waist="Carrier's Sash",
		--waist="Olympus Sash",
		left_ear="Tuisto Earring",
		right_ear="Mimir Earring",
		left_ring={name="Moonbeam Ring", bag="wardrobe2", priority=5},
		right_ring="Stikini Ring +1",
		--left_ring={name="Moonbeam Ring", bag="wardrobe1", priority=4},
		--ring2="Stikini Ring +1",
		back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Damage taken-5%',}}, -- 5/5
	}
	
	-- Max Enhancing Duration Set
	sets.Midcast.Enhancing.Duration = set_combine(sets.Midcast.Enhancing, {
		head="Erilaz Galea +2",
		hands="Regal Gauntlets",
		waist="Gishdubar Sash",
		legs="Futhark Trousers +4",
	})

	-- Elemental
	sets.Midcast.Enhancing.Elemental = set_combine(sets.Midcast.Enhancing, {})

	-- Enhancing Duration on OTHERS
	sets.Midcast.Enhancing.Others = set_combine(sets.Midcast.Enhancing, {})

	-- Status
	sets.Midcast.Enhancing.Status = set_combine(sets.Midcast.Enhancing, {})

	-- Regen Sets
	sets.Midcast.Regen = set_combine(sets.Midcast.Enhancing, {
		head="Rune. Bandeau +2",
		neck="Sacro Gorget",
		hands="Regal Gauntlets",
		waist="Sroda Belt",
		})

	sets.Midcast.Refresh = set_combine(sets.Midcast.Enhancing, {
		head="Erilaz Galea +2",
		waist="Gishdubar Sash",
	})

	sets.Midcast.Cure = {
		ammo="Staunch Tathlum",
		head="Null Masque",
		neck="Sacro Gorget",
		ear1="Mendi. Earring",
		ear2="Tuisto Earring",
		body="Runeist Coat +3",
		hands="Futhark Mitons +4",
		ring1="Moonbeam Ring",
		ring2="Murky Ring",
		back="Ogma's Cape",
		waist="Sroda Belt",
		legs="Eri. Leg Guards +2",
		feet="Erilaz Greaves +2",
	}

	-- Blue Magic
	sets.Midcast.BlueMagic = {}
	sets.Midcast.BlueMagic.Skill = set_combine(sets.Midcast.Enhancing, {})
	sets.Midcast.BlueMagic.Nuke = set_combine(sets.Midcast.Enhancing, {})
	sets.Midcast.BlueMagic.Healing = set_combine(sets.Midcast.Cure, {})
	sets.Midcast.BlueMagic.ACC = set_combine(sets.Midcast.Enhancing, {})
	sets.Midcast.BlueMagic.Enmity = set_combine(sets.Enmity, {})

	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {}

	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {
		waist="Siegel Sash",
		ear2="Earthcry Earring",
	})

	sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, sets.SIRD, {
		body="Runeist Coat +3",
	})

	sets.Midcast["Phalanx"] = set_combine(sets.Midcast.Enhancing, {
		head={ name="Fu. Bandeau +4", augments={'Enhances "Battuta" effect',}}, --7
		neck={ name="Warder's Charm +1", augments={'Path: A',}},
		waist="Carrier's Sash",
		left_ear="Tuisto Earring",
		right_ear={ name="Etiolation Earring", priority=1},
		body="Runeist Coat +3",
		feet={ name="Taeon Boots", augments={'Phalanx +3',}},
		left_ring={name="Moonbeam Ring", bag="wardrobe1", priority=4},
		right_ring={name="Moonbeam Ring", bag="wardrobe2", priority=5},
	})

	--sets["Dream Phalanx (ML50)"] = {
	--	ammo="Staunch Tathlum",
	--	head="Fu. Bandeau +4",
	--	neck="Futhark Torque +2",
	--	ear1="Alabaster Earring",
	--	ear2="Mimir Earring",
	--	body="Prestige Platemail",
	--	hands="Prestige Gauntlets",
	--	ring1="Gelatinous Ring +1",
	--	ring2="Moonbeam Ring",
	--	back="Ogma's Cape",
	--	waist="Engraved Belt",
	--	legs="Prestige Brais",
	--	feet="Prestige Sabatons"
	--}

	sets.Midcast["Flash"] = set_combine(sets.Enmity, {
		neck={ name="Warder's Charm +1", augments={'Path: A',}},
		waist="Carrier's Sash",
		left_ear="Tuisto Earring",
		hands="Erilaz Gauntlets +2",
		body="Runeist Coat +3",
		right_ear={ name="Etiolation Earring", priority=1},
		left_ring={name="Moonbeam Ring", bag="wardrobe1", priority=4},
		right_ring={name="Moonbeam Ring", bag="wardrobe2", priority=5},
	})

	sets.Midcast["Foil"] = set_combine(sets.Enmity, {
		neck={ name="Warder's Charm +1", augments={'Path: A',}},
		waist="Carrier's Sash",
		left_ear="Tuisto Earring",
		hands="Erilaz Gauntlets +2",
		body="Runeist Coat +3",
		right_ear={ name="Etiolation Earring", priority=1},
		left_ring={name="Moonbeam Ring", bag="wardrobe1", priority=4},
		right_ring={name="Moonbeam Ring", bag="wardrobe2", priority=5},
	})

	-- JOB ABILITIES --
	sets.JA = {}
    sets.JA["Elemental Sforzo"] = set_combine(sets.Enmity, { body="Futhark Coat +3" })
    sets.JA["Gambit"] = set_combine(sets.Enmity, { hands="Runeist Mitons +2",})
    sets.JA["Rayke"] = set_combine(sets.Enmity, { feet="Futhark Boots +4" })
    sets.JA["Liement"] = set_combine(sets.Enmity, { body="Futhark Coat +3" })
    sets.JA["One For All"] = sets.Idle
    sets.JA["Valiance"] = set_combine(sets.Enmity, {
        body="Runeist Coat +3",
		back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Damage taken-5%',}}, -- 5/5
        legs="Futhark Trousers +4"
    })
    sets.JA["Vallation"] = set_combine(sets.Enmity, {
        body="Runeist Coat +3",
		back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Damage taken-5%',}}, -- 5/5
        legs="Futhark Trousers +4"
    })
    sets.JA["Pflug"] = set_combine(sets.Enmity, { feet="Runeist Boots +4" })
    sets.JA["Battuta"] = set_combine(sets.Enmity, { head="Fu. Bandeau +4" })
    sets.JA["Vivacious Pulse"] = set_combine(sets.Precast.Divine, { head="Erilaz Galea +2" })
    sets.JA["Embolden"] = set_combine(sets.Enmity, sets.Embolden)
    sets.JA["Swordplay"] = set_combine(sets.Enmity, { hands="Futhark Mitons +4" })
	sets.JA["Provoke"] = sets.Enmity


	--Default WS set base
	sets.WS = {
		ammo="Knobkierrie",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear="Odr Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Epaminondas's Ring",
		back={ name="Ogma's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}
	sets.WS.WSD = {}
	sets.WS.CRIT = {}

	--Great Sword WS
	sets.WS["Hard Slash"] = {}
	sets.WS["Frostbite"] = {}
	sets.WS["Freezebite"] = {}
	sets.WS["Shockwave"] = {}
	sets.WS["Crescent Moon"] = {}
	sets.WS["Sickle Moon"] = {}
	sets.WS["Spinning Slash"] = {}
	sets.WS["Herculean Slash"] = {}
	sets.WS["Resolution"] = {}
	sets.WS["Dimidiation"] = {}

	sets.TreasureHunter = {
		waist="Chaac Belt",
		hands="Volte Bracers",
		legs="Volte Hose",
		ammo="Per. Lucky Egg",
	}

end

-------------------------------------------------------------------------------------------------------------------
-- DO NOT EDIT BELOW THIS LINE UNLESS YOU NEED TO MAKE JOB SPECIFIC RULES
-------------------------------------------------------------------------------------------------------------------


buff_time = os.clock()
tank_time = os.clock()

JA_Delay = os.clock()


-- Called when the player's subjob changes.
function sub_job_change_custom(new, old)
	-- Typically used for Macro pallet changing
end

--Adjust custom precast actions
function pretarget_custom(spell,action)

end
-- Augment basic equipment sets
function precast_custom(spell)
	equipSet = {}

	return equipSet
end
-- Augment basic equipment sets
function midcast_custom(spell)
	equipSet = {}
	equipSet = set_combine(equipSet, Embolden_Check(spell))

	if state.OffenseMode.value == 'MEVA' then
		equipSet = set_combine(equipSet, sets.MEVA)
	end

	return equipSet
end
-- Augment basic equipment sets
function aftercast_custom(spell)
	equipSet = {}

	return equipSet
end
-- Augment basic equipment sets
function midcast_custom(spell)
	equipSet = {}
	equipSet = set_combine(equipSet, Embolden_Check(spell))

	-- Equip Duration set for Enhancing Magic
	if spell.skill == 'Enhancing Magic' then
		equipSet = set_combine(equipSet, sets.Midcast.Enhancing.Duration)
	end

	if state.OffenseMode.value == 'MEVA' then
		equipSet = set_combine(equipSet, sets.MEVA)
	end

	return equipSet
end
--Function is called when the player gains or loses a buff
function buff_change_custom(name,gain)
	equipSet = {}

	return equipSet
end
--This function is called when a update request the correct equipment set
function choose_set_custom()
	equipSet = {}

	return equipSet
end
--Function is called when the player changes states
function status_change_custom(new,old)
	equipSet = {}

	return equipSet
end
--Function is called when a self command is issued
function self_command_custom(command)

end

--Function used to automate Job Ability use - Checked first
function check_buff_JA()
	buff = 'None'
	if os.clock() - buff_time > Buff_Delay then
		local ja_recasts = windower.ffxi.get_ability_recasts()
		local delay = os.clock() - JA_Delay

		if player.sub_job == 'SAM' then
			if not buffactive['Hasso'] and not buffactive['Seigan'] and ja_recasts[138] == 0 then
				buff = "Hasso"
			end
		end

		if player.sub_job == 'WAR' then
			if not buffactive['Berserk'] and ja_recasts[1] == 0 then
				buff = "Berserk"
			elseif not buffactive['Aggressor'] and ja_recasts[4] == 0 then
				buff = "Aggressor"
			elseif not buffactive['Warcry'] and ja_recasts[2] == 0 then
				buff = "Warcry"
			end
		end

		if buffactive[Runes[state.JobMode.value].Name] == 3 and windower.ffxi.get_player().target_locked then
			if not buffactive['Valiance'] and not buffactive['Vallation'] and not buffactive['Liement'] and ja_recasts[23] == 0 and delay > 3 then
				buff = "Vallation" -- Next Single Target DT and FC
			end
			if not buffactive['Valiance'] and not buffactive['Vallation'] and not buffactive['Liement'] and ja_recasts[113] == 0 then
				buff = "Valiance" -- AoE DT and FC
				JA_Delay = os.clock() -- Need to give Valiance a chance to register before Vallation is used
			end
		end

		--Rune sets
		if Runes[state.JobMode.value].Name ~= "None" then
			if ja_recasts[92] == 0 and buffactive[Runes[state.JobMode.value].Name] ~= 3 then
				buff = Runes[state.JobMode.value].Name
				info(Runes[state.JobMode.value].Description)
			end

		end

		if buff ~= 'None' then
			buff_time = os.clock()
		end
	end
	return buff
end

--Function used to automate Spell use
function check_buff_SP()
	buff = 'None'
	if os.clock() - buff_time > Buff_Delay then
		local sp_recasts = windower.ffxi.get_spell_recasts()

		if not buffactive['Enmity Boost'] and sp_recasts[476] == 0 and player.mp > 100 then
			buff = "Crusade"
		elseif not buffactive['Phalanx'] and sp_recasts[106] == 0 and player.mp > 100 then
			buff = "Phalanx"
		elseif not buffactive['Aquaveil'] and sp_recasts[55] == 0 and player.mp > 100 then
			buff = "Aquaveil"
		elseif not buffactive['Multi Strikes'] and sp_recasts[493] == 0 and player.mp > 36 then
			buff = "Temper"
		elseif not buffactive['Ice Spikes'] and sp_recasts[250] == 0 and player.mp > 16 then
			buff = "Ice Spikes"
		end

		if player.sub_job == "BLU" and player.sub_job_level > 8 then 
			if not buffactive['Defense Boost'] and sp_recasts[547] == 0 and player.mp > 10 then
				buff = "Cocoon"
			end
		end

		if buff ~= 'None' then
			buff_time = os.clock()
		else
			buff = check_tank()
		end
	end
	return buff
end


function check_tank()
	buff = 'None'
	if os.clock() - tank_time > Tank_Delay then
				log('tank check')
		if (player.status == "Engaged" or windower.ffxi.get_player().target_locked) and state.JobMode2.value == "ON" then
			local sp_recasts = windower.ffxi.get_spell_recasts()
			if sp_recasts[112] == 0 and player.mp > 25 then
				buff = "Flash"
			end
			if sp_recasts[840] == 0 and player.mp > 48 then
				buff = "Foil"
			end
		end
	end

	if buff ~= 'None' then
		tank_time = os.clock()
	end
	return buff
end

-- This function is called when the job file is unloaded
function user_file_unload()

end

-- Swaps back when embolden buff is active to extend duration
function Embolden_Check(spell)
	equipSet = {}
	if spell.target.id == player.id then
		if buffactive['Embolden'] then
			equipSet = sets.Embolden
			info('Embolden Set')
		end
	end
	return equipSet
end

function pet_change_custom(pet,gain)
	equipSet = {}
	
	return equipSet
end

function pet_aftercast_custom(spell)
	equipSet = {}

	return equipSet
end

function pet_midcast_custom(spell)
	equipSet = {}

	return equipSet
end