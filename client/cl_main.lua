Citizen.CreateThread(function()
  while true do
    Wait(0)
    local shot = events.getEventData("EVENT_NETWORK_DAMAGE_ENTITY")

    if shot and shot.IsHeadShot == 1 then
      local killerId = shot["killer entity id"]
      local victimId = shot["damaged entity id"]
      local myPedId = GetPlayerPed()

      if killerId == myPedId then
        local isVictimPlayer = 0
        local weaponHash = shot[5]
        local ammoHash = shot[6]
        local isKillerScopedIn = shot[15]
        local isSpecialAbility = shot[16]
        local isVictimMounted = shot[18]
        local isVictimInVehicle = shot[19]
        local isVictimInCover = shot[20]
  
        if IsPedAPlayer(victimId) then
          isVictimPlayer = 1
        end
  
        local shooterCoords = GetEntityCoords(killerId)
        local victimCoords = GetEntityCoords(victimId)
        local x1, y1, z1 = table.unpack(shooterCoords)
        local x2, y2, z2 = table.unpack(victimCoords)
        local distance = Vdist2(x1, y1, z1, x2, y2, z2)
        local xp_bonus = math.floor(distance / 1000)
        local xp = 2
        local zones = {
          state = getZoneById(x, y, z, 0),
          town = getZoneById(x, y, z, 1),
          lake = getZoneById(x, y, z, 2),
          river = getZoneById(x, y, z, 3),
          swamp = getZoneById(x, y, z, 5),
          ocean = getZoneById(x, y, z, 6),
          creek = getZoneById(x, y, z, 7),
          pond =  getZoneById(x, y, z, 8),
          district = getZoneById(x, y, z, 10)
        }
        local weather = getWeather()
        local gameTime = {
          hour = GetClockHours(),
          minute = GetClockMinutes(),
          second = GetClockSeconds(),
          dayOfMonth = GetClockDayOfMonth(),
          dayOfWeek = GetClockDayOfWeek(),
          month = GetClockMonth(),
          year = GetClockYear()
        }

        local args = {
          shooterId = killerId,
          victimId = victimId,
          shooterCoords = shooterCoords,
          isShooterScopedIn = isKillerScopedIn,
          isSpecialAbility = isSpecialAbility,
          isVictimPlayer = isVictimPlayer,
          victimCoords = victimCoords,
          isVictimMounted = isVictimMounted,
          isVictimInVehicle = isVictimInVehicle,
          isVictimInCover = isVictimInCover,
          ammoHash = ammoHash,
          weaponHash = weaponHash,
          xp = xp,
          xpBonus = xp_bonus,
          distance = distance,
          state = zones.state,
          town = zones.town,
          lake = zones.lake,
          river = zones.river,
          swamp = zones.swamp,
          ocean = zones.ocean,
          creek = zones.creek,
          pond = zones.pond,
          district = zones.district,
          weather = weather,
          hour = gameTime.hour,
          minute = gameTime.minute,
          second = gameTime.second,
          dayOfMonth = gameTime.dayOfMonth,
          dayOfWeek = gameTime.dayOfWeek,
          month = gameTime.month,
          year = gameTime.year
        }

        notifyHeadShot(xp + xp_bonus)
        TriggerServerEvent("jtmcraft:rewardHeadShot", args)
      end
    end
  end
end)

function notifyHeadShot(xp)
  local text = "Head shot (" .. xp .. " xp)"
  TriggerEvent("redem_roleplay:ShowAdvancedRightNotification", text, "toast_awards_set_h", "awards_set_h_006", "COLOR_PURE_WHITE", 4000)
end

function getWeather()
  return "unknown"
end

function getZoneById(x, y, z, zoneId)
  return tostring(Citizen.InvokeNative(0x43AD8FC02B429D33, x, y, z, zoneId))
end
