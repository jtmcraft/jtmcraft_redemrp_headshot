function persistAmmo()
    -- from https://github.com/femga/rdr3_discoveries/blob/master/weapons/ammo_types.lua
    Ammo = {
        "AMMO_22",
        "AMMO_22_TRANQUILIZER",
        "AMMO_ARROW",
        "AMMO_ARROW_CONFUSION",
        "AMMO_ARROW_DISORIENT",
        "AMMO_ARROW_DRAIN",
        "AMMO_ARROW_DYNAMITE",
        "AMMO_ARROW_FIRE",
        "AMMO_ARROW_IMPROVED",
        "AMMO_ARROW_POISON",
        "AMMO_ARROW_SMALL_GAME",
        "AMMO_ARROW_TRACKING",
        "AMMO_ARROW_TRAIL",
        "AMMO_ARROW_WOUND",
        "AMMO_BOLAS",
        "AMMO_BOLAS_HAWKMOTH",
        "AMMO_BOLAS_INTERTWINED",
        "AMMO_BOLAS_IRONSPIKED",
        "AMMO_CANNON",
        "AMMO_DYNAMITE",
        "AMMO_DYNAMITE_VOLATILE",
        "AMMO_HATCHET",
        "AMMO_HATCHET_ANCIENT",
        "AMMO_HATCHET_CLEAVER",
        "AMMO_HATCHET_DOUBLE_BIT",
        "AMMO_HATCHET_DOUBLE_BIT_RUSTED",
        "AMMO_HATCHET_HEWING",
        "AMMO_HATCHET_HUNTER",
        "AMMO_HATCHET_HUNTER_RUSTED",
        "AMMO_HATCHET_VIKING",
        "AMMO_LASSO",
        "AMMO_LASSO_REINFORCED",
        "AMMO_MOLOTOV",
        "AMMO_MOLOTOV_VOLATILE",
        "AMMO_MOONSHINEJUG",
        "AMMO_MOONSHINEJUG_MP",
        "AMMO_PISTOL",
        "AMMO_PISTOL_EXPRESS",
        "AMMO_PISTOL_EXPRESS_EXPLOSIVE",
        "AMMO_PISTOL_HIGH_VELOCITY",
        "AMMO_PISTOL_SPLIT_POINT",
        "AMMO_POISONBOTTLE",
        "AMMO_REPEATER",
        "AMMO_REPEATER_EXPRESS",
        "AMMO_REPEATER_EXPRESS_EXPLOSIVE",
        "AMMO_REPEATER_HIGH_VELOCITY",
        "AMMO_REPEATER_SPLIT_POINT",
        "AMMO_REVOLVER",
        "AMMO_REVOLVER_EXPRESS",
        "AMMO_REVOLVER_EXPRESS_EXPLOSIVE",
        "AMMO_REVOLVER_HIGH_VELOCITY",
        "AMMO_REVOLVER_SPLIT_POINT",
        "AMMO_RIFLE",
        "AMMO_RIFLE_ELEPHANT",
        "AMMO_RIFLE_EXPRESS",
        "AMMO_RIFLE_EXPRESS_EXPLOSIVE",
        "AMMO_RIFLE_HIGH_VELOCITY",
        "AMMO_RIFLE_SPLIT_POINT",
        "AMMO_SHOTGUN",
        "AMMO_SHOTGUN_BUCKSHOT_INCENDIARY",
        "AMMO_SHOTGUN_SLUG",
        "AMMO_SHOTGUN_SLUG_EXPLOSIVE",
        "AMMO_THROWING_KNIVES",
        "AMMO_THROWING_KNIVES_CONFUSE",
        "AMMO_THROWING_KNIVES_DISORIENT",
        "AMMO_THROWING_KNIVES_DRAIN",
        "AMMO_THROWING_KNIVES_IMPROVED",
        "AMMO_THROWING_KNIVES_JAVIER",
        "AMMO_THROWING_KNIVES_POISON",
        "AMMO_THROWING_KNIVES_TRAIL",
        "AMMO_THROWING_KNIVES_WOUND",
        "AMMO_THROWN_ITEM",
        "AMMO_TOMAHAWK",
        "AMMO_TOMAHAWK_ANCIENT",
        "AMMO_TOMAHAWK_HOMING",
        "AMMO_TOMAHAWK_IMPROVED",
        "AMMO_TURRET"
    }

    local resultSet = MySQL.Sync.fetchScalar("select id from jtmcraft_ammo")

    if resultSet then
        print("Ammo data already persisted.")
        return
    end

    MySQL.Sync.execute("delete from jtmcraft_ammo;")
    for i, v in ipairs(Ammo) do
        MySQL.Sync.execute("insert into jtmcraft_ammo (ammo_name, ammo_hash) values (@ammo_name, @ammo_hash);", {
            ammo_name = v,
            ammo_hash = GetHashKey(v)
        }) 
    end
    print("Ammo persisted.")
end

function persistWeapons()
    -- yoinked from spooner (for now?) https://github.com/kibook/spooner/blob/master/data/rdr3/weapons.lua
    Weapons = {            
        "WEAPON_BOW",
        "WEAPON_BOW_IMPROVED",
        "WEAPON_FISHINGROD",
        "WEAPON_KIT_BINOCULARS",
        "WEAPON_KIT_BINOCULARS_IMPROVED",
        "WEAPON_KIT_CAMERA",
        "WEAPON_KIT_METAL_DETECTOR",
        "WEAPON_LASSO",
        "WEAPON_LASSO_REINFORCED",
        "WEAPON_MELEE_CLEAVER",
        "WEAPON_MELEE_DAVY_LANTERN",
        "WEAPON_MELEE_HAMMER",
        "WEAPON_MELEE_HATCHET",
        "WEAPON_MELEE_HATCHET_HUNTER",
        "WEAPON_MELEE_KNIFE",
        "WEAPON_MELEE_KNIFE_JAWBONE",
        "WEAPON_MELEE_KNIFE_TRADER",
        "WEAPON_MELEE_LANTERN",
        "WEAPON_MELEE_MACHETE",
        "WEAPON_MELEE_MACHETE_COLLECTOR",
        "WEAPON_MELEE_MACHETE_HORROR",
        "WEAPON_MELEE_TORCH",
        "WEAPON_MOONSHINEJUG_MP",
        "WEAPON_PISTOL_M1899",
        "WEAPON_PISTOL_MAUSER",
        "WEAPON_PISTOL_SEMIAUTO",
        "WEAPON_PISTOL_VOLCANIC",
        "WEAPON_REPEATER_CARBINE",
        "WEAPON_REPEATER_EVANS",
        "WEAPON_REPEATER_HENRY",
        "WEAPON_REPEATER_WINCHESTER",
        "WEAPON_REVOLVER_CATTLEMAN",
        "WEAPON_REVOLVER_CATTLEMAN_MEXICAN",
        "WEAPON_REVOLVER_DOUBLEACTION",
        "WEAPON_REVOLVER_DOUBLEACTION_GAMBLER",
        "WEAPON_REVOLVER_LEMAT",
        "WEAPON_REVOLVER_NAVY",
        "WEAPON_REVOLVER_SCHOFIELD",
        "WEAPON_RIFLE_BOLTACTION",
        "WEAPON_RIFLE_ELEPHANT",
        "WEAPON_RIFLE_SPRINGFIELD",
        "WEAPON_RIFLE_VARMINT",
        "WEAPON_SHOTGUN_DOUBLEBARREL",
        "WEAPON_SHOTGUN_PUMP",
        "WEAPON_SHOTGUN_REPEATING",
        "WEAPON_SHOTGUN_SAWEDOFF",
        "WEAPON_SHOTGUN_SEMIAUTO",
        "WEAPON_SNIPERRIFLE_CARCANO",
        "WEAPON_SNIPERRIFLE_ROLLINGBLOCK",
        "WEAPON_THROWN_BOLAS",
        "WEAPON_THROWN_DYNAMITE",
        "WEAPON_THROWN_MOLOTOV",
        "WEAPON_THROWN_THROWING_KNIVES",
        "WEAPON_THROWN_TOMAHAWK",
        "WEAPON_THROWN_TOMAHAWK_ANCIENT"
    }

    local resultSet = MySQL.Sync.fetchScalar("select id from jtmcraft_weapons")

    if resultSet then
        print("Weapons data already persisted.")
        return
    end

    MySQL.Sync.execute("delete from jtmcraft_weapons;")
    for i, v in ipairs(Weapons) do
        MySQL.Sync.execute("insert into jtmcraft_weapons (weapon_name, weapon_hash) values (@weapon_name, @weapon_hash);", {
            weapon_name = v,
            weapon_hash = GetHashKey(v)
        }) 
    end
    print("Weapons persisted.")
end

MySQL.ready(function()
    -- persistAmmo()
    -- persistWeapons()
end)
