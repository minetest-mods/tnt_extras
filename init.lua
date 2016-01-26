tnt_extras = {}

-- Load settings
local lava_chance = minetest.setting_get("lava_chance") or 150
local gravel_chance = minetest.setting_get("gravel_chance") or 8
local glass_chance = minetest.setting_get("glass_chance") or 6
local damage_blast_resistant = minetest.setting_get("damage_blast_resistant") or 24

local function stone_on_blast(pos)
	if math.random(1, gravel_chance) == 1 then
		minetest.set_node(pos, {name = "default:gravel"})
	elseif math.random(1, lava_chance) == 1 then
		minetest.set_node(pos, {name = "default:lava_source"})
	else 
		minetest.remove_node(pos)
	end
end

local function sand_on_blast(pos)
	minetest.remove_node(pos)
	if math.random(1, glass_chance) == 1 then
		minetest.add_item(pos, "vessels:glass_fragments")
	end
end

local function blast_resistant(pos)
	if math.random(1, damage_blast_resistant) == 1 then
		minetest.remove_node(pos)
	end
end

function tnt_extras.register_stone(name)
	minetest.override_item(name, {
		on_blast = stone_on_blast
	})
end

function tnt_extras.register_sand(name)
	minetest.override_item(name, {
		on_blast = sand_on_blast
	})
end

function tnt_extras.register_blast_resistant(name)
	minetest.override_item(name, {
		on_blast = blast_resistant
	})
end

-- Register stonelike nodes
tnt_extras.register_stone("default:stone")
tnt_extras.register_stone("default:cobble")
tnt_extras.register_stone("default:stonebrick")
tnt_extras.register_stone("default:mossycobble")
tnt_extras.register_stone("default:desert_stone")
tnt_extras.register_stone("default:desert_cobble")
tnt_extras.register_stone("default:desert_stonebrick")
tnt_extras.register_stone("default:sandstone")
tnt_extras.register_stone("default:sandstonebrick")

-- Register sandlike nodes
tnt_extras.register_sand("default:sand")
tnt_extras.register_sand("default:desert_sand")

-- Register blast resistant nodes
tnt_extras.register_blast_resistant("default:diamondblock")
tnt_extras.register_blast_resistant("default:obsidian")
tnt_extras.register_blast_resistant("default:obsidianbrick")
tnt_extras.register_blast_resistant("default:mese")