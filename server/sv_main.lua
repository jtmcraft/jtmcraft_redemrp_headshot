RegisterNetEvent("jtmcraft:rewardHeadShot")
AddEventHandler("jtmcraft:rewardHeadShot", function(args)
    local _source = source

    TriggerEvent("redemrp:getPlayerFromId", _source, function(shooterPlayer)
        if args.xp > 0 then
            shooterPlayer.addXP(args.xp)
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
    local columns = "(user_identifier,shooter_first_name,shooter_last_name,shooter_x,shooter_y,shooter_z,victim_is_player,victim_x,victim_y,victim_z,weapon_hash)"
    local values = "values (@user_identifier,@shooter_first_name,@shooter_last_name,@shooter_x,@shooter_y,@shooter_z,@is_victim_player,@victim_x,@victim_y,@victim_z,@weapon_hash)"
    local sql = "insert into jtmcraft_headshot " .. columns .. " " .. values

    MySQL.Async.execute(sql, {
        user_identifier = args.user_identifier,
        shooter_first_name = args.shooterFirstName,
        shooter_last_name = args.shooterLastName,
        shooter_x = shooter_x,
        shooter_y = shooter_y,
        shooter_z = shooter_z,
        is_victim_player = args.isVictimPlayer,
        victim_x = victim_x,
        victim_y = victim_y,
        victim_z = victim_z,
        weapon_hash = args.weaponHash
    })
end
