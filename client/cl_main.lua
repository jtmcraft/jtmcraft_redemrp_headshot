Citizen.CreateThread(function()
  while true do
    Wait(0)
    local hatShot = events.getEventData("EVENT_HEADSHOT_BLOCKED_BY_HAT")
    local shot = events.getEventData("EVENT_NETWORK_DAMAGE_ENTITY")

    if shot and shot.IsHeadShot == 1 then
      local killerId = shot["killer entity id"]
      local victimId = shot["damaged entity id"]
      local myPedId = GetPlayerPed()

      if killerId == myPedId then
        local isVictimPlayer = 0
        local weaponHash = shot[5]
        -- local weaponName = GetWeaponName(weaponHash)
  
        if IsPedAPlayer(victimId) then
          isVictimPlayer = 1
        end
  
        local shooterCoords = GetEntityCoords(killerId)
        local victimCoords = GetEntityCoords(victimId)
        local xp = calculateHeadShotXp(shooterCoords, victimCoords)

        local args = {
          shooterId = killerId,
          shooterCoords = shooterCoords,
          victimIsPlayer = isVictimPlayer,
          victimCoords = victimCoords,   
          weaponHash = weaponHash,
          xp = xp
        }

        TriggerServerEvent("jtmcraft:rewardHeadShot", args)
      end
    end
  end
end)

function calculateHeadShotXp(a, b)
  local x1, y1, z1 = table.unpack(a)
  local x2, y2, z2 = table.unpack(b)

  local distance = Vdist2(x1, y1, z1, x2, y2, z2)
  distance = math.floor(distance / 10)

  return distance
end
