function user_job_setup()
	-- Options: Override default values
	state.OffenseMode:options('Normal','Acc','Hoxne','SubtleBlow','Counter')
	state.WeaponskillMode:options('Match','Normal','Acc','Hoxne')
	state.HybridMode:options('Normal','PDT')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Karambit','Staff','ProcStaff','ProcClub','Barehanded','ProcSword','ProcGreatSword','ProcScythe','ProcPolearm','ProcGreatKatana')

	-- Hoxne toggle
	state.HoxneMode = M(false, 'Hoxne Mode')

	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None'}

	update_melee_groups()

	gear.ws_jse_back = {
		name="Segomo's Mantle",
		augments={'STR+20','Accuracy+20 Attack+20','"Dbl. Atk."+10%','STR+3'}
	}

	gear.tp_jse_back = {
		name="Segomo's Mantle",
		augments={'DEX+20','Accuracy+20 Attack+20','"Dbl. Atk."+10%','DEX+10'}
	}

	gear.Hoxne_jse_back = {
		name="Segomo's Mantle",
		augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10%'}
	}

	-- Keybinds
	send_command('bind ^` input /ja "Boost" <me>')
	send_command('bind !` input /ja "Perfect Counter" <me>')
	send_command('bind ^backspace input /ja "Mantra" <me>')
	send_command('bind @` gs c cycle SkillchainMode')

	-- CTRL + ALT + H
	send_command('bind ^!h gs c toggle HoxneMode')

	select_default_macro_book()
end


function init_gear_sets()

	--------------------------------------
	-- Hoxne Ampulla
	--------------------------------------

	sets.Hoxne = {
		ammo="Hoxne Ampulla"
	}

	--------------------------------------
	-- Precast Sets
	--------------------------------------

	sets.precast.JA['Hundred Fists'] = {
		legs="Hesychast's Hose +1"
	}

	sets.precast.JA['Boost'] = {}

	sets.precast.JA['Boost'].OutOfCombat = {}

	sets.precast.JA['Dodge'] = {
		feet="Anchorite's Gaiters +3"
	}

	sets.precast.JA['Focus'] = {
		head="Anchorite's Crown +2"
	}

	sets.precast.JA['Counterstance'] = {}

	sets.precast.JA['Footwork'] = {
		neck="Mnk. Nodowa +1",
		legs="Bhikku Hose +3",
		feet="Bhikku Gaiters +3"
	}

	sets.precast.JA['Formless Strikes'] = {
		body="Hesychast's Cyclas"
	}

	sets.precast.JA['Mantra'] = {
		feet="Hes. Gaiters +3"
	}

	sets.precast.JA['Chi Blast'] = {}

	sets.precast.JA['Chakra'] = {
		head="Dampening Tam",
		body="Malignance Tabard",
		hands="Hes. Gloves +3",
		legs="Hes. Hose +1",
		feet="Anch. Gaiters +3"
	}

	-- Waltz
	sets.precast.Waltz = {}

	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {
		ammo="Falcon Eye",
		head="Malignance Chapeau",
		neck="Moonbeam Nodowa",
		ear1="Mache Earring +1",
		ear2="Telos Earring",
		body="Malignance Tabard",
		hands="Hes. Gloves +3",
		ring1="Ramuh Ring +1",
		ring2="Ramuh Ring +1",
		back="Segomo's Mantle",
		waist="Olseni Belt",
		legs="Hiza. Hizayoroi +2",
		feet="Malignance Boots"
	}

	sets.precast.Flourish1 = {
		ammo="Falcon Eye",
		head="Malignance Chapeau",
		neck="Moonbeam Nodowa",
		ear1="Mache Earring +1",
		ear2="Telos Earring",
		body="Malignance Tabard",
		hands="Hes. Gloves +3",
		ring1="Ramuh Ring +1",
		ring2="Ramuh Ring +1",
		back="Segomo's Mantle",
		waist="Olseni Belt",
		legs="Mummu Kecks +2",
		feet="Malignance Boots"
	}

	--------------------------------------
	-- Fast Cast
	--------------------------------------

	sets.precast.FC = {
		ammo="Impatiens",
		head=gear.herculean_fc_head,
		neck="Voltsurge Torque",
		ear1="Enchntr. Earring +1",
		ear2="Loquac. Earring",
		body="Dread Jupon",
		hands="Leyline Gloves",
		ring1="Lebeche Ring",
		ring2="Kishar Ring",
		legs="Rawhide Trousers"
	}

	sets.precast.FC.Utsusemi = set_combine(
		sets.precast.FC,
		{
			neck="Magoraga Beads",
			body="Passion Jacket"
		}
	)

	--------------------------------------
	-- Weaponskills
	--------------------------------------

	sets.precast.WS = {
		ammo="Voluspa Tathlum",
		head="Mpaca's Cap",
		neck="Fotia Gorget",
		ear1="Odr Earring",
		ear2="Moonshade Earring",
		body="Adhemar Jacket +1",
		hands="Adhemar Wrist. +1",
		ring1="Cornelia's Ring",
		ring2="Niqmaddu Ring",
		back=gear.ws_jse_back,
		waist="Moonbow Belt +1",
		legs="Samnuha Tights",
		feet="Mpaca's Boots"
	}

	sets.precast.WSAcc = {
		ammo="Falcon Eye",
		body="Blistering Sallet +1",
		waist="Grunfeld Rope",
		legs="Bhikku Hose +3",
		feet="Malignance Boots"
	}

	sets.precast.WS.Acc = set_combine(
		sets.precast.WS,
		sets.precast.WSAcc
	)

	--------------------------------------
	-- Hoxne WS
	--------------------------------------

	sets.precast.WS.Hoxne = {
		ammo="Hoxne Ampulla",
		head="Bhikku Crown +2",
		neck="Moonlight Nodowa",
		ear1="Odr Earring",
		ear2="Moonshade Earring",
		body="Bhikku Cyclas +3",
		hands="Bhikku Gloves +3",
		ring1="Cornelia's Ring",
		ring2="Niqmaddu Ring",
		back=gear.Hoxne_jse_back,
		waist="Moonbow Belt +1",
		legs="Mpaca's Hose",
		feet="Anch. Gaiters +3"
	}

	--------------------------------------
	-- Impetus WS Overlay
	--------------------------------------

	sets.buff.ImpetusWS = {
		body="Bhikku Cyclas +3"
	}

	--------------------------------------
	-- Specific WS
	--------------------------------------

	sets.precast.WS['Raging Fists'] = set_combine(
		sets.precast.WS,
		{
			ring1="Ilabrat Ring"
		}
	)

	sets.precast.WS['Howling Fist'] = set_combine(
		sets.precast.WS,
		{
			ammo="Knobkerrie",
			head="Hes. Crown +3",
			body="Bhikku Cyclas +3",
			hands="Bhikku Gloves +3",
		
		}
	)

	sets.precast.WS['Asuran Fists'] = set_combine(
		sets.precast.WS,
		{
			waist="Grunfeld Rope",
			head="Blistering Sallet +1",
			hands="Bhikku Gloves +3"
		}
	)

	sets.precast.WS["Ascetic's Fury"] = set_combine(
		sets.precast.WS,
		{
			head="Blistering Sallet +1",
			hands="Bhikku Gloves +3"
		}
	)

	sets.precast.WS["Victory Smite"] = set_combine(
		sets.precast.WS,
		{
			head="Blistering Sallet +1",
			hands="Bhikku Gloves +3"
		}
	)

	sets.precast.WS['Shijin Spiral'] = set_combine(
		sets.precast.WS,
		{
			head="Blistering Sallet +1",
			hands="Bhikku Gloves +3"
		}
	)

	sets.precast.WS['Dragon Kick'] = set_combine(
		sets.precast.WS,
		{
			feet="Anch. Gaiters +3",
			neck="Mnk. Nodowa +1",
			ring1="Ilabrat Ring"
		}
	)

	sets.precast.WS['Tornado Kick'] = set_combine(
		sets.precast.WS,
		{
			feet="Anch. Gaiters +3",
			neck="Mnk. Nodowa +1"
		}
	)

	sets.precast.WS['Spinning Attack'] = set_combine(
		sets.precast.WS,
		{}
	)

	--------------------------------------
	-- WS Accuracy Variants
	--------------------------------------

	sets.precast.WS["Raging Fists"].Acc =
		set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSAcc)

	sets.precast.WS["Howling Fist"].Acc =
		set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSAcc)

	sets.precast.WS["Asuran Fists"].Acc =
		set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSAcc)

	sets.precast.WS["Ascetic's Fury"].Acc =
		set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSAcc)

	sets.precast.WS["Victory Smite"].Acc =
		set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSAcc)

	sets.precast.WS["Shijin Spiral"].Acc =
		set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSAcc)

	sets.precast.WS["Dragon Kick"].Acc =
		set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSAcc)

	sets.precast.WS["Tornado Kick"].Acc =
		set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSAcc)

	--------------------------------------
	-- Hoxne Specific WS Variants
	--------------------------------------

	sets.precast.WS["Raging Fists"].Hoxne =
		set_combine(sets.precast.WS.Hoxne, {
			ring1="Ilabrat Ring"
		})

	sets.precast.WS["Howling Fist"].Hoxne =
		set_combine(sets.precast.WS.Hoxne, {
			ammo="Knobkerrie",
			body="Bhikku Cyclas +3",
			hands="Bhikku Gloves +3"
		})

	sets.precast.WS["Asuran Fists"].Hoxne =
		set_combine(sets.precast.WS.Hoxne, {
			waist="Grunfeld Rope",
			head="Blistering Sallet +1",
			hands="Bhikku Gloves +3"
		})

	sets.precast.WS["Ascetic's Fury"].Hoxne =
		set_combine(sets.precast.WS.Hoxne, {
			head="Blistering Sallet +1",
			hands="Bhikku Gloves +3"
		})

	sets.precast.WS["Victory Smite"].Hoxne =
		set_combine(sets.precast.WS.Hoxne, {
			head="Blistering Sallet +1",
			hands="Bhikku Gloves +3"
		})

	sets.precast.WS["Shijin Spiral"].Hoxne =
		set_combine(sets.precast.WS.Hoxne, {
			head="Blistering Sallet +1",
			hands="Bhikku Gloves +3"
		})

	sets.precast.WS["Dragon Kick"].Hoxne =
		set_combine(sets.precast.WS.Hoxne, {
			feet="Anch. Gaiters +3",
			neck="Mnk. Nodowa +1",
			ring1="Ilabrat Ring"
		})

	sets.precast.WS["Tornado Kick"].Hoxne =
		set_combine(sets.precast.WS.Hoxne, {
			feet="Anch. Gaiters +3",
			neck="Mnk. Nodowa +1"
		})

	--------------------------------------
	-- Cataclysm
	--------------------------------------

	sets.precast.WS['Cataclysm'] = {
		ammo="Ghastly Tathlum +1",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Crematio Earring",
		hands="Malignance Gloves",
		ring1="Shiva Ring +1",
		back="Toro Cape",
		legs="Nahtirah Trousers"
	}

	--------------------------------------
	-- TP Earring Sets
	--------------------------------------

	sets.MaxTP = {
		ear1="Brutal Earring",
		ear2="Sherida Earring"
	}

	sets.AccMaxTP = {
		ear1="Mache Earring +1",
		ear2="Telos Earring"
	}

	--------------------------------------
	-- Midcast
	--------------------------------------

	sets.midcast.FastRecast = {
		ammo="Staunch Tathlum +1",
		head=gear.herculean_fc_head,
		neck="Voltsurge Torque",
		ear1="Enchntr. Earring +1",
		ear2="Loquac. Earring",
		body="Dread Jupon",
		hands="Leyline Gloves",
		ring1="Murky Ring",
		ring2="Prolix Ring",
		back="Moonlight Cape",
		waist="Black Belt",
		legs="Nyame Flanchard",
		feet="Hippo. Socks +1"
	}

	sets.midcast.Utsusemi = set_combine(
		sets.midcast.FastRecast,
		{
			back="Mujin Mantle"
		}
	)

	--------------------------------------
	-- Resting
	--------------------------------------

	sets.resting = {
		body="Hesychast's Cyclas",
		ring2="Sheltered Ring"
	}

	--------------------------------------
	-- Idle
	--------------------------------------

	sets.idle = {
		ammo="Staunch Tathlum +1",
		head="Bhikku Crown +2",
		neck="Elite Royal Collar",
		ear1="Etiolation Earring",
		ear2="Alabaster Earring",
		body="Hiza. Haramaki +2",
		hands="Malignance Gloves",
		ring1="Murky Ring",
		ring2="Shneddick Ring",
		back="Moonlight Cape",
		waist="Plat. Mog. Belt",
		legs="Bhikku Hose +3",
		feet="Bhikku Gaiters +3"
	}

	--------------------------------------
	-- Defense
	--------------------------------------

	sets.defense.PDT = {
		ammo="Eluder's Sachet",
		head="Bhikku Crown +2",
		neck="Loricate Torque +1",
		ear1="Etiolation Earring",
		ear2="Alabaster Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Murky Ring",
		ring2="Warden's Ring",
		back="Moonlight Cape",
		waist="Moonbow Belt +1",
		legs="Bhikku Hose +3",
		feet="Bhikku Gaiters +3"
	}

	sets.defense.MDT = {
		ammo="Staunch Tathlum +1",
		head="Nyame Helm",
		neck="Warder's Charm +1",
		ear1="Etiolation Earring",
		ear2="Sanare Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Archon Ring",
		ring2="Shadow Ring",
		back="Moonlight Cape",
		waist="Carrier's Sash",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}

	sets.defense.MEVA = {
		ammo="Staunch Tathlum +1",
		head="Ken Jinpachi +1",
		neck="Warder's Charm +1",
		ear1="Etiolation Earring",
		ear2="Sanare Earring",
		body="Ken Samue +1",
		hands="Nyame Gauntlets",
		ring1="Archon Ring",
		ring2="Shadow Ring",
		back="Moonlight Cape",
		waist="Carrier's Sash",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}

	sets.Kiting = {
		feet="Herald's Gaiters"
	}

	--------------------------------------
	-- Engaged
	--------------------------------------

	sets.engaged = {
		ammo="Coiste Bodhar",
		head="Malignance Chapeau",
		neck="Mnk. Nodowa +1",
		ear1="Schere Earring",
		ear2="Cessance Earring",
		body="Mpaca's Doublet",
		hands="Tatena. Gote +1",
		ring1="Epona's Ring",
		ring2="Niqmaddu Ring",
		back=gear.tp_jse_back,
		waist="Moonbow Belt +1",
		legs="Bhikku Hose +3",
		feet="Tatena. Sune. +1"
	}

	--------------------------------------
	-- Accuracy TP
	--------------------------------------

	sets.engaged.Acc = {
		ammo="Aurgelmir Orb",
		head="Dampening Tam",
		neck="Moonbeam Nodowa",
		ear1="Cessance Earring",
		ear2="Sherida Earring",
		body="Ken. Samue +1",
		hands="Adhemar Wrist. +1",
		ring1="Chirich Ring +1",
		ring2="Chirich Ring +1",
		back=gear.tp_jse_back,
		waist="Olseni Belt",
		legs="Bhikku Hose +3",
		feet="Malignance Boots"
	}

	--------------------------------------
	-- Hoxne TP
	--------------------------------------

	sets.engaged.Hoxne = {
		ammo="Hoxne Ampulla",
		head="Malignance Chapeau",
		neck="Moonlight Nodowa",
		ear1="Mache Earring +1",
		ear2="Bhikku Earring +1",
		body="Mpaca's Doublet",
		hands="Malignance Gloves",
		ring1="Chirich Ring +1",
		ring2="Niqmaddu Ring",
		back=gear.Hoxne_jse_back,
		waist="Moonbow Belt +1",
		legs="Bhikku Hose +3",
		feet="Malignance Boots"
	}

	--------------------------------------
	-- Subtle Blow TP
	--------------------------------------

	sets.engaged.SubtleBlow = {
		ammo="Coiste Bodhar",
		head="Bhikku Crown +2",
		neck="Mnk. Nodowa +1",
		ear1="Mache Earring +1",
		ear2="Bhikku Earring +1",
		body="Mpaca's Doublet",
		hands="Malignance Gloves",
		ring1="Chirich Ring +1",
		ring2="Niqmaddu Ring",
		back=gear.Hoxne_jse_back,
		waist="Moonbow Belt +1",
		legs="Mpaca's Hose",
		feet="Malignance Boots"
	}

	--------------------------------------
	-- Counter TP
	--------------------------------------

	sets.engaged.Counter = {
		ammo="Hoxne Ampulla",
		head="Bhikku Crown +2",
		neck="Bathy Choker +1",
		ear1="Cryptic Earring",
		ear2="Bhikku Earring +1",
		body="Mpaca's Doublet",
		hands="Malignance Gloves",
		ring1="Niqmaddu Ring",
		ring2="Chirich Ring +1",
		back=gear.Hoxne_jse_back,
		waist="Moonbow Belt +1",
		legs="Bhikku Hose +3",
		feet="Anch. Gaiters +3"
	}

	--------------------------------------
	-- Hybrid
	--------------------------------------

	sets.engaged.PDT = {
		ammo="Aurgelmir Orb +1",
		head="Bhikku Crown +2",
		neck="Mnk. Nodowa +1",
		ear1="Mache Earring +1",
		ear2="Bhikku Earring +1",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Epona's Ring",
		ring2="Niqmaddu Ring",
		back="Moonlight Cape",
		waist="Moonbow Belt +1",
		legs="Bhikku Hose +3",
		feet="Bhikku Gaiters +3"
	}

	sets.engaged.Acc.PDT = {
		ammo="Falcon Eye",
		head="Bhikku Crown +2",
		neck="Subtlety Spec.",
		ear1="Mache Earring +1",
		ear2="Odr Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Murky Ring",
		ring2="Chirich Ring +1",
		back=gear.tp_jse_back,
		waist="Grunfeld Rope",
		legs="Bhikku Hose +3",
		feet="Anch. Gaiters +3"
	}

	--------------------------------------
	-- Hoxne PDT
	--------------------------------------

	sets.engaged.Hoxne.PDT = {
		ammo="Hoxne Ampulla",
		head="Bhikku Crown +2",
		neck="Subtlety Spec.",
		ear1="Mache Earring +1",
		ear2="Odr Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Murky Ring",
		ring2="Chirich Ring +1",
		back=gear.Hoxne_jse_back,
		waist="Grunfeld Rope",
		legs="Bhikku Hose +3",
		feet="Bhikku Gaiters +3"
	}

	--------------------------------------
	-- Hundred Fists
	--------------------------------------

	sets.engaged.HF = set_combine(
		sets.engaged,
		{}
	)

	sets.engaged.Acc.HF = set_combine(
		sets.engaged.Acc,
		{}
	)

	sets.engaged.Hoxne.HF = set_combine(
		sets.engaged.Hoxne,
		{}
	)

	sets.engaged.SubtleBlow.HF = set_combine(
		sets.engaged.SubtleBlow,
		{}
	)

	sets.engaged.Counter.HF = set_combine(
		sets.engaged.Counter,
		{}
	)

	sets.buff.Sleep = {
		head="Frenzy Sallet"
	}

	--------------------------------------
	-- Impetus Melee Overlay
	--------------------------------------

	sets.buff.Impetus = {
		body="Bhikku Cyclas +3",
		feet="Mpaca's Boots"
	}

	--------------------------------------
	-- Footwork Melee Overlay
	--------------------------------------

	sets.buff.Footwork = {
		feet="Anch. Gaiters +3",
		neck="Mnk. Nodowa +1"
	}

	sets.buff.Boost = {}

	--------------------------------------
	-- Footwork WS Overlay
	--------------------------------------

	sets.FootworkWS = {
		feet="Anch. Gaiters +3",
		legs="Bhikku Hose +3"
	}

	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.Knockback = {}

	sets.Skillchain = {
		legs="Ryuo Hakama"
	}

	--------------------------------------
	-- Weapons
	--------------------------------------

	sets.weapons.Karambit = {
		main="Karambit"
	}

	sets.weapons.Barehanded = {
		main=empty
	}

	sets.weapons.Staff = {
		main="Malignance Pole",
		sub="Bloodrain Strap"
	}

	sets.weapons.ProcStaff = {
		main="Treat Staff II"
	}

	sets.weapons.ProcClub = {
		main="Sh. Moogle Rod"
	}

	sets.weapons.ProcSword = {
		main="Excalipoor II",
		sub=empty
	}

	sets.weapons.ProcGreatSword = {
		main="Ophidian Sword",
		sub=empty
	}

	sets.weapons.ProcScythe = {
		main="Hoe",
		sub=empty
	}

	sets.weapons.ProcPolearm = {
		main="Tzee Xicu's Blade",
		sub=empty
	}

	sets.weapons.ProcGreatKatana = {
		main="Mutsunokami",
		sub=empty
	}
end


----------------------------------------------------------------
-- HOXNE AMMO OVERLAY
----------------------------------------------------------------
--
-- Hoxne is an additional overlay and does not replace the
-- original Sel-Include MNK buff handling.
----------------------------------------------------------------

function job_customize_melee_set(meleeSet)

	------------------------------------------------------------
	-- ORIGINAL SEL-INCLUDE MNK LOGIC
	------------------------------------------------------------

	if state.OffenseMode.value ~= 'FullAcc' then

		if state.Buff['Impetus'] then
			meleeSet = set_combine(meleeSet, sets.buff.Impetus)
		end

		if buffactive.Footwork then
			meleeSet = set_combine(meleeSet, sets.buff.Footwork)
		end
	end

	------------------------------------------------------------
	-- ORIGINAL BOOST LOGIC
	------------------------------------------------------------

	if state.Buff['Boost'] then
		meleeSet = set_combine(meleeSet, sets.buff.Boost)
	end

	------------------------------------------------------------
	-- HOXNE AMMO
	------------------------------------------------------------

	if state.HoxneMode and state.HoxneMode.value then
		meleeSet = set_combine(meleeSet, sets.Hoxne)
	end

	return meleeSet
end


function job_customize_idle_set(idleSet)

	------------------------------------------------------------
	-- ORIGINAL SEL-INCLUDE BOOST LOGIC
	------------------------------------------------------------

	if state.Buff['Boost'] and sets.buff.Boost then
		idleSet = set_combine(idleSet, sets.buff.Boost)
	end

	------------------------------------------------------------
	-- HOXNE AMMO
	------------------------------------------------------------

	if state.HoxneMode and state.HoxneMode.value then
		idleSet = set_combine(idleSet, sets.Hoxne)
	end

	return idleSet
end


function job_customize_defense_set(defenseSet)

	------------------------------------------------------------
	-- ORIGINAL SEL-INCLUDE FUNCTION RETURNS THE SET
	-- UNMODIFIED, so only add the Hoxne overlay here.
	------------------------------------------------------------

	if state.HoxneMode and state.HoxneMode.value then
		defenseSet = set_combine(defenseSet, sets.Hoxne)
	end

	return defenseSet
end


----------------------------------------------------------------
-- PRECAST
----------------------------------------------------------------
--
-- This function intentionally contains the Sel-Include MNK
-- post-precast logic because this character file overrides
-- the function from the job file.
----------------------------------------------------------------

function job_post_precast(spell, spellMap, eventArgs)

	if spell.type == 'WeaponSkill' then

		--------------------------------------------------------
		-- ORIGINAL SEL-INCLUDE MOONSHADE / MAX TP LOGIC
		--------------------------------------------------------

		local WSset = standardize_set(get_precast_set(spell, spellMap))
		local wsacc = check_ws_acc()

		if (WSset.ear1 == "Moonshade Earring"
			or WSset.ear2 == "Moonshade Earring") then

			if get_effective_player_tp(spell, WSset) > 3200 then

				if wsacc:contains('Acc')
					and not buffactive['Sneak Attack']
					and sets.AccMaxTP then

					equip(sets.AccMaxTP[spell.english] or sets.AccMaxTP)

				elseif sets.MaxTP then

					equip(sets.MaxTP[spell.english] or sets.MaxTP)
				end
			end
		end


		--------------------------------------------------------
		-- HOXNE WS MODE
		--------------------------------------------------------
		--
		-- Hoxne WS gear is selected first.
		-- Impetus and Footwork overlays are applied afterward.
		--------------------------------------------------------

		if state.WeaponskillMode.value == 'Hoxne' then

			local hoxne_ws_set =
				sets.precast.WS[spell.english]
				and sets.precast.WS[spell.english].Hoxne

			if hoxne_ws_set then
				equip(hoxne_ws_set)
			else
				equip(sets.precast.WS.Hoxne)
			end
		end


		--------------------------------------------------------
		-- ORIGINAL IMPETUS WS LOGIC
		--------------------------------------------------------
		--
		-- Victory Smite / Ascetic's Fury:
		--     body = Bhikku Cyclas +3
		--------------------------------------------------------

		if state.Buff['Impetus'] then
    equip(sets.buff.ImpetusWS)
end


		--------------------------------------------------------
		-- ORIGINAL FOOTWORK WS LOGIC
		--------------------------------------------------------
		--
		-- Dragon Kick / Tornado Kick:
		--     feet = Anchorite's Gaiters +3
		--     legs = Bhikku Hose +3
		--------------------------------------------------------

		if buffactive.Footwork
			and (
				spell.english == "Dragon Kick"
				or spell.english == "Tornado Kick"
			) then

			equip(sets.FootworkWS)
		end


		--------------------------------------------------------
		-- HOXNE AMMO
		--------------------------------------------------------
		--
		-- sets.Hoxne contains ONLY ammo, so this cannot overwrite
		-- the Impetus body or Footwork feet.
		--------------------------------------------------------

		if state.HoxneMode and state.HoxneMode.value then
			equip(sets.Hoxne)
		end


	------------------------------------------------------------
	-- BOOST
	------------------------------------------------------------

	elseif spell.english == 'Boost'
		and not (
			player.in_combat
			or being_attacked
			or player.status == 'Engaged'
		)
		and sets.precast.JA['Boost'].OutOfCombat then

		equip(sets.precast.JA['Boost'].OutOfCombat)

		if state.HoxneMode and state.HoxneMode.value then
			equip(sets.Hoxne)
		end
	end
end


----------------------------------------------------------------
-- MIDCAST HOXNE OVERRIDE
----------------------------------------------------------------

function job_post_midcast(spell, spellMap, eventArgs)

	if state.HoxneMode and state.HoxneMode.value then
		equip(sets.Hoxne)
	end
end


----------------------------------------------------------------
-- SELECT DEFAULT MACRO BOOK
----------------------------------------------------------------

function select_default_macro_book()

	if player.sub_job == 'DNC' then
		set_macro_page(1, 3)

	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 3)

	elseif player.sub_job == 'THF' then
		set_macro_page(1, 3)

	elseif player.sub_job == 'RUN' then
		set_macro_page(1, 3)

	else
		set_macro_page(1, 3)
	end
end


----------------------------------------------------------------
-- HOXNE TOGGLE
----------------------------------------------------------------

function job_toggle_state(field)

	if field and field:lower() == 'hoxne' then
		state.HoxneMode:toggle()

		return "Hoxne Ampulla", state.HoxneMode.value
	end

	return nil
end