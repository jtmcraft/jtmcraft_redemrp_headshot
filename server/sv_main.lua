RegisterNetEvent("jtmcraft:rewardHeadShot")
AddEventHandler("jtmcraft:rewardHeadShot", function(args)
    local _source = source

    TriggerEvent("redemrp:getPlayerFromId", _source, function(shooterPlayer)
        local xp = args.xp + args.xpBonus

        if xp > 0 then
            shooterPlayer.addXP(xp)
        end

        args.user_identifier = shooterPlayer.getIdentifier()
        args.characterId = shooterPlayer.getSessionVar("charid")
        args.shooterFirstName = shooterPlayer.getFirstname()
        args.shooterLastName = shooterPlayer.getLastname()

        persistHeadShot(args)
    end)
end)

function persistHeadShot(args)
    local shooter_x, shooter_y, shooter_z = table.unpack(args.shooterCoords)
    local victim_x, victim_y, victim_z = table.unpack(args.victimCoords)
    local columnsList = {
        "user_identifier",
        "shooter_first_name", "shooter_last_name",
        "shooter_x", "shooter_y", "shooter_z", "shooter_speed",
        "shooter_is_scoped_in", "shooter_used_special_ability",
        "victim_is_player", "victim_is_mounted", "victim_in_vehicle", "victim_in_cover",
        "victim_x", "victim_y", "victim_z", "victim_speed",
        "ammo_hash", "weapon_hash",
        "xp", "xp_bonus", "distance"
    }
    local columns = "("
    local values = "values ("
    for k, v in pairs(columnsList) do
        columns = columns .. v .. ","
        values = values .. "@" .. v .. ","
    end
    columns = string.sub(columns, 1, -2) .. ")"
    values = string.sub(values, 1, -2) .. ")"
    local sql = "insert into jtmcraft_headshot " .. columns .. " " .. values .. ";"

    MySQL.Async.execute(sql, {
        user_identifier = args.user_identifier,
        shooter_first_name = args.shooterFirstName,
        shooter_last_name = args.shooterLastName,
        victim_is_player = args.isVictimPlayer,
        weapon_hash = args.weaponHash,
        ammo_hash = args.ammoHash,
        shooter_speed = args.shooterSpeed,
        victim_speed = args.victimSpeed,
        shooter_is_scoped_in = args.isShooterScopedIn,
        shooter_used_special_ability = args.isSpecialAbility,
        victim_is_mounted = args.isVictimMounted,
        victim_in_vehicle = args.isVictimInVehicle,
        victim_in_cover = args.isVictimInCover,
        shooter_x = shooter_x,
        shooter_y = shooter_y,
        shooter_z = shooter_z,
        victim_x = victim_x,
        victim_y = victim_y,
        victim_z = victim_z,
        xp = args.xp,
        xp_bonus = args.xpBonus,
        distance = args.distance
    })
end
