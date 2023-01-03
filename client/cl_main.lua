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
        local victimSpeed = shot[8]
        local killerSpeed = shot[9]
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

        local args = {
          shooterId = killerId,
          victimId = victimId,
          shooterCoords = shooterCoords,
          shooterSpeed = killerSpeed,
          isShooterScopedIn = isKillerScopedIn,
          isSpecialAbility = isSpecialAbility,
          isVictimPlayer = isVictimPlayer,
          victimCoords = victimCoords,
          victimSpeed = victimSpeed,
          isVictimMounted = isVictimMounted,
          isVictimInVehicle = isVictimInVehicle,
          isVictimInCover = isVictimInCover,
          ammoHash = ammoHash,
          weaponHash = weaponHash,
          xp = xp,
          xpBonus = xp_bonus,
          distance = distance
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
