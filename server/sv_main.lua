RegisterNetEvent("jtmcraft:rewardHeadShot")
AddEventHandler("jtmcraft:rewardHeadShot", function(args)
    local _source = source

    TriggerServerEvent("redemrp:getPlayerById", _source, function(shooterPlayer)
        if args.xp > 0 then
            shooterPlayer.addXP(args.xp)
        end

        args.shooterFirstName = shooterPlayer.getFirstName()
        args.shooterLastName = shooterPlayer.getLastName()
        persistHeadShot(args)
    end)
end)

function persistHeadShot(args)
    local shooter_first_name = args.shooterFirstName
    local shooter_last_name = args.shooterLastName
    local shooter_x, shooter_y, shooter_z = table.unpack(args.shooterCoords)
    local victim_x, victim_y, victim_z = table.unpack(args.victimCoords)
    local weapon_hash = args.weaponHash
    local is_victim_player = args.isVictimPlayer
    local columns = "(shooter_first_name,shooter_last_name,shooter_x,shooter_y,shooter_z,is_victim_player,victim_x,victim_y,victim_z,weapon_hash)"
    local values = "values (@shooter_first_name,@shooter_last_name,@shooter_x,@shooter_y,@shooter_z,@is_victim_player,@victim_x,@victim_y,@victim_z,@weapon_hash)"
    local sql = "insert into jtmcraft_headshot " .. columns .. " " .. values

    MySql.Async.execute(sql)
end
