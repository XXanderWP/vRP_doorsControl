--[[-----------------
	vRP_doorsControl By XanderWP from Ukraine with <3
------------------------]]--
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","doorsControl")


doorList = {
    [1] = {freeze = true, key = "key_lspd", permission="police.pc", name = "LSPD"},
    [2] = {freeze = true, key = "key_lspd", permission="police.pc", name = "LSPD"},
    [3] = {freeze = true, key = "key_pd_boss", permission="boss_lspd.pc", name = "Captain room"},
    [4] = {freeze = true, key = "key_lspd", permission="police.pc", name = "LSPD"},
    [5] = {freeze = true, key = "key_lspd", permission="police.pc", name = "LSPD"},
    [6] = {freeze = true, key = "key_lspd", permission="police.pc", name = "LSPD"},
    [7] = {freeze = true, key = "key_lspd", permission="police.pc", name = "LSPD"},
    [8] = {freeze = true, key = "key_lspd", permission="police.pc", name = "LSPD"},
    [9] = {freeze = true, key = "key_lspd", permission="police.pc", name = "LSPD"},
    [10] = {freeze = true, key = "key_lspd", permission="police.pc", name = "LSPD"},
    [11] = {freeze = true, key = "key_lspd", permission="police.pc", name = "LSPD"},
    [12] = {freeze = true, key = "key_lspd", permission="police.pc", name = "LSPD"},
    [13] = {freeze = true, key = "key_lspd", permission="police.pc", name = "LSPD"},
    [14] = {freeze = true, key = "key_lspd", permission="police.pc", name = "LSPD"},
    [15] = {freeze = true, key = "key_lspd", permission="police.pc", name = "LSPD"},
    [16] = {freeze = true, key = "key_lspd", permission="police.pc", name = "LSPD"},
	[17] = {freeze = true, key = "key_lspd", permission="police.pc", name = "LSPD"},
	[18] = {freeze = true, key = "key_lspd", permission="police.pc", name = "LSPD"},
	[19] = {freeze = true, key = "key_lspd", permission="police.pc", name = "LSPD"},
	[20] = {freeze = true, key = "key_lspd", permission="police.pc", name = "LSPD"},
	[21] = {freeze = true, key = "key_lspd", permission="police.pc", name = "LSPD"},
	[22] = {freeze = true, key = "key_lspd", permission="police.pc", name = "LSPD"},
}

RegisterServerEvent('door:status')
AddEventHandler('door:status', function(id, status)
  user_id = vRP.getUserId({source})
  player = vRP.getUserSource({user_id})
  if vRP.hasPermission({user_id, "#"..doorList[id].key..".>0"}) or vRP.hasPermission({user_id,doorList[id].permission}) then
    doorList[id].freeze=status
    TriggerClientEvent('door:statusSend', -1, id, status)
    if status then
      vRPclient.pnotify(player, {"Door ~r~closed ~y~with ~b~Key "..doorList[id].name})
    else
      vRPclient.pnotify(player, {"Door ~g~open ~y~with ~b~Key "..doorList[id].name})
    end
  else
    vRPclient.pnotify(player, {"~r~Need ~b~Key "..doorList[id].name})
  end 
end)

RegisterServerEvent('door:load')
AddEventHandler('door:load', function(id, status)
  TriggerClientEvent('door:loadSend', -1, doorList) 
end)


local function doorSync() 
TriggerClientEvent('door:loadSend', -1, doorList) 
  SetTimeout(5000, doorSync)
end
doorSync()