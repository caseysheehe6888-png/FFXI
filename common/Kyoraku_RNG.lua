--Salidar

-- Load and initialize the include file.
include('RahvinGS/GearSets-Include')
include('RahvinGS/Rahvin-Engine')

--Uses Items Automatically
AutoItem = false

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "140"
MacroBook ="5"  -- Sub Job macro pallets can be defined in the sub_job_change_custom function below
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"


-- Threshold for Ammunition Warning
Ammo_Warning_Limit = 5

-- Add CRIT the base modes to allow AM3 Critical Builds
state.OffenseMode:options('TP','ACC','DT','PDL','CRIT')
state.OffenseMode:set('TP')

--Modes for specific to Ranger
state.WeaponMode:options('Fomalhaut','Annihilator','Gastraphetes','Gandiva','Flaming Arrow','Naegling','Tauret')
state.WeaponMode:set('Fomalhaut')

--Enable JobMode for UI.
UI_Name = 'TP Mode'

--Melee or Ranged Mode
state.JobMode:options('Standard','Melee','Ranged')
state.JobMode:set('Standard')

--Set the ammo type for each WeaponMode (above) and Types: Bullet, Arrow, Bolt
--This allows for generic gear sets such as ammo=Ammo.RA for Midcast.RA as an example.
Ranged_Weapons = {
	{WeaponMode = "Naegling", Type = "Arrow"},
	{WeaponMode = "Gandiva", Type = "Arrow"},
	{WeaponMode = "Fomalhaut", Type = "Bullet"},
	{WeaponMode = "Annihilator", Type = "Bullet"},
	{WeaponMode = "Gastraphetes", Type = "Bolt"},
	{WeaponMode = "Tauret", Type = "Arrow"},
}

-- Used to determine if Obi is used or Orpheus Sash - if either is not present it will not change the waist slot
elemental_ws = S{'Aeolian Edge', 'Flaming Arrow', 'Wildfire','Trueflight','Hot Shot'}

-- Initialize Player
jobsetup (LockStylePallet,MacroBook,MacroSet)

-- Goal is 2000 HP
function get_sets()
	-- Weapon setup
	sets.Weapons = {}

	sets.Weapons['Naegling'] = {
								main="Naegling",
								sub={ name="Gleti's Knife", augments={'Path: A',}},
								--sub="Kraken Club",
								--sub={ name="Gleti's Knife", augments={'Path: A',}},
								range={ name="Sparrowhawk +2", augments={'TP Bonus +1000',}},
								ammo="Hauksbok Arrow",
	}

	sets.Weapons['Fomalhaut'] = {
								main={ name="Perun +1", augments={'Path: A',}},
								sub={ name="Gleti's Knife", augments={'Path: A',}},
								 range="Armageddon",
	}

	sets.Weapons['Annihilator'] = {
									main={ name="Perun +1", augments={'Path: A',}},
									main={ name="Gleti's Knife", augments={'Path: A',}},
									--sub={ name="Gleti's Knife", augments={'Path: A',}},
									range={ name="Annihilator", augments={'Path: A',}},
	}

	sets.Weapons['Gastraphetes'] = {
									main={ name="Malevolence", augments={'INT+9','Mag. Acc.+10','"Mag.Atk.Bns."+9','"Fast Cast"+4',}},
									sub={ name="Malevolence", augments={'INT+6','Mag. Acc.+7','"Mag.Atk.Bns."+4','"Fast Cast"+3',}},
									--range={ name="Gastraphetes", augments={'Path: A',}},
									range={ name="Killer Bow", augments={'Path: A',}},
		
	}

	--sets.Weapons['Fail-Not'] = {
	--					main={ name="Perun +1", augments={'Path: A',}},
	--					sub={ name="Gleti's Knife", augments={'Path: A',}},
	--					range="Mpaca's Bow",
	--					--range={ name="Fail-Not", augments={'Path: A',}},
	--					ammo="Voluspa Arrow",
	--}
	
	sets.Weapons['Gandiva'] = {
								main="Oneiros Knife",
								sub="Nusku Shield",
								range="Mpaca's Bow",
								--range="Gandiva",
								ammo="Voluspa Arrow",
	}
	sets.Weapons['Flaming Arrow'] = {
									main={ name="Malevolence", augments={'INT+9','Mag. Acc.+10','"Mag.Atk.Bns."+9','"Fast Cast"+4',}},
									sub={ name="Malevolence", augments={'INT+6','Mag. Acc.+7','"Mag.Atk.Bns."+4','"Fast Cast"+3',}},
									range={ name="Holliday", augments={'Weapon skill damage +2%','STR+20','Rng.Atk.+10','DMG:+17',}},
									ammo="Devastating Bullet",}

	--sets.Weapons['Yoichinoyumi'] = {
	--				main={ name="Perun +1", augments={'Path: A',}},
	--						sub={ name="Gleti's Knife", augments={'Path: A',}},
	--						range="Yoichinoyumi",
	--						ammo="Voluspa Arrow",
	--}
	
		sets.Weapons['Tauret'] = {
				main={ name="Malevolence", augments={'INT+9','Mag. Acc.+10','"Mag.Atk.Bns."+9','"Fast Cast"+4',}},
				sub={ name="Malevolence", augments={'INT+6','Mag. Acc.+7','"Mag.Atk.Bns."+4','"Fast Cast"+3',}},
				range={ name="Sparrowhawk +2", augments={'TP Bonus +1000',}},
				ammo="Hauksbok Arrow",
	}

	sets.Weapons.Melee = {
		main={ name="Naegling", augments={'Path: A',}},
		sub="Gleti's Knife",
	}

	sets.Weapons.Ranged = {
		main={ name="Perun +1", augments={'Path: A',}},
		sub={ name="Gleti's Knife", augments={'Path: A',}},
	}

	sets.Weapons.Shield = {
		sub="Nusku Shield",
	}

	-- Ammo Selection - will choose based off equiped weapon
	Ammo.Bullet.RA = "Devastating Bullet"		-- TP Ammo
	Ammo.Bullet.ACC = "Devastating Bullet"	-- Accuracy Ammo
	Ammo.Bullet.CRIT = "Devastating Bullet"	-- Critical Hit Mode Ammo
	Ammo.Bullet.WS = "Devastating Bullet"		-- Physical Weaponskills (consumed)
	Ammo.Bullet.WSD = "Devastating Bullet"		-- Physical Weaponskills (not consumed)
	Ammo.Bullet.MAB = "Devastating Bullet"		-- Magical Weaponskills
	Ammo.Bullet.MACC = "Devastating Bullet"		-- Magic Accuracy
	Ammo.Bullet.MAG_WS = "Devastating Bullet"	-- Magic Weaponskills (Not Consumed)
	Ammo.Bullet.PHY_WS = "Devastating Bullet"	-- Magic Weaponskills (Not Consumed)

	Ammo.Arrow.RA = "Voluspa Arrow"			-- TP Ammo
	Ammo.Arrow.ACC = "Voluspa Arrow"		-- Accuracy Ammo
	Ammo.Arrow.CRIT = "Voluspa Arrow"			-- Critical Hit Mode Ammo
	Ammo.Arrow.WS = "Voluspa Arrow"				-- Physical Weaponskills (consumed)
	Ammo.Arrow.WSD = "Hauksbok Arrow"		-- Physical Weaponskills (not consumed)
	Ammo.Arrow.MAB = "Voluspa Arrow"				-- Magical Weaponskills
	Ammo.Arrow.MACC = "Voluspa Arrow"			-- Magic Accuracy
	Ammo.Arrow.MAG_WS = "Voluspa Arrow"			-- Magic Weaponskills (Not consumed)
	Ammo.Arrow.PHY_WS = "Voluspa Arrow"			-- Magic Weaponskills (Not Consumed)

	Ammo.Bolt.RA = "Eminent Bolt"			-- TP Ammo
	Ammo.Bolt.ACC = "Eminent Bolt"			-- Accuracy Ammo
	Ammo.Bolt.CRIT = "Eminent Bolt"		-- Critical Hit Mode Ammo
	Ammo.Bolt.WS = "Eminent Bolt"			-- Physical Weaponskills (consumed)
	Ammo.Bolt.WSD = "Eminent Bolt"			-- Physical Weaponskills (not consumed)
	Ammo.Bolt.MAB = "Eminent Bolt"			-- Magical Weaponskills
	Ammo.Bolt.MACC = "Eminent Bolt"		-- Magic Accuracy
	Ammo.Bolt.MAG_WS = "Eminent Bolt"		-- Magic  (Not consumed)
	Ammo.Bolt.PHY_WS = "Eminent Bolt"		-- Magic Weaponskills (Not Consumed)

	--Modes to select correct ammo based off weapon type
	Ammo.RA = Ammo[state.RAMode.value].RA
	Ammo.ACC = Ammo[state.RAMode.value].ACC
	Ammo.CRIT = Ammo[state.RAMode.value].CRIT
	Ammo.WS = Ammo[state.RAMode.value].WS
	Ammo.WSD = Ammo[state.RAMode.value].WSD
	Ammo.MAB = Ammo[state.RAMode.value].MAB
	Ammo.MACC = Ammo[state.RAMode.value].MACC
	Ammo.MAG_WS = Ammo[state.RAMode.value].MAG_WS
	Ammo.PHY_WS = Ammo[state.RAMode.value].PHY_WS

	-- Standard Idle set with -DT,Refresh,Regen with NO movement gear
	sets.Idle =  {
		ammo=Ammo.RA, -- Smart_Ammo() will select from your XXXX.RA type
		head="Nyame Helm",               -- DT -7%
		body="Meg. Cuirie +2",           -- DT ~3%, Regen +1
		hands="Meg. Gloves +2",          -- DT ~2%
		legs="Meg. Chausses +2",          -- DT ~3%
		feet="Nyame Sollerets",          -- DT -7%
		neck="Loricate Torque +1",       -- DT -6%
		waist="Flume Belt +1",           -- PDT/MDT
		ear1="Infused Earring",          -- Regen +1
		ear2="Odnowa Earring +1",        -- DT -3%
		ring1="Murky Ring",          -- DT -10%
		ring2="Moonlight Ring",          -- Regen +5
		back="Moonbeam Cape"             -- HP / DT -5%
	}

    sets.Idle.TP = set_combine(sets.Idle, {})
	sets.Idle.H15 = set_combine(sets.Idle, {})
	sets.Idle.H30 = set_combine(sets.Idle, {})
	sets.Idle.Hcap = set_combine(sets.Idle, {})
	sets.Idle.Evasion = set_combine(sets.Idle, {})

	sets.Movement = { 
				legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
				feet="Hippo. Socks +1",
				right_ring="Shneddick Ring",
	}

	-- Set to be used if you get cursna casted on you
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

	--Base TP set to build off when melee'n
	sets.OffenseMode = {ammo=Ammo.RA,}

	--Set focuses on maximum TP gain
	sets.OffenseMode.TP = {
		head="Malignance Chapeau",
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs="Amini Bragues +2",
		feet="Tatena. Sune. +1",
		neck={ name="Scout's gorget +1", augments={'Path: A',}},
		waist="Windbuffet Belt +1",
		left_ear="Sherida Earring",
		right_ear="Dedition Earring",
		left_ring="Epona's Ring",
		right_ring="Petrov Ring",
		back={ name="Belenus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10','Damage taken-1%',}},
	}


	-- Set is used for when you are engaged and in ranged mode (not actually hitting an enemy)
	sets.OffenseMode.Ranged = set_combine(sets.Idle, {
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Warder's Charm +1",        -- Magic damage reduction
		waist="Flume Belt +1",           -- PDT/MDT
		ear1="Etiolation Earring",       -- HP / MDT
		ear2="Odnowa Earring +1",        -- HP / DT
		ring1="Murky Ring",          -- DT -10%
		ring2="Moonlight Ring",          -- HP / DT
		back="Moonbeam Cape"             -- HP / DT
	})

	--This set is used when OffenseMode is set to DT and enaged
	sets.OffenseMode.DT = set_combine(sets.OffenseMode.TP, {
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Anu Torque",
		waist="Ioskeha Belt +1",
		ear1="Telos Earring",
		ear2="Odnowa Earring +1",
		ring1="Murky Ring",
		ring2="Chirich Ring +1",
		back="Belenus's Cape"
	})

	--This set is used when OffenseMode is set to PDL and enaged
	sets.OffenseMode.PDL = set_combine(sets.OffenseMode.TP, {
	})

	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	sets.OffenseMode.ACC = set_combine(sets.OffenseMode.TP, {
		right_ring={ name="Chirich Ring +1"},
		left_ear="Crep. Earring",
	})

	--This set is used when OffenseMode is CRIT and Engaged
	sets.OffenseMode.CRIT = set_combine(sets.OffenseMode[state.OffenseMode.value], {

	})

	--The following sets augment the base TP set above for Dual Wielding
	sets.DualWield = {
		-- Add DW 10% cape
	}

	sets.Precast = {ammo=Ammo.RA,}
	-- 70 snapshot is Cap
	-- Velocity Shot is seperate term - JA of Ranger
	-- Rapid shot is like quick magic
	-- Snapshot is like Fast Cast

	-- True Shot Ranges (Increases RA and WS and)
		-- Distances listed below are effected by Monster Size
		-- Gun ~6.5 yalms
		-- Short Bow ~8.6 yalms
		-- Crossbow ~10.7 yalms
		-- Long Bow ~ 11.8 yalms

	-- Flurry is 15% Snapshot
	-- Flurry II 30% Snapshot

	-- Rapid Shot is a Job Trait of Ranger - 30%

	--No flurry - 60 Snapshot needed (Assuming 10% from Merits)
	-- Snapshot / Rapidshot
	sets.Precast.RA = set_combine(sets.Precast, { -- 5 Snapshot on Perun +1 Augment if used
												head={ name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+4',}},
    											body="Amini Caban +1",
    											hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},-- 8
    											legs="Orion Braccae +1", --15
    											neck="scout's gorget +1",
    											waist="Impulse Belt",
    											back={ name="Belenus's Cape", augments={'"Snapshot"+10',}}, -- 10 with 2% Velocity Shot
												feet="Meg. Jam. +2",
												left_ear="Volley Earring",
												right_ear={ name="Amini Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+7','Mag. Acc.+7',}},
												left_ring="Cacoethic Ring +1",
												right_ring="Cacoethic Ring",
    })	--60 Snapshot / 29 Rapidshot / 9% Velocity Shot current 55 Snapshot / 16 Rapid Shot
	
	-- Only the Bullet needs to be set for ACC sets (so that it will match the sets.Midcast.RA.ACC)
    sets.Precast.RA.ACC = set_combine(sets.Precast.RA, {ammo=Ammo.ACC,
    })

	-- Flurry - 45 Snapshot Needed
	sets.Precast.RA.Flurry = set_combine(sets.Precast.RA, {
															head="Orion Beret +4",
															legs={ name="Adhemar Kecks", augments={'AGI+10','"Rapid Shot"+10','Enmity-5',}},
															--legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}}, -- 10/13
		
	}) --45 Snapshot / 60 Rapidshot / 9% Velocity Shot Current 41 Snapshot / 44 Rapid shot

	-- Flurry II - 30 Snapshot Needed
	sets.Precast.RA.Flurry_II = set_combine( sets.Precast.RA.Flurry, { 
																		head="Orion Beret +4",
																		legs={ name="Adhemar Kecks", augments={'AGI+10','"Rapid Shot"+10','Enmity-5',}},
																		--legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}}, -- 10/13
																		feet={ name="Arcadian Socks", augments={'Enhances "Stealth Shot" effect',}},
    })	--35 Snapshot / 70 Rapidshot / 9% Velocity Shot Current 31 Snapshot / 54 Rapid shot

	-- Fast Cast for magic such as Utsusemi
	-- sets.Precast.FastCast = {
	   -- head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}}, --14
		--body={ name="Taeon Tabard", augments={'"Fast Cast"+5','HP+40',}}, -- 9
		--hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}}, -- 8
		--legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+11','"Fast Cast"+6',}}, --6
		--feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}}, -- 8
		--neck="Voltsurge Torque", --8
		--waist="Siegel Sash", -- 8 (Enhancing Magic only - Utsusemi)
		--left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		--right_ear="Etiolation Earring", -- 1
		--left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		--right_ring="Weather. Ring",
		--back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10','Damage taken-5%',}}, -- Need to upgrade Cape with 10% FC
	-- } -- 77 FC for Utsusemi (80 is cap)
	 
		--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {
		ammo=Ammo.RA,
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Iskur Gorget",
		waist="K. Kachina Belt +1",
		ear1="Telos Earring",
		ear2="Odnowa Earring +1",
		ring1="Murky Ring",
		ring2="Moonlight Ring",
		back="Belenus's Cape"
	})

	-- Ranged Attack Gear (Normal Midshot)
    sets.Midcast.RA = set_combine(sets.Midcast, {
		head="Meghanada Visor +2",
		body="Ikenga's Vest",
		hands="Meg. Gloves +2",
		legs={ name="Adhemar Kecks +1", augments={'AGI+12','Rng.Acc.+20','Rng.Atk.+20',}},
		feet="Ikenga's Clogs",
		neck="Ocachi Gorget",
		waist="Kwahu Kachina Belt",
		left_ear="Volley Earring",
		right_ear={ name="Amini Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+7','Mag. Acc.+7',}},
		left_ring="Cacoethic Ring +1",
		right_ring="Cacoethic Ring",
		back={ name="Lutian Cape", augments={'STR+1','AGI+2','"Store TP"+1','"Snapshot"+3',}},
    }) -- With Recycle Merits 101 Recycle for TP bonus and Ammo Save

	-- Ranged Attack Gear (High Accuracy Midshot)
    sets.Midcast.RA.ACC = set_combine(sets.Midcast.RA, {
		ammo=Ammo.ACC,
		body="Orion jerkin +3",
		waist="Kwahu Kachina Belt",
		right_ear="Beyla Earring",
		left_ear="Crep. Earring",
		feet="Amini Bottillons +2",
		left_ring="Hajduk Ring +1",
		left_ring="Crepuscular Ring",
		right_ring={ name="Cacoethic Ring +1", augments={'Path: A',}},
		
    })

	-- Ranged Attack Gear (Physical Damage Limit)
    sets.Midcast.RA.PDL = set_combine(sets.Midcast.RA, {
	    head="Ikenga's Hat",
		body="Amini Caban +2",
		hands="Ikenga's Gloves",
		legs="Ikenga's Trousers",
    })

	-- Ranged Attack Gear (Critical Build)
    sets.Midcast.RA.CRIT = set_combine(sets.Midcast.RA, {
		head="Meghanada Visor +2",
		--body="Nisroch Jerkin",
		hands="Mummu Wrists +2",
		legs="Amini Bragues +2",
		feet="Oshosi Leggings",
		waist="K. Kachina Belt",
		left_ear="Odr Earring",
		right_ear={ name="Amini Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Crit.hit rate+6','STR+7 AGI+7',}},
		left_ring="Begrudging Ring",
		right_ring="Mummu Ring",
		back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','Crit.hit rate+10','Damage taken-5%',}},
    })

	-- Ranged Attack Gear (Double Shot Midshot)
	sets.Midcast.RA.DoubleShot = set_combine(sets.Midcast.RA, {
		head={ name="Arcadian Beret +3", augments={'Enhances "Recycle" effect',}},
		body={ name="Arc. Jerkin +3", augments={'Enhances "Snapshot" effect',}},
		legs="Oshosi Trousers",
		hands="Oshosi Gloves",
		feet="Oshosi Leggings",
    })

	-- Ranged Attack Gear (Barrage active)
	sets.Midcast.RA.Barrage = set_combine(sets.Midcast.RA, {
	    hands="Orion Bracers +3",
    })

	-- Job Abilities
	sets.JA = {}
	sets.JA["Eagle Eye Shot"] = {legs={ name="Arc. Braccae +3", augments={'Enhances "Eagle Eye Shot" effect',}},}
	sets.JA["Scavenge"] = {feet="Orion Socks +3",}
	sets.JA["Shadowbind"] = { hands="Orion Bracers +3",}
	sets.JA["Camouflage"] = {body={ name="Arc. Jerkin +3", augments={'Enhances "Snapshot" effect',}},}
	sets.JA["Sharpshot"] = { legs="Orion Braccae +3",} -- Used for rules below
	sets.JA["Barrage"] = {} -- Midcast.RA.Barrage set
	sets.JA["Unlimited Shot"] = {}
	sets.JA["Velocity Shot"] = {}
	sets.JA["Double Shot"] = {} -- Midcast.RA.Double Shot set
	sets.JA["Bounty Shot"] = {hands="Amini Glovelettes +2",} -- Upgrade to TH5
	sets.JA["Decoy Shot"] = {}
	sets.JA["Overkill"] = {body="Arcadian Jerkin +3",}
	sets.JA["Hover Shot"] = {}


	-- Dancer JA Section

	sets.Flourish = set_combine(sets.Idle.DT, {})

	sets.Jig = set_combine(sets.Idle.DT, { })

	sets.Step = set_combine(sets.OffenseMode.DT, {})

	sets.Samba = set_combine(sets.Idle.DT, {})

	sets.Waltz = set_combine(sets.OffenseMode.DT, {
		ammo="Yamarang", -- 5
		body={ name="Gleti's Cuirass"}, -- 10
		--hands="Slither Gloves +1", -- 5
		--legs="Dashing Subligar", -- 10
	}) -- 30% Potency

	sets.PhantomRoll = {}

	-- Base Weapon Skill set
	sets.WS = {
		ammo = Ammo.WS,
	    head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck={ name="scout's gorget +1", augments={'Path: A',}},
		waist="Fotia Belt",
		left_ear="Ishvara Earring",
		right_ear="Enervating Earring",
		--left_ring="Cornelia's Ring",
		right_ring="Epaminondas's Ring",
		left_ring="Sroda Ring",
		back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}}, -- Add Melee Cape
	}

	-- Weapon Skill Damage`
	sets.WS.RA = set_combine(sets.WS, {
		ammo=Ammo.WSD,
		head="Orion Beret +4",
		body="Amini Caban +2",
		hands="Nyame Gauntlets",
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet="Amini Bottillons +2",
		neck={ name="scout's gorget +1", augments={'Path: A',}},
		waist="Fotia Belt",
		left_ear= {name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		left_ring="Sroda Ring",
		right_ring="Dingir Ring",
		back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
	})
	
	-- Subtle Blow set used in OffenseMode.SB
	sets.WS.SB = set_combine(sets.WS, {body="ikenga's vest", })
	sets.WS.SB.RA = set_combine(sets.WS.RA, {
											body="ikenga's vest",
											hands="Malignance gloves",
											legs="Ikenga's trousers",})

	-- Physical Damage Limit set used in OffenseMode.PDL
	sets.WS.PDL = set_combine(sets.WS, { })
	sets.WS.PDL.RA = set_combine(sets.WS.RA, { 

	})

	-- Accuracy set used in OffenseMode.ACC
	sets.WS.ACC = set_combine(sets.WS, { })
	sets.WS.ACC.RA = set_combine(sets.WS.RA, {
		ammo=Ammo.ACC, -- Smart_Ammo() will select from your XXXX.RA type
	})

	-- Critical Hit set used in OffenseMode.SB
	sets.WS.CRIT = set_combine(sets.WS, { })
	sets.WS.CRIT.RA = set_combine(sets.WS.RA, { 
		Ammo.CRIT -- Smart_Ammo() will select from your XXXX.RA type
	})

	-- Weapon Skill Damage (Melee)
	sets.WS.WSD = set_combine(sets.WS, {
		ammo=Ammo.Arrow.WSD,
		head="Orion Beret +4",
		body="Amini Caban +1",
		hands="Meg. Gloves +2",
		legs="Arc. Braccae +2",
		feet="Meg. Jam. +2",
		neck="Scout's Gorget +1",
		left_ear="Ishvara Earring",
		right_ear="Moonshade Earring",
		left_ring="Apate Ring",
		right_ring="Rajas Ring",
		back={ name="Belenus's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
	})
	
	-- Magic Attack Bonus
	sets.WS.MAB = set_combine(sets.WS, {
			head={ name="Nyame Helm", augments={'Path: B',}},
			body={ name="Nyame Mail", augments={'Path: B',}},
            hands={ name="Nyame Gauntlets", augments={'Path: B',}},
            legs={ name="Nyame Flanchard", augments={'Path: B',}},
            feet={ name="Nyame Sollerets", augments={'Path: B',}},
            neck="scout's gorget +1",
            waist="Fotia Belt",
            left_ear="Friomisi Earring",
            right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
			left_ring="Cacoethic Ring +1",
			right_ring="Cacoethic Ring",
            back={ name="Belenus's Cape", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%',}},
			})


	-- Gun Weaponskills
	sets.WS["Hot Shot"] =  {
		head="Orion Beret +4",
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Friomisi Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ring="Epaminondas's Ring",
		left_ring="Dingir Ring",
		back={ name="Belenus's Cape", augments={'STR+20','Rng.Acc.+20 Rng.Atk.+20','STR+10','Weapon skill damage +10%',}},

	}
	sets.WS["Split Shot"] = set_combine(sets.WS.RA, {})
	sets.WS["Sniper Shot"] = set_combine(sets.WS.RA, {})
	sets.WS["Slug Shot"] = set_combine(sets.WS.RA, {})
	sets.WS["Blast Shot"] = set_combine(sets.WS.RA, {})
	sets.WS["Heavy Shot"] = set_combine(sets.WS.RA, {})
	sets.WS["Detonator"] = set_combine(sets.WS.RA, {})
	sets.WS["Numbing Shot"] = set_combine(sets.WS.RA, {})
	sets.WS["Wildfire"] = set_combine(sets.WS.MAB, {
			neck={ name="scout's gorget +1", augments={'Path: A',}},
			right_ear="Hecate's Earring",
			right_ring="Epaminondas's Ring",
													
	})
	sets.WS["Last Stand"] = set_combine(sets.WS.RA, {
			right_ear={ name="Amini Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Crit.hit rate+6','STR+7 AGI+7',}},
			left_ring="Sroda Ring",
			right_ring="Epaminondas's Ring",
	})
	sets.WS["Coronach"] = {
							ammo="Devastating Bullet",
							head="Orion Beret +4",
							body="Amini Caban +2",
							hands="Nyame Gauntlets",
							legs="Nyame Flanchard",
							feet="Amini Bottillons +2",
							neck={ name="Scout's gorget +1", augments={'Path: A',}},
							waist="Fotia Belt",
							left_ear="Ishvara Earring",
							right_ear={ name="Amini Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Crit.hit rate+6','STR+7 AGI+7',}},
							left_ring="Sroda Ring",
							right_ring="Epaminondas's Ring",
							back={ name="Belenus's Cape", augments={'STR+20','Rng.Acc.+20 Rng.Atk.+20','STR+10','Weapon skill damage +10%',}},
	}

	-- Archery Weaponskills
	sets.WS["Flaming Arrow"] = set_combine(sets.WS.MAB, {})
	sets.WS["Piercing Arrow"] = set_combine(sets.WS.RA, {})
	sets.WS["Dulling Arrow"] = set_combine(sets.WS.RA, {})
	sets.WS["Sidewinder"] = set_combine(sets.WS.RA, {})
	sets.WS["Blast Arrow"] = set_combine(sets.WS.RA, {})
	sets.WS["Arching Arrow"] = set_combine(sets.WS.RA, {})
	sets.WS["Refulgent Arrow"] = set_combine(sets.WS.RA, {})
	sets.WS["Jishnu's Radiance"] = set_combine(sets.WS.RA, {
		head={ name="Blistering Sallet +1", augments={'Path: A',}},
		hands="Amini Glove. +2",
		legs="Ikenga's Trousers",
		left_ear="Odr earring",
		right_ear= {name="Amini Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Crit.hit rate+6','STR+7 AGI+7',}},
		left_ring="Begrudging Ring",
		right_ring="Apate Ring",
		back={ name="Belenus's Cape", augments={'DEX+20','Rng.Acc.+20 Rng.Atk.+20','Crit.hit rate+10',}},
	})
	sets.WS["Apex Arrow"] = set_combine(sets.WS.RA, {})
	sets.WS["Namas Arrow"] = set_combine(sets.WS.RA, {})

	-- Sword Weaponskills
	sets.WS["Fast Blade"] = set_combine(sets.WS.WSD, {})
	sets.WS["Burning Blade"] = set_combine(sets.WS.MAB, {})
	sets.WS["Flat Blade"] = set_combine(sets.WS.WSD, {})
	sets.WS["Shining Blade"] = set_combine(sets.WS.WSD, {})
	sets.WS["Circle Blade"] = set_combine(sets.WS.WSD, {})
	sets.WS["Spirits Within"] = set_combine(sets.WS.WSD, {})
	sets.WS["Savage Blade"] = set_combine(sets.WS.WSD, {})

	-- Dagger Weaponskills
	sets.WS["Wasp Sting"] = set_combine(sets.WS.WSD, {})
	sets.WS["Viper Bite"] = set_combine(sets.WS.WSD, {})
	sets.WS["Shadowstitch"] = set_combine(sets.WS.WSD, {})
	sets.WS["Gust Slash"] = set_combine(sets.WS.WSD, {})
	sets.WS["Cyclone"] = set_combine(sets.WS.WSD, {})
	sets.WS["Energy Steal"] = set_combine(sets.WS.WSD, {})
	sets.WS["Energy Drain"] = set_combine(sets.WS.WSD, {})
	sets.WS["Evisceration"] = set_combine(sets.WS.WSD, {})
	sets.WS['Aeolian Edge'] = {
							ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
							head={ name="Nyame Helm", augments={'Path: B',}},
							body={ name="Nyame Mail", augments={'Path: B',}},
							hands={ name="Nyame Gauntlets", augments={'Path: B',}},
							legs={ name="Nyame Flanchard", augments={'Path: B',}},
							feet={ name="Nyame Sollerets", augments={'Path: B',}},
							neck="Sibyl Scarf",
							waist="Hachirin-no-Obi",
							left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
							right_ear="Friomisi Earring",
							left_ring={ name="Beithir Ring", augments={'Path: A',}},
							back={ name="Belenus's Cape", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%',}},}

	-- Crossbow Weaponskills
	sets.WS["Trueflight"] = {
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck={ name="scout's gorget +1", augments={'Path: A',}},
		waist="Skrymir Cord",
		left_ear="Friomisi Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ring="Weatherspoon ring", --5
		left_ring="Dingir Ring",
		back={ name="Belenus's Cape", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%',}},
	}

	sets.Charm = {}

	sets.TreasureHunter = {
	
	    head="Volte Cap",
		waist="Chaac Belt",
	}
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
	equipSet = {}
	equipSet = Job_Mode_Check(equipSet)
	return equipSet
end
-- Augment basic equipment sets
function midcast_custom(spell)
	equipSet = {}
	equipSet = Job_Mode_Check(equipSet)
	return equipSet
end
-- Augment basic equipment sets
function aftercast_custom(spell)
	equipSet = {}
	equipSet = Job_Mode_Check(equipSet)
	if state.JobMode.value == 'Ranged' and player.status == "Engaged" then
		equipSet = set_combine(equipSet, sets.OffenseMode.Ranged)
	end
	return equipSet
end
--Function is called when the player gains or loses a buff
function buff_change_custom(name,gain)
	equipSet = {}
	if state.JobMode.value == 'Ranged' and player.status == "Engaged" then
		equipSet = set_combine(equipSet, sets.OffenseMode.Ranged)
	end
	equipSet = Job_Mode_Check(equipSet)
	return equipSet
end
--This function is called when a update request the correct equipment set
function choose_set_custom()
	equipSet = {}
	equipSet = Job_Mode_Check(equipSet)
	return equipSet
end
--Function is called when the player changes states
function status_change_custom(new,old)
	equipSet = {}
	if state.JobMode.value == 'Ranged' and new == "Engaged" then
		equipSet = set_combine(equipSet, sets.OffenseMode.Ranged)
	end
	equipSet = Job_Mode_Check(equipSet)
	return equipSet
end

--Function is called when a self command is issued
function self_command_custom(command)
	Smart_Ammo()
end

-- Function is called whn lua is unloaded
function user_file_unload()

end

function check_buff_JA()
	buff = 'None'
	local ja_recasts = windower.ffxi.get_ability_recasts()
	if player.sub_job == 'WAR' then
		if not buffactive['Berserk'] and ja_recasts[1] == 0 then
			buff = "Berserk"
		elseif not buffactive['Aggressor'] and ja_recasts[4] == 0 then
			buff = "Aggressor"
		elseif not buffactive['Warcry'] and ja_recasts[2] == 0 then
			buff = "Warcry"
		end
	end
	return buff
end

function check_buff_SP()
	buff = 'None'
	--local sp_recasts = windower.ffxi.get_spell_recasts()
	return buff
end

function Smart_Ammo ()
	for i = 1, #Ranged_Weapons do
		if state.WeaponMode.value == Ranged_Weapons[i].WeaponMode then
			if state.RAMode.value ~= Ranged_Weapons[i].Type then
				state.RAMode:set(Ranged_Weapons[i].Type)
				windower.add_to_chat(8,'Ammo Mode is ['..state.RAMode.value..']')
				get_sets()
			end
			log('Ammo Mode is ['..state.RAMode.value..']')
			equip({ammo=Ammo.RA})
			return
		end
	end
end

function Job_Mode_Check(equipSet)
	if state.JobMode.value == 'Melee' then
		equipSet = set_combine(equipSet, sets.Weapons.Melee)
	elseif state.JobMode.value == 'Ranged' then
		equipSet = set_combine(equipSet, sets.Weapons.Ranged)
	end
	if DualWield == false then
		if TwoHand == false then
			equipSet = set_combine(equipSet, sets.Weapons.Shield)
		end
	end
	return equipSet
end

function job_precast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Ranged Attack' then
        equip(sets.precast.RA)
    end
end
function job_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Ranged Attack' then
        equip(sets.midcast.RA)
    end
end
function job_aftercast(spell, action, spellMap, eventArgs)
    if player.status == 'Engaged' then
        equip(sets.engaged)
    else
        equip(sets.idle)
    end
end
