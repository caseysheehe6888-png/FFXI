--Relyk

-- Load and initialize the include file.
include('RahvinGS/GearSets-Include')
include('RahvinGS/Rahvin-Engine')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "139"
MacroBook = "5"  -- Sub Job macro pallets can be defined in the sub_job_change_custom function below
MacroSet = "2"

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"

--Uses Items Automatically
AutoItem = false

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

-- Set to true to run organizer on job changes
Organizer = false

-- Add CRIT the base modes to allow AM3 Critical Builds
state.OffenseMode:options('TP','DT','ACC','CRIT','PDL')
state.OffenseMode:set('TP')

--Modes for specific to Corsair
state.WeaponMode:options('Death Penalty','Fomalhaut','Savage Blade','Evisceration','Aeolian Edge','D.I.','SingleHand','Cooking')
state.WeaponMode:set('Death Penalty')

--Enable JobMode for UI.
UI_Name = 'TP Mode'

--Melee or Ranged Mode
state.JobMode:options('Melee','Ranged','Cooking')
state.JobMode:set('Melee')

elemental_ws = S{'Aeolian Edge', 'Leaden Salute', 'Wildfire','Earth Shot','Ice Shot','Water Shot','Fire Shot','Wind Shot','Thunder Shot'}

-- load addons
--send_command('lua l autocor')

-- Initialize Player
jobsetup (LockStylePallet,MacroBook,MacroSet)

-- Threshold for Ammunition Warning
Ammo_Warning_Limit = 99

function get_sets()

	--Set the weapon options.  This is set below in job customization section

	-- Weapon setup
	sets.Weapons = {}

	sets.Weapons['Savage Blade'] = {
		main="Naegling",
	sub="Gleti's Knife",
		--range={ name="Fomalhaut", augments={'Path: A',}},
		range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},
	}

	sets.Weapons['Evisceration'] = {
		main="Tauret",
		sub="Gleti's Knife",
		range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},
	}

	sets.Weapons['Fomalhaut'] = {
		main="Tauret",
		sub="Gleti's Knife",
		--range={ name="Fomalhaut", augments={'Path: A',}},
		range="Armageddon",
	}

	sets.Weapons['Death Penalty'] = {
		main="Naegling",
		--main={ name="Rostam", augments={'Path: A'}, bag="Wardrobe 4"},
		sub="Tauret",
		range="Death Penalty",
		--range={ name="Death Penalty", augments={'Path: A',}},
	}

	sets.Weapons['Aeolian Edge'] = {
		ammo=Ammo.Bullet.MAG_WS,
		--main={ name="Rostam", augments={'Path: A'}, bag="Wardrobe 4"},
		main="Tauret",
		sub="Naegling",
		range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},
	}

	sets.Weapons['D.I.'] = {
		main={ name="Gleti's Knife",
		sub="Voluspa Knife",
		range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},
	}}

	sets.Weapons['SingleHand'] = {
		main={ name="Rostam", augments={'Path: C',}},
		sub={ name="Nusku Shield", priority=1},
		range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},
	}
	
	sets.Weapons['Cooking'] = {
		main="Debahocho +1",
	}	
		
	--sets.Weapons.Melee = {
		--sub="Blurred Knife +1",
	--}

	--sets.Weapons.Ranged = {
		--sub={ name="Kustawi +1", augments={'Path: A',}},
	--}

	sets.Weapons.Shield = {
		sub={ name="Nusku Shield", priority=1},
	}

	sets.Weapons.Sleep = {
		--range="Earp",
	}

	-- Ammo Selection
	Ammo.Bullet.RA = "Devastating Bullet"		-- TP Ammo
	Ammo.Bullet.WS = "Devastating Bullet"		-- Physical Weaponskills
	Ammo.Bullet.CRIT = "Devastating Bullet"		-- Critical Hit Mode
	Ammo.Bullet.PDL = "Devastating Bullet"		-- Physical Damage Mode
	Ammo.Bullet.SB = "Devastating Bullet"		-- Subtle Blow Mode
	Ammo.Bullet.MAB = "Living Bullet" 			-- Magical Weaponskills
	Ammo.Bullet.MACC = "Devastating Bullet"		-- Magic Accuracy
	Ammo.Bullet.QD = "Hauksbok Bullet"			-- Quick Draw
	Ammo.Bullet.MAG_WS = "Living Bullet"		-- Magic Weapon Skills

-- Ammo Selection -- above sets.Weapons, which reads Ammo.Bullet.MAG_WS
	--Ammo.Bullet.RA = "Chrono Bullet"  -- TP Ammo
	--Ammo.Bullet.WS = "Chrono Bullet"  -- Physical Weaponskills
	--Ammo.Bullet.CRIT = "Chrono Bullet" -- Critical Hit Mode
	--Ammo.Bullet.PDL = "Chrono Bullet" -- Physical Damage Mode
	--Ammo.Bullet.SB = "Chrono Bullet"  -- Subtle Blow Mode
	--Ammo.Bullet.MAB = "Living Bullet" -- Magical Weaponskills
	--Ammo.Bullet.MACC = "Chrono Bullet" -- Magic Accuracy
	--Ammo.Bullet.QD = "Hauksbok Bullet" -- Quick Draw
	--Ammo.Bullet.MAG_WS = "Living Bullet" -- Magic Weapon Skills

	-- Standard Idle set with -DT,Refresh,Regen with NO movement gear
	sets.Idle = {
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Nyame Gauntlets",
		legs="Chas. Culottes +3",
		feet="Nyame Sollerets",
		neck="Loricate Torque +1",
		waist="Windbuffet Belt +1",
		left_ear="Odnowa Earring +1",
		right_ear="Alabaster Earring",
		left_ring="Murky Ring",
		right_ring="Epona's Ring",
		back="Null Shawl",
    }
    sets.Idle.TP = set_combine(sets.Idle, {})
	sets.Idle.ACC = set_combine(sets.Idle, {})
	sets.Idle.DT = set_combine(sets.Idle, {})
	sets.Idle.PDL = set_combine(sets.Idle, {})
	sets.Idle.SB = set_combine(sets.Idle, {})
	sets.Idle.MEVA = set_combine(sets.Idle, {})

	sets.Movement = {
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
		--feet="Hippo. Socks +1",	
	}

	sets.Cooking = {
		head="Midras's Helm +1",
		body="Culinarian's Apron",
	}

	-- Set to be used if you get 
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

	sets.OffenseMode = {}

	--Base TP set to build off when melee'n
	sets.OffenseMode.TP = {
		ammo = Ammo.Bullet.RA,
		head="Adhemar Bonnet +1",
		body="Adhemar Jacket +1",
		hands="Adhemar Wristbands +1",
		legs="Meghanada Chausses +2",
		feet="Malignance Boots",
		--neck="Iskur Gorget",
		neck="Lissome Necklace",
		waist="Windbuffet Belt +1",
		left_ear="Brutal Earring",
		right_ear="Dedition Earring",
		--left_ring="Mummu Ring",
		left_ring="Crepuscular Ring",
		right_ring="Epona's Ring",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
		--left_ear="Telos Earring",
		--right_ear="Crep. Earring",

	}

	--This set is used when OffenseMode is DT and Enaged
	sets.OffenseMode.DT =  {
		ammo = Ammo.Bullet.RA,
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		--legs="Malignance Tights",
		legs="Chas. Culottes +3",
		--feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Windbuffet Belt +1",
		left_ear="Brutal Earring",
		right_ear="Dedition Earring",
		left_ring="Murky Ring",
		right_ring="Epona's Ring",
		back="Null Shawl",
	}

	--This set is used when OffenseMode is PDL and Enaged
	sets.OffenseMode.PDL = set_combine(sets.OffenseMode.TP, {
	})

	--This set is used when OffenseMode is CRIT and Enaged
	sets.OffenseMode.CRIT = set_combine(sets.OffenseMode.TP, {
		ammo = Ammo.Bullet.RA,
		head="Adhemar Bonnet +1",
		body="Adhemar Jacket +1",
		hands="Adhemar Wristbands +1",
		legs="Mummu Kecks +2",
		feet="Malignance Boots",
		neck="Lissome Necklace",
		waist="Windbuffet Belt +1",
		left_ear="Telos Earring",
		right_ear="Dedition Earring",
		left_ring="Mummu Ring",
		right_ring="Epona's Ring",
		back="Null Shawl",

		--right_ear="Crep. Earring",

	})

	--The following sets augment the base TP set above for Dual Wielding
	sets.DualWield = {
		waist="Reiki Yotai",
		right_ear="Eabani Earring",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
	}

	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	sets.OffenseMode.ACC = set_combine(sets.OffenseMode.DT, {
		neck="Null Loop",
		waist="Kwahu Kachina Belt",
		--waist="Null belt",
		left_ear="Cessance Earring",
		right_ear="Mache Earring +1",
		left_ring="Chirich Ring",
		--right_ring"Chirich Ring",
		back="Null Shawl",
	})

	sets.Precast = {}
	-- 70 snapshot is Cap.  Need 60 due to 10 from gifts
	-- Snapshot / Rapidshot
	-- Rapid shot is like quick magic
	-- Snapshot is like Fast Cast
	-- Flurry is 15% Snapshot
	-- Flurry II 30% Snapshot

	--No flurry - 60 Snapshot needed
	sets.Precast.RA = {
		ammo=Ammo.Bullet.RA,
		head="Chass. Tricorne +2", -- 0/14
		body="Oshosi Vest", -- 12/0
		hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}}, -- 8/11
		legs={ name="Adhemar Kecks", augments={'AGI+10','"Rapid Shot"+10','Enmity-5',}},
		--legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}}, -- 10/13
		feet={ name="Adhemar Gamashes", augments={'HP+50','"Store TP"+6','"Snapshot"+8',}, priority=4}, -- 10 / 13
		left_ear="Alabaster Earring",
		right_ear={ name="Chas. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Crit.hit rate+3',}},
		--right_ear="Chas. Earring +2",
		left_ring="Dingir Ring",
		right_ring="Crepuscular Ring", -- 3/0
		neck={ name="Comm. Charm +2", augments={'Path: A',}}, -- 4/0
		waist="Yemaya Belt", -- 0/5
		back={ name="Camulus's Mantle", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Evasion+1','"Snapshot"+10',}},
    } -- Totals 59/43

	-- Flurry - 45 Snapshot Needed
	sets.Precast.RA.Flurry = set_combine(sets.Precast.RA, {
		body="Laksa. Frac +4", -- 0/20
	}) -- Totals 45/63

	-- Flurry II - 30 Snapshot Needed
	sets.Precast.RA.Flurry_II = set_combine( sets.Precast.RA.Flurry, { 
		--feet={ name="Pursuer's Gaiters", augments={'Rng.Acc.+10','"Rapid Shot"+10','"Recycle"+15',}} -- 0/10
    }) -- Totals 35/73

	sets.Precast.RA.ACC = {}

	-- Fast Cast for Magic
	sets.Precast.FastCast = {
	    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}}, -- 14
		--body={ name="Taeon Tabard", augments={'"Fast Cast"+5','HP+44',}}, -- 9
		hands={ name="Leyline Gloves", augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}}, -- 7  Need to update
		--legs={ name="Herculean Trousers", augments={'Mag. Acc.+7','"Fast Cast"+6',}},  -- 6
		--feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}}, -- 8
		neck="Voltsurge Torque", -- 4
		waist="Eschan Stone",
		left_ear="Loquac. Earring", -- 2
		right_ear="Etiolation Earring", -- 1
		left_ring="Lebeche Ring",
		right_ring="Kishar Ring", -- 4
		--back={ name="Camulus's Mantle", augments={'HP+60','HP+20','"Fast Cast"+10',}}, -- 10
	} -- 65 FC

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {
	
	})

	-- Ranged Attack Gear (Normal Midshot)
    sets.Midcast.RA = {
		ammo=Ammo.Bullet.RA,
		head="Ikenga's Hat",
		body="Ikenga's Vest",
		hands="Ikenga's Gloves",
		legs="Chas. Culottes +3",
		feet="Ikenga's Clogs",
		neck="Iskur Gorget",
		waist="Yemaya Belt",
		left_ear="Telos Earring",
		right_ear="Crep. Earring",
		left_ring="Ilabrat Ring",
		right_ring="Dingir ring",
		back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10'}},
    }
    -- Ranged Attack Gear (High Accuracy Midshot)
    sets.Midcast.RA.ACC = set_combine(sets.Midcast.RA, {

		waist="Kwahu Kachina Belt",
		right_ear="Beyla Earring",
		left_ear="Telos Earring",
		left_ring="Cacoethic Ring",
		right_ring="Crepuscular Ring",
	})

	-- Ranged Attack Gear (Triple Shot Midshot)
	sets.Midcast.RA.TripleShot = set_combine(sets.Midcast.RA,{
        head="Oshosi Mask", -- 
        body="Chasseur's Frac +2", --14
        hands="Lanun Gants +4", -- Tripple shot becomes Quad shot
        legs="Oshosi Trousers", --
        feet="Oshosi Leggings", --3
		right_ear={ name="Chas. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Crit.hit rate+3',}},
        --right_ear="Chas. Earring +2",
    }) --28

	-- Ranged PDL
	sets.Midcast.RA.PDL = set_combine(sets.Midcast.RA, {
		left_ring="Sroda Ring",
    })

	-- Ranged CRIT
	sets.Midcast.RA.CRIT = set_combine(sets.Midcast.RA, {
		head="Meghanada Visor +2",
		--body="Nisroch Jerkin",
		feet="Oshosi Leggings",
		waist="Kwahu Kachina Belt",
		--back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','Crit.hit rate+10','Damage taken-5%',}},
    })

	sets.Utsusemi = set_combine(sets.Idle, {
	
	})

	-- Quick Draw Gear Sets
	sets.QuickDraw = {}

	sets.QuickDraw.ACC = {
		ammo = Ammo.Bullet.QD,
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Comm. Charm +2", augments={'Path: A',}},
		waist="Eschan Stone",
		left_ear="Hermetic Earring",
		right_ear="Crep. Earring",
		left_ring="Kishar Ring",
		right_ring="Crepuscular Ring",
		back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10'}},
	}

	sets.QuickDraw.DMG = {
		ammo = Ammo.Bullet.QD,
		head="Malignance Chapeau",
		body={ name="Lanun Frac +4", augments={'Enhances "Loaded Deck" effect',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet="Chass. Bottes +2",
		neck={ name="Comm. Charm +2", augments={'Path: A',}},
		waist="Orpheus's Sash",
		left_ear="Friomisi Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Dingir Ring",
		right_ring="Ilabrat Ring",
		back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage+10','Weapon skill damage +10%'}},
	}

	sets.QuickDraw.STP = {
		ammo = Ammo.Bullet.QD,
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Chas. Culottes +3",
		feet="Malignance Boots",
		neck="Iskur Gorget",
		waist="Yemaya Belt",
		--left_ear="Telos Earring",
		right_ear="Crep. Earring",
		left_ring="Crepuscular Ring",
		right_ring="Ilabrat Ring",
		back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
	}

	-- Quick Draw 
	sets.QuickDraw["Fire Shot"] = set_combine( sets.QuickDraw.DMG, {})
	sets.QuickDraw["Ice Shot"] = set_combine( sets.QuickDraw.DMG, {})
	sets.QuickDraw["Wind Shot"] = set_combine( sets.QuickDraw.DMG, {})
	sets.QuickDraw["Earth Shot"] = set_combine( sets.QuickDraw.DMG, {})
	sets.QuickDraw["Thunder Shot"] = set_combine( sets.QuickDraw.DMG, {})
	sets.QuickDraw["Water Shot"] = set_combine( sets.QuickDraw.DMG, {})
	sets.QuickDraw["Light Shot"] = set_combine( sets.QuickDraw.DMG, {})
	sets.QuickDraw["Dark Shot"] = set_combine( sets.QuickDraw.DMG, {right_ring="Archon Ring", head="Pixie Hairpin +1",
	})

	-- Job Abilities
	sets.JA = {}
	sets.JA["Wild Card"] = {
	    feet={ name="Lanun Bottes +4", augments={'Enhances "Wild Card" effect',}},
	}
	sets.JA["Phantom Roll"] = {}
	sets.JA["Random Deal"] = {
	    body={ name="Lanun Frac +4", augments={'Enhances "Loaded Deck" effect',}},
	}
	sets.JA["Snake Eye"] = {
	    legs={ name="Lanun Trews +4", augments={'Enhances "Snake Eye" effect',}},
	}
	sets.JA["Fold"] = {
	    hands="Lanun Gants +4",			
	}	-- Use gloves for bust
		
	sets.JA["Triple Shot"] = {}		-- Gear to be worn during Midshot
	sets.JA["Cutting Cards"] = {}
	sets.JA["Crooked Cards"] = {}
	sets.JA["Double-Up"] = {right_ring="Luzaf's Ring", -- 16 yalm range
	}

	-- Dancer JA Section

	sets.Flourish = set_combine(sets.Idle.DT, {})

	sets.Jig = set_combine(sets.Idle.DT, { })

	sets.Step = set_combine(sets.OffenseMode.DT, {})

	sets.Samba = set_combine(sets.Idle.DT, {})

	sets.Waltz = set_combine(sets.OffenseMode.DT, {
													ammo="Yamarang", -- 5
													head="Mummu Bonnet +2", -- 9R
													body="Gleti's Cuirass", -- 10%
													--hands="Slither gloves",--5%
													legs="Dashing Subligar",--10
													neck="Unmoving Collar +1",
													waist="Plat. Mog. Belt",
													right_ring="Asklepian Ring", --3R
													left_ring="Murky Ring",
													right_ear="Tuisto Earring",
													left_ear="Handler's earring +1",
	}) -- 30% Potency

	--Base Set used for all rolls
	sets.PhantomRoll = {
					main="Naegling",
					sub={ name="Rostam", augments={'Path: C',}},
					range="Compensator",
					ammo="Devastating Bullet",
					head="Lanun Tricorne +3",
					body="Chasseur's Frac +2",
					hands="Chasseur's Gants +3",
					--legs="Chas. Culottes +3",
					legs="Desultor Tassets",
					feet="Chass. Bottes +2",
					neck="Regal Necklace",
					waist="Sailfi Belt +1",
					left_ear="Alabaster Earring",
					right_ear="Moonshade Earring",
					left_ring="Murky Ring",
					right_ring="Luzaf's Ring",
					back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
}

	sets.PhantomRoll['Monk\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Healer\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Wizard\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Warlock\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Rogue\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Gallant\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Chaos Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Beast Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Choral Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Hunter\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Samurai Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Ninja Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Drachen Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Evoker\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Magus\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Corsair\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Puppet Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Dancer\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Scholar\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Bolter\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll["Caster\'s Roll"] = set_combine(sets.PhantomRoll, {legs="Chas. Culottes +3",})
	sets.PhantomRoll["Tactician\'s Roll"] = set_combine(sets.PhantomRoll, {body="Chasseur's Frac +2"})
	sets.PhantomRoll["Allies\' Roll"] = set_combine(sets.PhantomRoll, {hands="Chasseur's Gants +3"})
	sets.PhantomRoll['Miser\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Companion\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Avenger\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Naturalist\'s Roll'] = sets.PhantomRoll
    sets.PhantomRoll["Courser\'s Roll"] = set_combine(sets.PhantomRoll, {feet="Chass. Bottes +2"})
    sets.PhantomRoll["Blitzer\'s Roll"] = set_combine(sets.PhantomRoll, {head="Chass. Tricorne +2"})
	
--Weapon Skills
	-- Melee Base set
	sets.WS = {
	}

	-- Ranged Base Set
	sets.WS.RA = set_combine (sets.WS, {
	})

	-- Accuracy set used in OffenseMode.ACC
	sets.WS.ACC = set_combine(sets.WS, { })
	sets.WS.ACC.RA = set_combine(sets.WS.RA, { })

	-- Equipment to augment the Melee WS for Physical Damage Limit (Capped Attack)
	sets.WS.PDL = set_combine(sets.WS, {
	})
	sets.WS.PDL.RA = set_combine(sets.WS.RA, {
	})

	-- Critical Hit set used in OffenseMode.CRIT
	sets.WS.CRIT = { }
	sets.WS.CRIT.RA = { }

	sets.WS.MAB = set_combine(sets.WS, {
	})

	sets.WS.RA.MAB = set_combine(sets.WS.RA, {
	})
	--These set are used when a weaponskill is used with that level of aftermath with the correct weapon
	--They Augment any built weaponskill set - Same formatting as the OffenseModes
	sets.WS.AM = {}
	sets.WS.AM1 = {}
	sets.WS.AM2 = {}
	sets.WS.AM3 = {}

	sets.WS.AM.RA = {}
	sets.WS.AM1.RA = {}
	sets.WS.AM2.RA = {}
	sets.WS.AM3.RA = {}
	sets.WS.AM1.RA['Armageddon'] = {}
	sets.WS.AM2.RA['Armageddon'] = {}
	sets.WS.AM3.RA['Armageddon'] = {}

	sets.WS['Aeolian Edge'] = {
						head="Malignance Chapeau",
						body="Lanun Frac +4",
						legs="Nyame Flanchard",
						feet="Lanun Bottes +4",
						neck="Sanctity Necklace",
						waist="Skrymir Cord",
						left_ear="Friomisi Earring",
						right_ear="Moonshade Earring",
						left_ring="Dingir Ring",
						right_ring="Epaminondas's Ring",
						back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%',}},
					--  back={ name="Camulus's Mantle", augments={'Int+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%',}},
	}
	sets.WS["Evisceration"] = {
						head="Blistering sallet +1",
						--head="Adhemar Bonnet +1",
						body="Adhemar Jacket +1",
						hands="Chasseur's Gants +3",
						--hands="Adhemar Wristbands +1",
							--legs="Zoar Subligar +1",
						legs="Mummu Kecks +2",
						feet="Mummu Gamashes +2",
						--feet="Malignance Boots",
						neck="Fotia Gorget",
						waist="Fotia Belt",
						left_ear="Moonshade Earring",
						right_ear="Odr Earring",
						left_ring="Mummu Ring",
						right_ring="Epaminondas's Ring",
						back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
	sets.WS["Savage Blade"] =  {
						head="Malignance Chapeau",
						body="Laksa. Frac +4",
						hands="Chasseur Gants +3",
						legs="Nyame Flanchard",
						feet="Lanun Bottes +4",
						neck="Rep. Plat. Medal",
						waist="Sailfi Belt +1",
						left_ear="Moonshade Earring",
						right_ear="Ishvara Earring",
						left_ring="Sroda Ring",
						right_ring="Epaminondas's Ring",
						back={ name="Camulus's Mantle", augments={'STR+30','Accuracy+20 Attack+20','Weapon skill damage +10%','Damage taken-5%',}},
	}
	sets.WS["Wildfire"] ={
						ammo="Living Bullet",
						head="Malignance Chapeau",
						body="Lanun Frac +4",
						hands="Chasseur's Gants +3",
						legs="Nyame Flanchard",
						feet="Lanun Bottes +4",
						neck={ name="Comm. Charm +2", augments={'Path: A',}},
						waist="Skrymir Cord",
						left_ear="Friomisi Earring",
						right_ear="Moonshade Earring",
						left_ring="Dingir Ring",
						right_ring="Epaminondas's Ring",
						back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%',}},
	}
	sets.WS["Leaden Salute"] ={
							ammo="Living Bullet",
							head="Pixie Hairpin +1",
							body="Lanun Frac +4",
							hands="Chasseur's Gants +3",
							legs="Nyame Flanchard",
							feet="Lanun Bottes +4",
							neck={ name="Comm. Charm +2", augments={'Path: A',}},
							waist="Orpheus's Sash",
							left_ear="Friomisi Earring",
							right_ear="Moonshade Earring",
							left_ring="Dingir Ring",
							right_ring="Epaminondas's Ring",
							back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%',}},
							--right_ring="Archon Ring",
	}
	sets.WS["Last Stand"] =  {
							head="Lanun Tricorne +3",
							body="Laksa. Frac +4",
							hands="Chasseur's Gants +3",
							legs="Nyame Flanchard",
							feet="Lanun Bottes +4",
							neck="Fotia Gorget",
							left_ear="Moonshade Earring",
							right_ear="Ishvara Earring",
							left_ring="Dingir Ring",
							right_ring="Epaminondas's Ring",
							waist="Fotia Belt",
							back={ name="Camulus's Mantle", augments={'AGI+20','Ranged Accuracy+20 Ranged Attack+20','Weapon skill damage +10%',}},
	}
	sets.WS["Hot Shot"] = {
							ammo="Devastating Bullet",
							head="Malignance Chapeau",
							body="Lanun Frac +4",
							hands="Chasseur's Gants +3",
							legs="Nyame Flanchard",
							feet="Lanun Bottes +4",
							neck={ name="Comm. Charm +2", augments={'Path: A',}},
							waist="Skrymir Cord",
							left_ear="Friomisi Earring",
							right_ear="Moonshade Earring",
							left_ring="Dingir Ring",
							right_ring="Epaminondas's Ring",
							back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%',}},
	}

	-- Uses Default WS set
	sets.WS["Split Shot"] = set_combine(sets.WS, {})
	sets.WS["Sniper Shot"] = set_combine(sets.WS, {})
	sets.WS["Slug Shot"] = set_combine(sets.WS, {})
	sets.WS["Numbing Shot"] = set_combine(sets.WS, {})
	sets.WS["Fast Blade"] = set_combine(sets.WS, {})
	sets.WS["Burning Blade"] = set_combine(sets.WS, {})
	sets.WS["Flat Blade"] = set_combine(sets.WS, {})
	sets.WS["Shining Blade"] = set_combine(sets.WS, {})
	sets.WS["Circle Blade"] = set_combine(sets.WS, {})
	sets.WS["Spirits Within"] = set_combine(sets.WS, {})
	sets.WS["Requiescat"] = set_combine(sets.WS, {})


	sets.TreasureHunter = {
		waist="Chaac Belt",
		hands="Volte Bracers",
		legs="Volte Hose",
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
	if spell.english == 'Fold' then
		equipSet = set_combine(equipSet, {hands={ name="Lanun Gants +4", augments={'Enhances "Fold" effect',}}})
    end
	if spell.id == 123 or spell.type == 'CorsairRoll' then -- Double up and bypass weapon check
		equipSet = set_combine(equipSet, sets.PhantomRoll)
	end
	equipSet = Job_Mode_Check(equipSet)
	return equipSet
end
-- Augment basic equipment sets
function midcast_custom(spell)
	equipSet = {}
	if spell.english == 'Fold' then
		equipSet = set_combine(equipSet, {hands={ name="Lanun Gants +4", augments={'Enhances "Fold" effect',}}})
    end
	if spell.id == 123 or spell.type == 'CorsairRoll' then -- Double up and bypass weapon check
		equipSet = set_combine(equipSet, sets.PhantomRoll)
	end
	equipSet = Job_Mode_Check(equipSet)
	return equipSet
end
-- Augment basic equipment sets
function aftercast_custom(spell)
	equipSet = {}
	if state.JobMode.value == 'Ranged' and player.status == "Engaged" then
		equipSet = set_combine(equipSet, sets.OffenseMode.Ranged)
	end
	equipSet = Job_Mode_Check(equipSet)
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
end

function user_file_unload()
	--send_command('lua u autocor')
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
	return buff
end

function Job_Mode_Check(equipSet)
	if state.JobMode.value == 'Melee' then
		equipSet = set_combine(equipSet, sets.Weapons.Melee)
	elseif state.JobMode.value == 'Ranged' then
		equipSet = set_combine(equipSet, sets.Weapons.Ranged)
	elseif state.JobMode.value == 'Cooking' then
		equipSet = set_combine(equipSet, sets.Weapons['Cooking'], sets.Cooking)
	end
	
	if state.JobMode.value ~= 'Cooking' then
		if DualWield == false then
			if TwoHand == false then
				equipSet = set_combine(equipSet, sets.Weapons.Shield)
			end
		end
	end
	return equipSet
end
