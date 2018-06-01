--[[-----------------
	vRP_doorsControl By XanderWP from Ukraine with <3
------------------------]]--
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","doorsControl")

doorList = {
    [1] = {freeze = true, permission="police.pc", name = "LSPD"},
    [2] = {freeze = true, permission="police.pc", name = "LSPD"},
    [3] = {freeze = true, permission="chief.job", name = "Captain"},
    [4] = {freeze = true, permission="police.pc", name = "LSPD"},
    [5] = {freeze = true, permission="police.pc", name = "LSPD"},
    [6] = {freeze = true, permission="police.pc", name = "LSPD"},
    [7] = {freeze = true, permission="police.pc", name = "LSPD"},
    [8] = {freeze = true, permission="police.pc", name = "LSPD"},
    [9] = {freeze = true, permission="police.pc", name = "LSPD"},
    [10] = {freeze = true, permission="police.pc", name = "LSPD"},
    [11] = {freeze = true, permission="police.pc", name = "LSPD"},
    [12] = {freeze = true, permission="police.pc", name = "LSPD"},
    [13] = {freeze = true, permission="police.pc", name = "LSPD"},
    [14] = {freeze = false, permission="police.pc", name = "LSPD"},
    [15] = {freeze = false, permission="police.pc", name = "LSPD"},
    [16] = {freeze = true, permission="police.pc", name = "LSPD"},
	[17] = {freeze = true, permission="police.pc", name = "LSPD"},
	[18] = {freeze = true, permission="police.pc", name = "LSPD"},
	[19] = {freeze = true, permission="police.pc", name = "LSPD"},
	[20] = {freeze = true, permission="police.pc", name = "LSPD"},
	[21] = {freeze = true, permission="police.pc", name = "LSPD"},
	[22] = {freeze = true, permission="police.pc", name = "LSPD"},
	[23] = {freeze = true, permission="fib.vehicle", name = "FIB"},
	[24] = {freeze = true, permission="fib.vehicle", name = "FIB"},
	[25] = {freeze = true, permission="police.pc", name = "LSPD"},
	[26] = {freeze = true, permission="police.pc", name = "LSPD"},
	[27] = {freeze = true, permission="police.pc", name = "LSPD"},
	[28] = {freeze = true, permission="police.pc", name = "LSPD"},
	[29] = {freeze = true, permission="police.pc", name = "LSPD"},
	[30] = {freeze = true, permission="police.pc", name = "LSPD"},
}

RegisterServerEvent('door:status')
AddEventHandler('door:status', function(id, status)
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	
	vRPclient.isHandcuffed(player,{},function(handcuffed)
		if not handcuffed then
			if  vRP.hasPermission({user_id,doorList[id].permission}) then
				
				if id == 4 or id == 5 then
					doorList[4].freeze=status
					doorList[5].freeze=status
					TriggerClientEvent('door:statusSend', -1, 4, status)
					TriggerClientEvent('door:statusSend', -1, 5, status)
				elseif id == 17 or id == 16 then
					doorList[17].freeze=status
					doorList[16].freeze=status
					TriggerClientEvent('door:statusSend', -1, 17, status)
					TriggerClientEvent('door:statusSend', -1, 16, status)
				elseif id == 19 or id == 18 then
					doorList[19].freeze=status
					doorList[18].freeze=status
					TriggerClientEvent('door:statusSend', -1, 19, status)
					TriggerClientEvent('door:statusSend', -1, 18, status)
				elseif id == 14 or id == 15 then
					doorList[14].freeze=status
					doorList[15].freeze=status
					TriggerClientEvent('door:statusSend', -1, 14, status)
					TriggerClientEvent('door:statusSend', -1, 15, status)
				elseif id == 31 or id == 32 then
					doorList[31].freeze=status
					doorList[32].freeze=status
					TriggerClientEvent('door:statusSend', -1, 31, status)
					TriggerClientEvent('door:statusSend', -1, 32, status)
				else
					doorList[id].freeze=status
					TriggerClientEvent('door:statusSend', -1, id, status)
				end
			end
		end
	end)
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
