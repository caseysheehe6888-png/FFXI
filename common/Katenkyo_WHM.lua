--Yavanna

-- Load and initialize the include file.
include('RahvinGS/GearSets-Include')
include('RahvinGS/Rahvin-Engine')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "82"
MacroBook = "4"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Miso Ramen"

--Uses Items Automatically
AutoItem = false

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

-- 'TP','ACC','DT' are standard Default modes.  You may add more and assigne equipsets for them ( Idle.X and OffenseMode.X )
state.OffenseMode:options('TP','ACC','DT','MEVA')
state.OffenseMode:set('DT')

-- Set to true to run organizer on job changes
Organizer = false

--Weapons options
state.WeaponMode:options('Pandit','Black Halo','DD','Zeni')
state.WeaponMode:set('Pandit')

--Command to Lock Style and Set the correct macros
jobsetup (LockStylePallet,MacroBook,MacroSet)

-- Balance 2100 HP / 1500 MP
function get_sets()

	-- Weapon setup
	sets.Weapons = {}
	
	sets.Weapons['Pandit'] = {
		main="Pandit's Staff",
		sub="Mensch Strap +1",
	}

	--sets.Weapons['Seraph Strike'] = {
	--	main="Daybreak",
	--}

	sets.Weapons['Black Halo'] = {
		main="Ajja Rod",
		--main="Maxentius",
		--sub="C. Palug Hammer",
	}

	sets.Weapons['DD'] = {
		main="Yagrush",
		sub="Magesmasher +1",
		--sub="Ames",
		sub="Ammurapi Shield",
	}
	
	--sets.Weapons['Zeni'] = {
	--	main="Pandit's Staff",
	--	sub="Mensch Strap +1",
	--	range="Soultrapper 2000",
	--	ammo="H.S. Soul Plate",
	--}

	--sets.Weapons['Asclepius'] = {
	--	main="Asclepius",
	--}


	sets.Weapons.Shield = {
		--sub="Genmei Shield",
		sub="Ammurapi Shield",
	}

	sets.Weapons.Sleep ={
		main="Prime Maul",
		sub="Ames",
	}

	-- Standard Idle set with -DT,Refresh,Regen and movement gear
	sets.Idle = {
    --main="Pandit's Staff",
    --sub="Giuoco Grip",
    ammo="Staunch Tathlum",
    head="Bunzi's Hat",
    body="Ebers Bliaut +3",
    hands="Ebers Mitts +2",
    legs="Ebers Pant. +3",
    feet={ name="Chironic Slippers", augments={'CHR+4','Pet: Haste+1','"Refresh"+2','Mag. Acc.+5 "Mag.Atk.Bns."+5',}},
    neck="Warder's Charm +1",
    waist="Null Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Glorious Earring",
    left_ring="Murky Ring",
    right_ring="Mephitas's Ring +1",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},
}

	-- 'TP','PDL','ACC','DT','PDT','MEVA'
	sets.Idle.TP = set_combine(sets.Idle, {})
	sets.Idle.ACC = set_combine(sets.Idle, {})
	sets.Idle.DT = set_combine(sets.Idle, {})
	sets.Idle.MEVA = set_combine(sets.Idle, {
		neck="Warder's Charm +1",
		waist="Carrier's Sash",
	})
	-- Set is only applied when sublimation is charging
	sets.Idle.Sublimation = set_combine(sets.Idle, {
	    waist="Embla Sash", -- +3 Submlimation when active
	})
	-- Set to swap out when MP is low
	sets.Idle.Refresh = set_combine(sets.Idle, {
    main="Pandit's Staff",
    sub="Giuoco Grip",
    ammo="Staunch Tathlum",
    head={ name="Chironic Hat", augments={'INT+14','Chance of successful block +1','"Refresh"+1','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    --head="Inyanga Tiara +2",
	body="Ebers Bliaut +3",
    --hands="Inyan. Dastanas +2",
    hands={ name="Chironic Gloves", augments={'Mag. Acc.+4 "Mag.Atk.Bns."+4','Mag. Acc.+20','"Refresh"+1','Accuracy+13 Attack+13',}},
	legs="Ebers Pant. +3",
    feet={ name="Chironic Slippers", augments={'CHR+4','Pet: Haste+1','"Refresh"+2','Mag. Acc.+5 "Mag.Atk.Bns."+5',}},
	--feet="Inyan. Crackows +2",
    neck="Loricate Torque +1",
    waist="Shinjutsu-no-Obi +1",
    left_ear="Odnowa Earring +1",
    right_ear="Glorious Earring",
    left_ring="Lebeche Ring",
    right_ring="Mephitas's Ring +1",
    back="Solemnity Cape",
})
	sets.Idle.Resting = set_combine(sets.Idle, {})

	-- Movement Gear
	sets.Movement = {
		--feet="Crier's Gaiters",
		right_ring="Shneddick Ring",
	}

	-- Set to be used if you get 
	sets.Cure_Received = {}
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

	sets.OffenseMode =  {
		ammo="Hasty Pinion +1",
		head="Bunzi's Hat",
		neck="Lissome Necklace",
		ear1="Suppanomimi",
		ear2="Cessance Earring",
		body="Ayanmo Corazza +2",
		hands="Bunzi's Gloves",
		ring1="Petrov Ring",
		ring2="Chirich Ring",
		back="Null Shawl",
		waist="Goading Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
}

	sets.OffenseMode.TP = set_combine(sets.OffenseMode,{
		ammo="Hasty Pinion +1",
		head="Bunzi's Hat",
		neck="Lissome Necklace",
		ear1="Suppanomimi",
		ear2="Cessance Earring",
		body="Ayanmo Corazza +2",
		hands="Bunzi's Gloves",
		ring1="Petrov Ring",
		ring2="Chirich Ring",
		back="Null Shawl",
		waist="Goading Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	})
	
	sets.OffenseMode.DT = set_combine(sets.OffenseMode,{
	    ammo="Staunch Tathlum",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Sanctity Necklace",
		waist="Null Belt",
		right_ear={ name="Ebers Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Damage taken-4%',}},
		left_ear="Digni. Earring",
		left_ring="Murky Ring",
		right_ring="Chirich Ring",
		back={ name="Alaunus's Cape", augments={'DEX+30','Accuracy+20 Attack+20','Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	})
	
	--sets.OffenseMode.ACC = set_combine(sets.OffenseMode,{ })
	--sets.OffenseMode.PDT = set_combine(sets.OffenseMode, { })
	--sets.OffenseMode.MEVA = set_combine(sets.OffenseMode, { })

	sets.Precast = {}

	-- Used for Magic Spells (Cap 80%)
	sets.Precast.FastCast = {
	--main="Pandit's Staff",
    --sub="Giuoco Grip",
    ammo="Incantor Stone",
    head="Ebers Cap +2",
    body="Inyanga Jubbah +2",
    hands="Gende. Gages +1",
    legs="Aya. Cosciales +2",
    feet="Regal Pumps +1",
    neck="Aceso's Choker +1",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Magnetic Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+5','"Fast Cast"+10',}},
	} -- 81%

	-- Cap is 10% Quick Magic - used for Raises and Cures
	sets.Precast.QuickMagic = set_combine(sets.Precast.FastCast, {
		ammo="Impatiens", -- 2
		--left_ring="Weather. Ring", -- 3
		right_ring="Lebeche Ring", -- 2
		waist="Witful Belt", -- 3
	})

	-- Used for Cure cast
	sets.Precast.Cure = set_combine(sets.Precast.FastCast, sets.Precast.QuickMagic)

	-- Used for Enhancing cast
	sets.Precast.Enhancing = set_combine(sets.Precast.FastCast, sets.Precast.QuickMagic,  {

	})

	-- Job Abilities
	sets.JA = {}
	sets.JA["Benediction"] = {
		body={ name="Piety Bliaut +4", augments={'Enhances "Benediction" effect',}},
	}
	sets.JA["Divine Seal"] = {}
	sets.JA["Convert"] = {}
	sets.JA["Devotion"] = {
	    head={ name="Piety Cap +4", augments={'Enhances "Devotion" effect',}},
	}
	sets.JA["Afflatus Solace"] = {}
	sets.JA["Afflatus Misery"] = {}
	sets.JA["Sacrosanctity"] = {}
	sets.JA["Asylum"] = {}


	-- ===================================================================================================================
	--		sets.midcast
	-- ===================================================================================================================

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {
	
	})

	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {}

	-- Cure Set
	sets.Midcast.Cure = {
	main="Pandit's Staff",  --20
    sub="Giuoco Grip",
    ammo="Staunch Tathlum",
    head={ name="Kaykaus Mitra +1", augments={'MP+80','Spell interruption rate down +12%','"Cure" spellcasting time -7%',}},
    body="Theo. Bliaut +4", --8
    hands="Theophany Mitts +4",
    legs="Ebers Pant. +3",
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
    left_ear="Glorious Earring",  --5
    right_ear="Magnetic Earring",
    left_ring="Lebeche Ring",  --5
	--left_ring="Janniston Ring",
    right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
	back="Thauma. Cape",  --10
    --back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+5','"Fast Cast"+10',}},
    }
	-- For AoE cure
	sets.Midcast.Curaga = set_combine(sets.Midcast.Cure, 
	{
		body="Theo. Bliaut +4",
	    left_ring="Murky Ring",
	})

	-- For Cura - foucs on DT
	sets.Midcast.Cura = set_combine(sets.Midcast.Cure, {body="Theo. Bliaut +4",})

	-- Enhancing Skill

	-- Used for base duration
	sets.Midcast.Enhancing = {
		--main={ name="Gada", augments={'Enh. Mag. eff. dur. +5','MND+5','Mag. Acc.+3','"Mag.Atk.Bns."+20',}},
		main="Beneficus",
		sub={ name="Ammurapi Shield", priority=3},
		ammo="Hydrocera",
	    head={ name="Telchine Cap", augments={'Mag. Evasion+25','"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
        body={ name="Telchine Chas.", augments={'Mag. Evasion+25','"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
        hands={ name="Telchine Gloves", augments={'Mag. Evasion+25','"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
        legs={ name="Telchine Braconi", augments={'Mag. Evasion+25','"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
		feet="Theo. Duckbills +4",
		--neck="Incanter's Torque",
		neck="Imbodla Necklace",
		waist="Embla Sash",
		left_ear={ name="Etiolation Earring", priority=1},
		right_ear="Mimir Earring",
		left_ring={ name="Stikini Ring +1", bag="wardrobe1"},
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=2},
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Haste+10','Damage taken-5%',}},
	}
	sets.Midcast.Enhancing.Others = set_combine(sets.Midcast.Enhancing, {
	
	});

	--'Barfire','Barblizzard','Baraero','Barstone','Barthunder','Barwater','Barfira','Barblizzara','Baraera','Barstonra','Barthundra','Barwatera'
	sets.Midcast.Enhancing.Elemental = set_combine(sets.Midcast.Enhancing, {
	    main="Beneficus",
		head="Ebers Cap +2",
		body="Ebers Bliaut +3",
		hands="Ebers Mitts +2",
		left_ear="Andoaa Earring",
		right_ring={ name="Stikini Ring +1", bag="wardrobe2"},
		legs="Piety Panta. +4",
		feet="Ebers Duckbills +3",
	})

	--'Barsleepra','Barpoisonra','Barparalyzra','Barblindra','Barvira','Barpetra','Baramnesra','Barsilencera','Barsleep','Barpoison','Barparalyze','Barblind','Barvirus','Barpetrify','Baramnesia','Barsilence'
	sets.Midcast.Enhancing.Status = set_combine(sets.Midcast.Enhancing, {
	    main="Beneficus",
		head="Ebers Cap +2",
		body="Ebers Bliaut +3",
		hands="Ebers Mitts +2",
		left_ear="Andoaa Earring",
		right_ring={ name="Stikini Ring +1", bag="wardrobe2"},
		legs="Piety Panta. +4",
		feet="Ebers Duckbills +3",
	})

	--'Temper','Temper II','Enaero','Enstone','Enthunder','Enwater','Enfire','Enblizzard','Boost-STR','Boost-DEX','Boost-VIT','Boost-AGI','Boost-INT','Boost-MND','Boost-CHR'
	sets.Midcast.Enhancing.Skill = set_combine(sets.Midcast.Enhancing, {
	    hands="Inyan. Dastanas +2",
		right_ring={ name="Stikini Ring +1", bag="wardrobe2"},
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=1},
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Haste+10','Damage taken-5%',}},
	})

	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {
		main="Maxentius",
		sub="Ammurapi Shield",
		ammo="Hydrocera",
		head="Theophany Cap +4",
		body="Theo. Bliaut +4",
		hands="Ebers Mitts +2",
		--legs={ name="Chironic Hose", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Drain" and "Aspir" potency +8','MND+1','Mag. Acc.+12',}},
		legs="Adhara Seraweels",
		feet="Theo. Duckbills +4",
		--neck="Erra Pendant",
		--waist={ name="Obstin. Sash", augments={'Path: A',}},
		waist="Null Belt",
		--left_ear="Regal Earring",
		left_ear="Digni. Earring",
		--right_ear="Malignance Earring",
		right_ear="Gwati Earring",
		left_ring="Kishar Ring",
		right_ring="Sangoma Ring",
		--right_ring={ name="Stikini Ring +1", bag="wardrobe2"},
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Haste+10','Damage taken-5%',}},
	}

	sets.Midcast.Dark = set_combine(sets.Midcast.Enfeebling, {

	})

	sets.Midcast.Dark.MACC = set_combine(sets.Midcast.Enfeebling.MACC, {

	})

	sets.Midcast.Dark.Absorb = set_combine(sets.Midcast.Enfeebling, {

	})

	sets.Midcast["Cursna"] = {
	main="Yagrush",
	--main="Beneficus",
    sub="Ammurapi Shield",
    ammo="Hasty Pinion +1",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Ebers Bliaut +3",
     hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +8','"Conserve MP"+5','"Fast Cast"+5',}},
	--hands={ name="Fanatic Gloves", augments={'MP+45','Healing magic skill +9','"Conserve MP"+6','"Fast Cast"+5',}},
    legs="Theo. Pant. +4",
    feet="Regal Pumps +1",
    neck="Debilis Medallion",
    --waist="Bishop's Sash",
	waist="Witful Belt",
    left_ear="Meili Earring",
    right_ear={ name="Ebers Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Damage taken-4%',}},
    left_ring="Haoma's Ring",
    right_ring="Menelaus's Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+5','"Fast Cast"+10',}},
	}

	sets.Midcast["Erase"] = set_combine(sets.Midcast, {
		main="Yagrush",
		neck={ name="Clr. Torque +2", augments={'Path: A',}},
	})

	sets.Midcast["Esuna"] = set_combine(sets.Midcast, {
		--main="Asclepius",
		main="Pandit's Staff",
	})

	sets.Midcast["Silena"] = set_combine(sets.Midcast, {
		hands="Ebers Mitts +2",
		main="Yagrush",
		--main="Pandit's Staff",
	})

	sets.Midcast["Poisona"] = set_combine(sets.Midcast, {
		hands="Ebers Mitts +2",
		main="Yagrush",
		--main="Pandit's Staff",
	})

	sets.Midcast["Paralyna"] = set_combine(sets.Midcast, {
		hands="Ebers Mitts +2",
		main="Yagrush",
		--main="Pandit's Staff",
	})

	sets.Midcast["Stona"] = set_combine(sets.Midcast, {
		hands="Ebers Mitts +2",
		main="Yagrush",
		--main="Pandit's Staff",
	})

	sets.Midcast["Blindna"] = set_combine(sets.Midcast, {
		hands="Ebers Mitts +2",
		main="Yagrush"
		--main="Pandit's Staff",
		})

	sets.Midcast["Viruna"] = set_combine(sets.Midcast, {
		hands="Ebers Mitts +2",
		main="Yagrush",
		--main="Pandit's Staff",
	})

	sets.Midcast["Auspice"] = set_combine(sets.Midcast, {
		feet="Ebers Duckbills +3",
	})

	sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, {
		hands="Regal Cuffs",
	})

	-- Regen Set
	sets.Midcast.Regen = {
		main="Bolelabunga",
		sub="Ammurapi Shield",
		ammo="Hydrocera",
		head="Inyanga Tiara +2",
		body={ name="Piety Bliaut +4", augments={'Enhances "Benediction" effect',}},
		hands="Ebers Mitts +2",
		legs="Theo. Pant. +4",
		feet="Theo. Duckbills +4",
		neck={ name="Clr. Torque +2", augments={'Path: A',}},
		waist="Embla Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Etiolation Earring",
		left_ring={ name="Stikini Ring +1", bag="wardrobe1"},
		right_ring={ name="Stikini Ring +1", bag="wardrobe2"},
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Haste+10','Damage taken-5%',}},
	}

	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = {
		left_ear="Earthcry Earring",
		waist="Siegel Sash",
		neck="Nodens Gorget",
	}

	sets.Midcast.Refresh = {}

	-- ===================================================================================================================
	--		sets.aftercast
	-- ===================================================================================================================

	sets.WS = {
	    ammo="Oshasha's Treatise",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		left_ring="Petrov Ring",
		right_ring="Epaminondas's Ring",
		back={ name="Alaunus's Cape", augments={'DEX+30','Accuracy+20 Attack+20','Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}

	-- Note that the Mote library will unlock these gear spots when used.
	sets.TreasureHunter = {}

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
	if not buffactive['Afflatus Solace'] and not buffactive['Afflatus Misery'] then
		add_to_chat(8,'You are not in a stance')
	end
	return equipSet
end
--Function is called when the player gains or loses a buff
function buff_change_custom(name,gain)
	local equipSet = {}

	return equipSet
end
--This function is called when a update request the correct equipment set
function choose_set_custom()
	local equipSet = {}

	return equipSet
end
--Function is called when the player changes states
function status_change_custom(new,old)
	local equipSet = {}

	return equipSet
end
--Function is called when a self command is issued
function self_command_custom(command)

end
-- Function is called when the job lua is unloaded
function user_file_unload()

end

function pet_change_custom(pet,gain)
	local equipSet = {}
	
	return equipSet
end

function pet_aftercast_custom(spell)
	local equipSet = {}

	return equipSet
end

function pet_midcast_custom(spell)
	local equipSet = {}

	return equipSet
end