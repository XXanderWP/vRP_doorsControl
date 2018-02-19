--[[-----------------
	vRP_doorsControl By XanderWP from Ukraine with <3
------------------------]]--
local LockHotkey = {0,108}

doorList = {
    -- Mission Row To locker room & roof
    [1] = { ["ishash"] = 0, ["objName"] = "v_ilev_ph_gendoor004", ["x"]= 449.69815063477, ["y"]= -986.46911621094,["z"]= 30.689594268799,["locked"]= true,["txtX"]=450.104,["txtY"]=-986.388,["txtZ"]=31.739},
    -- Mission Row Armory
    [2] = { ["ishash"] = 0, ["objName"] = "v_ilev_arm_secdoor", ["x"]= 452.61877441406, ["y"]= -982.7021484375,["z"]= 30.689598083496,["locked"]= true,["txtX"]=453.079,["txtY"]=-982.600,["txtZ"]=31.739},
    -- Mission Row Captain Office
    [3] = { ["ishash"] = 0, ["objName"] = "v_ilev_ph_gendoor002", ["x"]= 447.23818969727, ["y"]= -980.63006591797,["z"]= 30.689598083496,["locked"]= true,["txtX"]=447.200,["txtY"]=-980.010,["txtZ"]=31.739},
    -- Mission Row To downstairs right
    [4] = { ["ishash"] = 0, ["objName"] = "v_ilev_ph_gendoor005", ["x"]= 443.97, ["y"]= -989.033,["z"]= 30.6896,["locked"]= true,["txtX"]=444.020,["txtY"]=-989.445,["txtZ"]=31.739},
    -- Mission Row To downstairs left
    [5] = { ["ishash"] = 0, ["objName"] = "v_ilev_ph_gendoor005", ["x"]= 445.37, ["y"]= -989.705,["z"]= 30.6896,["locked"]= true,["txtX"]=445.350,["txtY"]=-989.445,["txtZ"]=31.739},
    -- Mission Row Main cells
    [6] = { ["ishash"] = 0, ["objName"] = "v_ilev_ph_cellgate", ["x"]= 464.0, ["y"]= -992.265,["z"]= 24.9149,["locked"]= true,["txtX"]=463.465,["txtY"]=-992.664,["txtZ"]=25.064},
    -- Mission Row Cell 1
    [7] = { ["ishash"] = 0, ["objName"] = "v_ilev_ph_cellgate", ["x"]= 462.381, ["y"]= -993.651,["z"]= 24.9149,["locked"]= true,["txtX"]=461.806,["txtY"]=-993.308,["txtZ"]=25.064},
    -- Mission Row Cell 2
    [8] = { ["ishash"] = 0, ["objName"] = "v_ilev_ph_cellgate", ["x"]= 462.331, ["y"]= -998.152,["z"]= 24.9149,["locked"]= true,["txtX"]=461.806,["txtY"]=-998.800,["txtZ"]=25.064},
    -- Mission Row Cell 3
    [9] = { ["ishash"] = 0, ["objName"] = "v_ilev_ph_cellgate", ["x"]= 462.704, ["y"]= -1001.92,["z"]= 24.9149,["locked"]= true,["txtX"]=461.806,["txtY"]=-1002.450,["txtZ"]=25.064},
    -- Mission Row Backdoor in
    [10] = { ["ishash"] = 0, ["objName"] = "v_ilev_gtdoor", ["x"]= 464.126, ["y"]= -1002.78,["z"]= 24.9149,["locked"]= true,["txtX"]=464.100,["txtY"]=-1003.538,["txtZ"]=26.064},
    -- Mission Row Backdoor out
    [11] = { ["ishash"] = 0, ["objName"] = "v_ilev_gtdoor", ["x"]= 464.18, ["y"]= -1004.31,["z"]= 24.9152,["locked"]= true,["txtX"]=464.100,["txtY"]=-1003.538,["txtZ"]=26.064},
    -- Mission Row Rooftop In
    [12] = { ["ishash"] = 0, ["objName"] = "v_ilev_gtdoor02", ["x"]= 465.467, ["y"]= -983.446,["z"]= 43.6918,["locked"]= true,["txtX"]=464.361,["txtY"]=-984.050,["txtZ"]=44.834},
    -- Mission Row Rooftop Out
    [13] = { ["ishash"] = 0, ["objName"] = "v_ilev_gtdoor02", ["x"]= 462.979, ["y"]= -984.163,["z"]= 43.6919,["locked"]= true,["txtX"]=464.361,["txtY"]=-984.050,["txtZ"]=44.834},
	
	--- Центральные двери в ПД
	[14] = { ["ishash"] = 1, ["objName"] = 320433149, ["x"]= 434.7479, ["y"]= -982.2151,["z"]= 30.83926,["locked"]= true,["txtX"]=999999,["txtY"]=99999999,["txtZ"]=9999999},
	[15] = { ["ishash"] = 1, ["objName"] = -1215222675, ["x"]= 434.7479, ["y"]= -981.6184,["z"]= 30.83926,["locked"]= true,["txtX"]=434.427,["txtY"]=-981.95184,["txtZ"]=31.710},
	
	--- Брифинг комната
	[17] = { ["ishash"] = 1, ["objName"] = -131296141, ["x"]= 443.0298, ["y"]= -992.941,["z"]= 30.8393,["locked"]= true,["txtX"]=443.0298,["txtY"]=-992.941,["txtZ"]=31.8393},
	[16] = { ["ishash"] = 1, ["objName"] = -131296141, ["x"]= 443.0298, ["y"]= -993.5412,["z"]= 30.8393,["locked"]= true,["txtX"]=443.0298,["txtY"]=-993.5412,["txtZ"]=31.8393},
	
	--- Задние двери
	[19] = { ["ishash"] = 1, ["objName"] = -2023754432, ["x"]= 468.9679, ["y"]= -1014.452,["z"]= 26.53623,["locked"]= true,["txtX"]=468.9679,["txtY"]=-1014.452,["txtZ"]=27.53623},
	[18] = { ["ishash"] = 1, ["objName"] = -2023754432, ["x"]= 468.3716, ["y"]= -1014.452,["z"]= 26.53623,["locked"]= true,["txtX"]=468.3716,["txtY"]=-1014.452,["txtZ"]=27.53623},
	
	
	
	[21] = { ["ishash"] = 1, ["objName"] = 749848321, ["x"]= 461.2865, ["y"]= -985.3206,["z"]= 30.83926,["locked"]= true,["txtX"]=461.507,["txtY"]=-985.9053,["txtZ"]=31.6895},
	[20] = { ["ishash"] = 1, ["objName"] = -2023754432, ["x"]= 452.6248, ["y"]= -987.3626,["z"]= 30.83926,["locked"]= true,["txtX"]=451.95,["txtY"]=-987.230,["txtZ"]=31.6895},

	
	
	
	 [22] = { ["ishash"] = 0, ["objName"] = "v_ilev_ph_cellgate", ["x"]= 462.504, ["y"]= -1001.92,["z"]= 24.9149,["locked"]= true,["txtX"]=999999,["txtY"]=99999999,["txtZ"]=9999999},
}

local firstLoad = false
function DrawText3d(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    if onScreen then
        SetTextScale(0.2, 0.2)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 55)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
         SetDrawOrigin(x,y,z, 0)
         DrawText(0.0, 0.0)
         ClearDrawOrigin()
    end
end

Citizen.CreateThread(function()
    

    while firstLoad == false do
	TriggerServerEvent('door:load')
	Citizen.Wait(1000)
	end
	
end)

RegisterNetEvent('door:statusSend')
AddEventHandler('door:statusSend', function(i, status)
doorList[i]["locked"]=status
local closeDoor = GetClosestObjectOfType(doorList[i]["x"], doorList[i]["y"], doorList[i]["z"], 1.0, hash, false, false, false)
locked, heading = GetStateOfClosestDoorOfType(hash, doorList[i]["x"], doorList[i]["y"], doorList[i]["z"], locked, heading)
if heading < -0.01 or heading > 0.01 then
			syncFail = true
			else
			syncFail = false
			end
	if doorList[i]["locked"] == true and syncFail == true then
				FreezeEntityPosition(closeDoor, false)
				else
			FreezeEntityPosition(closeDoor, doorList[i]["locked"])		
				end	
end)


RegisterNetEvent('door:loadSend')
AddEventHandler('door:loadSend', function(doorL)
for i,v in pairs(doorL) do
doorList[i]["locked"]=v.freeze
local closeDoor = GetClosestObjectOfType(doorList[i]["x"], doorList[i]["y"], doorList[i]["z"], 1.0, hash, false, false, false)
locked, heading = GetStateOfClosestDoorOfType(hash, doorList[i]["x"], doorList[i]["y"], doorList[i]["z"], locked, heading)
if heading < -0.01 or heading > 0.01 then
			syncFail = true
			else
			syncFail = false
			end
	if doorList[i]["locked"] == true and syncFail == true then
				FreezeEntityPosition(closeDoor, false)
				else
			FreezeEntityPosition(closeDoor, doorList[i]["locked"])		
				end			
end
firstLoad = true
end)

Citizen.CreateThread(function()
    

    while true do
        for i = 1, #doorList do
            local playerCoords = GetEntityCoords( GetPlayerPed(-1) )
			if doorList[i]["ishash"] == 0 then
			hash = GetHashKey(doorList[i]["objName"])
			else
			hash = doorList[i]["objName"]
			end
            local closeDoor = GetClosestObjectOfType(doorList[i]["x"], doorList[i]["y"], doorList[i]["z"], 1.0, hash, false, false, false)
            --SetEntityMaxHealth(closeDoor, 1000)
            local objectCoordsDraw = GetEntityCoords( closeDoor )            
            local playerDistance = GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, doorList[i]["x"], doorList[i]["y"], doorList[i]["z"], true)
                  locked, heading = GetStateOfClosestDoorOfType(hash, doorList[i]["x"], doorList[i]["y"], doorList[i]["z"], locked, heading)       
            if(playerDistance < 1.15) then
                
                SetEntityHealth(closeDoor, 1000)
				ClearEntityLastDamageEntity(closeDoor)
				SetEntityCanBeDamaged(closeDoor, false)
				if doorList[i]["locked"] == true then
                    DrawText3d(doorList[i]["txtX"], doorList[i]["txtY"], doorList[i]["txtZ"], "~b~Дверь ~r~закрыта")
                else
                    DrawText3d(doorList[i]["txtX"], doorList[i]["txtY"], doorList[i]["txtZ"], "~b~Дверь ~g~открыта")
                end
				
                
                if IsControlJustPressed(table.unpack(LockHotkey)) then
                    if doorList[i]["locked"] == true then
                        --FreezeEntityPosition(closeDoor, false)
						
							if(i==10 or i==11) then
                            TriggerServerEvent('door:status', 10, false)
							TriggerServerEvent('door:status', 11, false)
                        elseif(i==14 or i==15) then
                            TriggerServerEvent('door:status', 14, false)
							TriggerServerEvent('door:status', 15, false)
							 elseif(i==12 or i==13) then
                            TriggerServerEvent('door:status', 12, false)
							TriggerServerEvent('door:status', 13, false)
                        elseif(i==9 or i==21) then
                            TriggerServerEvent('door:status', 9, false)
							TriggerServerEvent('door:status', 21, false)
                        else
                            TriggerServerEvent('door:status', i, false)
                        end
                    else
                        --FreezeEntityPosition(closeDoor, true)
						if(i==10 or i==11) then
                            TriggerServerEvent('door:status', 10, true)
							TriggerServerEvent('door:status', 11, true)
                        elseif(i==14 or i==15) then
                            TriggerServerEvent('door:status', 14, true)
							TriggerServerEvent('door:status', 15, true)
							 elseif(i==12 or i==13) then
                            TriggerServerEvent('door:status', 12, true)
							TriggerServerEvent('door:status', 13, true)
                        elseif(i==9 or i==21) then
                            TriggerServerEvent('door:status', 9, true)
							TriggerServerEvent('door:status', 21, true)
                        else
                            TriggerServerEvent('door:status', i, true)
                        end

                    end
                end
			if heading < -0.01 or heading > 0.01 then
			syncFail = true
			else
			syncFail = false
			end
			
			
			
			
			if firstLoad == true then
				if doorList[i]["locked"] == true and syncFail == true then
				FreezeEntityPosition(closeDoor, false)
				else
			FreezeEntityPosition(closeDoor, doorList[i]["locked"])		
				end			
            end
			else
			if heading < -0.01 or heading > 0.01 then
			syncFail = true
			else
			syncFail = false
			end
			if doorList[i]["locked"] == true and syncFail == true then
				FreezeEntityPosition(closeDoor, false)
				else
			FreezeEntityPosition(closeDoor, doorList[i]["locked"])		
				end	
			
            end
			
        end

        Citizen.Wait(0)
    end
end)


