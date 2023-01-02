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
    persistWeapons()
end)
