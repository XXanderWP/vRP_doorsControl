local doors = {}

RegisterNetEvent('vrpdoors:load')
AddEventHandler('vrpdoors:load', function(list)
  doors = list
end


RegisterNetEvent('vrpdoors:statusSend')
AddEventHandler('vrpdoors:statusSend', function(i, status)
  doors[i].locked = status
end


function searchIdDoor()
  local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
  for k,v in pairs(doors) do
    if GetDistanceBetweenCoords(x,y,z,v.x,v.y,v.z,true) <= 1.5 then
      return k
    end
  end
end





Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)
    if IsControlJustPressed(table.unpack(LockHotkey)) then
      local id = searchIdDoor()
      if id ~= nil then
        TriggerServerEvent("vrpdoors:open", id)
      end
    end
  end
end)


Citizen.CreateThread(function()
  while true do
    Citizen.Wait(100)
    local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
    for k,v in pairs(doors) do
      if GetDistanceBetweenCoords(x,y,z,v.x,v.y,v.z,true) <= 10 then
          local door = GetClosestObjectOfType(v.x,v.y,v.z, 1.0, v.hash, false, false, false)
          SetEntityCanBeDamaged(door, false)
          if door ~= 0 then
            if v.locked == false then
              NetworkRequestControlOfEntity(door)
              FreezeEntityPosition(door, false)
            else
              local locked, heading = GetStateOfClosestDoorOfType(v.hash, v.x,v.y,v.z, locked, heading)
              if heading > -0.02 and heading < 0.02 then
                NetworkRequestControlOfEntity(door)
                FreezeEntityPosition(door, true)
              end
            end
          end
      end
    end
  end
end)
