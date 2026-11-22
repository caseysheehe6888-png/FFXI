
--Luthien

-- Load and initialize the include file.
include('RahvinGS/GearSets-Include')
include('RahvinGS/Rahvin-Engine')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "20"
MacroBook = "2"
MacroSet = "5"

-- Use "gs c food" to use the specified food item 
Food = "Grape Daifuku"

--Uses Items Automatically
AutoItem = false

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

-- 'TP','ACC','DT' are standard Default modes.  You may add more and assigne equipsets for them ( Idle.X and OffenseMode.X )
state.OffenseMode:options('TP','DT','MEVA') -- ACC effects WS and TP modes

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

--Set default mode (TP,ACC,DT)
state.OffenseMode:set('TP')

--Command to Lock Style and Set the correct macros
jobsetup (LockStylePallet,MacroBook,MacroSet)

BlueNuke = S{'Spectral Floe','Entomb', 'Magic Hammer', 'Tenebral Crush','Embalming Earth','Anvil Lightning'}
BlueACC = S{'Cruel Joke','Dream Flower'}
BlueHealing = S{'Magic Fruit','Healing Breeze','Wild Carrot','Plenilune Embrace'}
BlueSkill = S{'Occultation','Erratic Flutter','Nature\'s Meditation','Cocoon','Barrier Tusk','Matellic Body','Mighty Guard'}
BlueTank = S{}

--Weapons specific to Blue Mage
state.WeaponMode:options('Tizona','TizBron','Naegling','Vampirism','Black Halo','Cleave','Dyna')
state.WeaponMode:set('Tizona')

--Enable JobMode for UI
UI_Name = 'Spells'

--Modes for specific to Blue Mage
state.JobMode:options('Melee','Solo','AoE')
state.JobMode:set('Solo')

gear = gear or {}
gear.da_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}}
gear.stp_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10',}}
--gear.crit_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}
gear.wsd_jse_back = {name="Rosmerta's Cape",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
gear.nuke_jse_back = {name="Rosmerta's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}}
gear.fc_jse_back = {name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}}

function get_sets()

	--Set the weapon options.  This is set below in job customization section

	-- Weapon setup
	sets.Weapons = {}

	sets.Weapons['Tizona'] = {
		main="Tizona",
		--sub={ name="Sakpata's Sword", augments={'Path: A',}},
		sub="Flametongue",
	}

	sets.Weapons['TizBron'] = {
		main="Tizona",
		--sub={ name="Sakpata's Sword", augments={'Path: A',}},
		sub={ name="Thibron", augments={'TP Bonus +1000',}},
	}

	sets.Weapons['Naegling'] = {
		main="Naegling",
		--sub="Zantetsuken",
		sub={ name="Thibron", augments={'TP Bonus +1000',}},
	}

	sets.Weapons['Vampirism'] = {
		main="Vampirism",
		sub="Flametongue",
	}

	sets.Weapons['Black Halo'] = {
	    main="Maxentius",
		sub={ name="Nehushtan", augments={'Accuracy+6 Attack+6','"Fast Cast"+4','STR+17',}}
	}

	sets.Weapons['Cleave'] = {
	    main="Bunzi's Rod",
		sub="Septoptic +1",
	}

sets.Weapons['Dyna'] = {
	    main="Sakpata's Sword",
		sub="Bunzi's Rod",
	}

	sets.Weapons.Shield = {
		sub="Genmei Shield",
	}

	sets.Weapons.Shield = {}
	sets.Weapons.Sleep = {}

	-- Standard Idle set with -DT,Refresh,Regen and movement gear
	sets.Idle = {
		ammo="Staunch Tathlum",
		head={ name="Herculean Helm", augments={'VIT+9','STR+3','"Refresh"+2','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
		body="Hashishin Mintan +3",
		hands="Hashi. Bazu. +3",
		legs={ name="Herculean Trousers", augments={'Accuracy+10','"Fast Cast"+1','"Refresh"+1','Accuracy+20 Attack+20',}},
		feet="Nyame Sollerets",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Carrier's Sash",
		left_ear="Infused Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring="Murky Ring",
		right_ring="Stikini Ring +1",
		back=gear.fc_jse_back,
    }
	
	sets.Idle.TP = set_combine(sets.Idle, {})
	sets.Idle.ACC = set_combine(sets.Idle, {})
	sets.Idle.DT = set_combine(sets.Idle, {})
	sets.Idle.PDL = set_combine(sets.Idle, {})
	sets.Idle.SB = set_combine(sets.Idle, {})
	sets.Idle.Resting = set_combine(sets.Idle, {})
	sets.Idle.MEVA = set_combine(sets.Idle, {
		neck="Warder's Charm +1",
		waist="Carrier's Sash",
	})

	sets.Movement = {
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
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
	sets.Phalanx_Received = {
		head="Prestige Crown",
		body="Prestige Plate.",
		hands="Prestige Gaunt.",
		legs="Prestige Brais",
		feet="Prestige Sab.",}
	sets.Regen_Received = {}
	sets.Refresh_Received = {}
	sets.Waltz_Received = {}
	sets.Holy_Water = {
	    neck="Nicander's Necklace",
	}

	sets.Subtle_Blow = {
		neck="Bathy Choker +1",
		left_ring={ name="Chirich Ring", bag="wardrobe2"},
	}

	sets.OffenseMode = {}
	sets.OffenseMode.AM1 = {}
	sets.OffenseMode.AM2 = {}
	sets.OffenseMode.AM3 = {}

	--sets.OffenseMode.TP = {
	--	ammo={ name="Coiste Bodhar", augments={'Path: A',}},
	--	head={ name="Gleti's Mask", augments={'Path: A',}},
	--	body={ name="Gleti's Cuirass", augments={'Path: A',}},
	--	hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
	--	legs={ name="Gleti's Breeches", augments={'Path: A',}},
	--	feet={ name="Gleti's Boots", augments={'Path: A',}},
	--	waist="Windbuffet Belt +1",
	--	left_ear="Digni. Earring",
	--	right_ear="Telos Earring",
	--	left_ring="Epona's Ring",
	--	right_ring="Lehko's Ring",
	--	back=gear.da_jse_back,
	--}

sets.OffenseMode.TP = {
		ammo="Ginsen",
		head="Adhemar Bonnet +1",
		neck="Mirage Stole +2",
		left_ear="Telos Earring",
		right_ear="Digni. Earring",
		--right_ear= {name="Hashishin Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+10','Mag. Acc.+10',}},
		body="Adhemar Jacket +1",
		hands="Adhemar Wrist. +1",
		legs={ name="Herculean Trousers", augments={'Pet: STR+4','AGI+13','Quadruple Attack +2','Mag. Acc.+8 "Mag.Atk.Bns."+8',}},
		feet="Gleti's Boots",
		ring1="Epona's Ring",
		ring2="Petrov Ring",
		back=gear.da_jse_back,
		waist="Windbuffet Belt +1",
		}

	sets.OffenseMode.DT = set_combine ( sets.OffenseMode.TP, {
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Elite Royal Collar",
		left_ring="Murky Ring",
		right_ring="Chirich Ring",
		back=gear.da_jse_back,
		--back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
		right_ear="Alabaster Earring",
	})

	--sets.OffenseMode.ACC = set_combine ( sets.OffenseMode.DT,{
	--})

	--sets.OffenseMode.PDL = set_combine ( sets.OffenseMode.DT,{
	--})

	sets.OffenseMode.MEVA = set_combine ( sets.OffenseMode.DT,{
		ammo="Amar Cluster",
		head="Malignance Chapeau",
		neck="Null Loop",
		left_ear="Alabaster Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Murky Ring",
		ring2="Ayanmo Ring",
		back=gear.fc_jse_back,
		waist="Svelt. Gouriz +1",
		legs="Malignance Tights",
		feet="Malignance Boots"
})

	sets.OffenseMode.SB = set_combine ( sets.OffenseMode.TP,{
		left_ring={ name="Chirich Ring", bag="wardrobe1", priority=2},
		right_ring={ name="Chirich Ring", bag="wardrobe2", priority=1},
	})

	sets.OffenseMode.AM1['Expiacion'] = set_combine ( sets.OffenseMode.TP,{
		ammo="Ginsen",
		head="Adhemar Bonnet +1",
		neck="Mirage Stole +2",
		left_ear="Telos Earring",
		right_ear="Cessance Earring",
		--right_ear= {name="Hashishin Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+10','Mag. Acc.+10',}},
		body="Adhemar Jacket +1",
		hands="Adhemar Wrist. +1",
		ring1="Epona's Ring",
		ring2="Petrov Ring",
		back=gear.da_jse_back,
		waist="Windbuffet Belt +1",
		legs="Gleti's Breeches",
		feet="Gleti's Boots"
	})
	
	sets.OffenseMode.AM2['Expiacion'] = set_combine ( sets.OffenseMode.TP,{
		ammo="Ginsen",
		head="Adhemar Bonnet +1",
		neck="Mirage Stole +2",
		left_ear="Telos Earring",
		right_ear="Cessance Earring",
		--right_ear= {name="Hashishin Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+10','Mag. Acc.+10',}},
		body="Adhemar Jacket +1",
		hands="Adhemar Wrist. +1",
		ring1="Epona's Ring",
		ring2="Petrov Ring",
		back=gear.da_jse_back,
		waist="Windbuffet Belt +1",
		legs="Gleti's Breeches",
		feet="Gleti's Boots"
	})
	
	sets.OffenseMode.AM3['Expiacion'] = set_combine ( sets.OffenseMode.TP,{
		ammo="Coiste Bodhar",         -- STP +3, Multi-attack stats
		head="Malignance Chapeau",    -- STP +8, DT-6%
		neck="Mirage Stole +2",       -- STP +7, Regain +25
		left_ear="Dedition Earring",  -- STP +8, Enmity -4
		right_ear="Telos Earring",    -- STP +5, Accuracy +10 
		body="Malignance Tabard",     -- STP +11, DT-9%
		hands="Malignance Gloves",    -- STP +12, DT-5%
		ring1="Chirich Ring",         -- STP +6, Accuracy +10
		ring2="Petrov Ring",     	  -- STP +6, Accuracy +10 (or Chirich Ring +1 / Rajas Ring)
		back=gear.stp_jse_back,       -- STP +10 (Your custom Rosmerta's Cape!)
		waist="Kentarch Belt +1",     -- STP +5, Haste +5% 
		legs="Malignance Tights",     -- STP +10, DT-7%
		feet="Malignance Boots"       -- STP +9, DT-4%
})
	
	sets.DualWield = {
		left_ear="Eabani Earring",
		waist="Reiki Yotai",
	}

	sets.Precast = {}

	-- Used for Magic Spells
	-- 10% FC from sword
	sets.Precast.FastCast = {
		--ammo="Impatiens", -- Quick Magic 2
		ammo="Amar Cluster", -- Quick Magic 2
		head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}}, --14
		body="Hashishin Mintan +3", -- 9
		hands="Hashi. Bazu. +3", -- 8
		legs="Aya. Cosciales +2", --6
		--feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}}, --8
		neck="Voltsurge Torque", -- 4
		waist="Witful Belt", -- Quick Magic 3
		left_ear="Etiolation Earring", --1
		right_ear="Loquac. Earring", --2
		left_ring="Lebeche Ring", -- Quick Magic 2
		right_ring="Prolix Ring", --2 
		back=gear.fc_jse_back,
	} -- 79 and 10% Quick Magic

	sets.Precast.BlueMagic = set_combine (sets.Precast.FastCast, {
		body="Hashishin Mintan +3", -- 16
	})

	-- Job Abilities
	sets.JA = {}
	sets.JA["Azure Lore"] = {}
	sets.JA["Chain Affinity"] = {}
	sets.JA["Burst Affinity"] = {}
	sets.JA["Diffusion"] = {}
	sets.JA["Efflux"] = {}
	sets.JA["Unbridled Learning"] = {}
	sets.JA["Unbridled Wisdom"] = {}

	-- Dancer JA Section

	sets.Flourish = set_combine(sets.Idle.DT, {})
	sets.Jig = set_combine(sets.Idle.DT, { })
	sets.Step = set_combine(sets.OffenseMode.DT, {})
	sets.Samba = set_combine(sets.Idle.DT, {})
	sets.Waltz = set_combine(sets.OffenseMode.DT, {
		--body="Gleti's Cuirass", -- 10
		body="Passion Jacket", -- 13
		legs="Dashing Subligar", -- 10
	}) -- 33% Potency


	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {})

	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = { --Total = 15 merits + 84 gear = 99 - Cap is 105
		ammo="Staunch Tathlum", -- 11
		hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}, --11
		legs="Carmine Cuisses +1", -- 20
		feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}, --16
		waist="Rumination Sash", --10
	}

	-- Cure Set
	sets.Midcast.Cure = {
		ammo="Staunch Tathlum",
		--head={ name="Nyame Helm", augments={'Path: B',}},
		body="Pinga Tunic",
		--hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
		hands="Hashi. Bazu. +3",
		legs="Pinga Pants",
		feet="Egbesu Clogs",
		--feet={ name="Medium's Sabots", augments={'MP+50','MND+10','"Conserve MP"+7','"Cure" potency +5%',}},
		--neck="Incanter's Torque",
		waist="Gishdubar Sash",
		left_ear="Mendi. Earring",
		right_ear= {name="Hashishin Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+10','Mag. Acc.+10',}},
		left_ring="Lebeche Ring",
		--right_ring="Menelaus's Ring",
		back=gear.nuke_jse_back,
	
		}

	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {}

	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {
		--left_ring={ name="Stikini Ring +1", bag="wardrobe2"},
		right_ring={ name="Stikini Ring +1", bag="wardrobe3"},
		waist="Siegel Sash",
		neck="Nodens Gorget",
	})

    sets.Midcast["Refresh"] = set_combine(sets.Midcast.Enhancing, {
		head="Amalric Coif +1",
		waist="Gishdubar Sash",
	})

    sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, {
		head="Amalric Coif +1",
	})

	sets.Midcast["Feather Tickle"] = set_combine(sets.Midcast.Enhancing, {
		ammo="Pemphredo Tathlum",
		head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
		body="Hashishin Mintan +3",
		hands="Hashi. Bazu. +3",
		legs="Hashishin Tayt +3",
		feet="Hashi. Basmak +3",
		neck="Null Loop",
		waist="Null Belt",
		left_ear="Regal Earring",
		right_ear= {name="Hashishin Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+10','Mag. Acc.+10',}},
		left_ring="Stikini Ring +1",
		right_ring="Prolix Ring",
		back=gear.nuke_jse_back,
	})

	sets.Midcast["Reaving Wind"] = set_combine(sets.Midcast.Enhancing, {
		ammo="Pemphredo Tathlum",
		head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
		body="Hashishin Mintan +3",
		hands="Hashi. Bazu. +3",
		legs="Hashishin Tayt +3",
		feet="Hashi. Basmak +3",
		neck="Null Loop",
		waist="Null Belt",
		left_ear="Regal Earring",
		right_ear= {name="Hashishin Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+10','Mag. Acc.+10',}},
		left_ring="Stikini Ring +1",
		right_ring="Prolix Ring",
		back=gear.nuke_jse_back,
	})

	sets.Midcast["Cruel Joke"] = set_combine(sets.Midcast.Enhancing, {
		ammo="Pemphredo Tathlum",
		head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
		body="Hashishin Mintan +3",
		hands="Hashi. Bazu. +3",
		legs="Hashishin Tayt +3",
		feet="Hashi. Basmak +3",
		neck="Null Loop",
		waist="Null Belt",
		left_ear="Regal Earring",
		right_ear= {name="Hashishin Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+10','Mag. Acc.+10',}},
		left_ring="Stikini Ring +1",
		right_ring="Prolix Ring",
		back=gear.nuke_jse_back,
	})

	sets.Midcast['Entomb'] = set_combine(sets.Midcast.Nuke, {
		neck="Quanpur Necklace",
	})

	sets.Midcast.Nuke = {
		ammo="Pemphredo Tathlum",
		head="Hashishin Kavuk +3",
		body="Hashishin Mintan +3",
		hands="Hashi. Bazu. +3",
		legs="Hashishin Tayt +3",
		feet="Hashi. Basmak +3",
		neck="Sanctity Necklace",
		waist="Orpheus's Sash",
		left_ear="Regal Earring",
		right_ear="Friomisi Earring",
		left_ring="Shiva Ring +1",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back=gear.nuke_jse_back,
	}

	-- Base Blue Magic midcast set defaults to SIRD for unmapped spells
	sets.Midcast.BlueMagic = set_combine(sets.Midcast.SIRD, {})

	sets.Midcast.BlueMagic.Skill = set_combine(sets.Midcast.SIRD, {})
	sets.Midcast.BlueMagic.Nuke = set_combine(sets.Midcast.Nuke, {}) 
	sets.Midcast.BlueMagic.Healing = set_combine(sets.Midcast.Cure, {})
	sets.Midcast.BlueMagic.Enmity = set_combine(sets.Enmity, {})
	sets.Midcast.BlueMagic.ACC = set_combine(sets.Idle, {
		ammo="Pemphredo Tathlum",
		head="Hashishin Kavuk +3",
		body="Hashishin Mintan +3",
		hands="Hashi. Bazu. +3",
		legs="Hashishin Tayt +3",
		feet="Hashi. Basmak +3",
		neck="Null Loop",
		waist="Null Belt",
		left_ear="Regal Earring",
		right_ear= {name="Hashishin Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+10','Mag. Acc.+10',}},
		left_ring="Stikini Ring +1",
		right_ring="Prolix Ring",
		back="Null Shawl",
	})

	sets.WS = {
    ammo="Aurgelmir Orb",
	ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Hashishin Kavuk +3",
    body="Assim. Jubbah +4",
    hands="Jhakri Cuffs +2",
    legs="Luh. Shalwar +4",
    feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Sroda Ring",
    back=gear.wsd_jse_back,
}

	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}

	-- This will augement the WS sets when in the Subtle Blow statnce
	sets.WS.SB = sets.Subtle_Blow

	sets.WS['Black Halo'] ={
    ammo="Aurgelmir Orb",
	ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Hashishin Kavuk +3",
    body="Assim. Jubbah +4",
    hands="Jhakri Cuffs +2",
    legs="Luh. Shalwar +4",
    feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Sroda Ring",
    back=gear.wsd_jse_back,
}

	sets.WS['Expiacion'] =  {
    ammo="Aurgelmir Orb",
	ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Hashishin Kavuk +3",
    body="Assim. Jubbah +4",
    hands="Jhakri Cuffs +2",
    legs="Luh. Shalwar +4",
    feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Sroda Ring",
    back=gear.wsd_jse_back,
}

	sets.WS['Chant du Cygne'] =  {
    ammo="Aurgelmir Orb",
	ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Hashishin Kavuk +3",
    body="Assim. Jubbah +4",
    hands="Jhakri Cuffs +2",
    legs="Luh. Shalwar +4",
    feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Sroda Ring",
    back=gear.wsd_jse_back,
}

	-- Note that the Mote library will unlock these gear spots when used.
	sets.TreasureHunter = {
		waist="Chaac Belt",
		hands="Volte Bracers",
		legs="Volte Hose",
		ammo="Per. Lucky Egg",
	}

	sets.Diffusion = {
	    feet={ name="Luhlaza Charuqs +2", augments={'Enhances "Diffusion" effect',}},
	}
	sets.ChainAffinity = {
		head="Luhlaza Keffiyeh +1",
	}

	sets.BurstAffinity = {
		feet="Hashishin Basmak +3",
	}

	sets.Efflux = {
		legs="Hashishin Tayt +3",
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
	if spell.type == 'WeaponSkill' then
		if state.OffenseMode.value == "MEVA" then
			equipSet = set_combine(equipSet, { neck="Warder's Charm +1", })
		end
	end
	return equipSet
end
-- Augment basic equipment sets
function midcast_custom(spell)
	equipSet = {}

	return equipSet
end
-- Augment basic equipment sets
function aftercast_custom(spell)
	equipSet = {}

	return equipSet
end
--Function is called when the player gains or loses a buff
function buff_change_custom(name,gain)
	equipSet = {}

	return equipSet
end
--This function is called when a update request the correct equipment set
--This function is called when a update request the correct equipment set
function choose_set_custom()
	equipSet = {}

	-- Check if you are in an engaged/melee status
	if player.status == 'Engaged' then
		-- Determine the active Aftermath tier
		local am_tier = nil
		if buffactive['Aftermath: Lv.1'] then
			am_tier = 'AM1'
		elseif buffactive['Aftermath: Lv.2'] then
			am_tier = 'AM2'
		elseif buffactive['Aftermath: Lv.3'] then
			am_tier = 'AM3'
		end

		-- If an Aftermath tier is active, attempt to layer the gear
		if am_tier then
			-- 1. Check if a specific Weapon Skill set exists for this tier (e.g., sets.OffenseMode.AM3['Expiacion'])
			if sets.OffenseMode[am_tier] and sets.OffenseMode[am_tier]['Expiacion'] then
				equipSet = set_combine(equipSet, sets.OffenseMode[am_tier]['Expiacion'])
			-- 2. Fallback to a generic tier set if it exists but isn't tied to a specific WS
			elseif sets.OffenseMode[am_tier] and not sets.OffenseMode[am_tier]['Expiacion'] then
				equipSet = set_combine(equipSet, sets.OffenseMode[am_tier])
			end
		end
	end

	return equipSet
end
--function choose_set_custom()
--	equipSet = {}
--
--	return equipSet
--end
--Function is called when the player changes states
function status_change_custom(new,old)
	equipSet = {}

	return equipSet
end

--Function is called when a self command is issued
function self_command_custom(command)
    if command == 'jobmode' then
        if state.JobMode.value == 'Solo' then
            send_command('input //aset spellset solo;input /macro book 2;wait .1;input /macro set 5')
        elseif state.JobMode.value == 'Melee' then
            send_command('input //aset spellset tp;input /macro book 2;wait .1;input /macro set 5')
        elseif state.JobMode.value == 'AoE' then
            send_command('input //aset spellset magic;input /macro book ;wait .1;input /macro set 5')
        end
    end
end

-- Function is called when the job lua is unloaded
function user_file_unload()

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