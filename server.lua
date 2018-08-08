--[[-----------------
 	Doors Control By XanderWP from Ukraine with <3
 ------------------------]]--

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "doors")

local cfg = module("doors", "config")

AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
  if first_spawn then
    TriggerClientEvent('vrpdoorsystem:load', source, cfg.list)
  end
end)

Citizen.CreateThread(function()
  Citizen.Wait(500)
  TriggerClientEvent('vrpdoorsystem:load', -1, cfg.list)
end)


RegisterServerEvent('vrpdoorsystem:open')
AddEventHandler('vrpdoorsystem:open', function(id)
  local user_id = vRP.getUserId({source})
  local player = vRP.getUserSource({user_id})
  if vRP.hasPermission({user_id, "#"..cfg.list[id].key..".>0"}) or vRP.hasPermission({user_id,cfg.list[id].permission}) then
    vRPclient.playAnim(player, {false,{{"misscommon@locked_door", "lockeddoor_tryopen", 1}},false})
    SetTimeout(4000, function()
      cfg.list[id].locked = not cfg.list[id].locked
      TriggerClientEvent('vrpdoorsystem:statusSend', (-1), id,cfg.list[id].locked)
      if cfg.list[id].pair ~= nil then
        local idsecond = cfg.list[id].pair
        cfg.list[idsecond].locked = cfg.list[id].locked
        TriggerClientEvent('vrpdoorsystem:statusSend', (-1), idsecond,cfg.list[id].locked)
      end
      if cfg.list[id].locked then
        vRPclient.notify(player, {"Дверь закрыта с помощью Ключа "..cfg.list[id].name})
      else
        vRPclient.notify(player, {"Дверь открыта с помощью Ключа "..cfg.list[id].name})
      end
    end)
  else
    vRPclient.notify(player, {"Отсутствует Ключ от дверей "..cfg.list[id].name})
  end
end)
