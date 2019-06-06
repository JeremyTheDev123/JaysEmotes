---Coded by Jeremiah:0420
RegisterCommand("traffic", function(source,args,rawCommand)
    Traffic()
end, false)

RegisterCommand("mechanic", function(source, args, rawCommand)
    Mechanic()
end, false)

RegisterCommand("clipboard", function(source, args, rawCommand)
    Clipboard()
end, false)

RegisterCommand("copidle", function(source, args, rawCommand)
    CopIdle()
end, false)

RegisterCommand("crowdcontrol", function(source, args, rawCommand)
    Crowd()
end, false)

RegisterCommand("investigate", function(source, args, rawCommand)
    Investigate()
end, false)

RegisterCommand("kneel", function(source, args, rawCommand)
    Kneel()
end, false)

RegisterCommand("medic", function(source, arge, rawCommand)
    Tendto()
end, false)

RegisterCommand("weld", function(source, arge, rawCommand)
    Weld()
end, false)

RegisterCommand("drop", function(source, arge, rawCommand)
    DropWeapon()
end, false)

RegisterCommand("emotes", function(source, args, rawCommand)
    displayEmotes()
end, false)

RegisterCommand("cancel", function(source, args, rawCommand)
    cancel()
end, false)

---Traffic Worker Code
function Traffic()
	Citizen.CreateThread(function()
        TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_CAR_PARK_ATTENDANT", 0, false)
    end)
end

---Mechanic code
function Mechanic()
	Citizen.CreateThread(function()
        TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_VEHICLE_MECHANIC", 0, false)
    end)
end

---Clipboard code
function Clipboard()
	Citizen.CreateThread(function()
        TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_CLIPBOARD", 0, false)
    end)
end

---Cop idle code
function CopIdle()
	Citizen.CreateThread(function()
        TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_COP_IDLES", 0, true)
    end)
end

---Crowd control code
function Crowd()
	Citizen.CreateThread(function()
        TaskStartScenarioInPlace(PlayerPedId(), "CODE_HUMAN_POLICE_CROWD_CONTROL", 0, 1)
    end)
end

---Investigate code
function Investigate()
	Citizen.CreateThread(function()
        TaskStartScenarioInPlace(PlayerPedId(), "CODE_HUMAN_POLICE_INVESTIGATE", 0, 1)
    end)
end

---Medic kneel code
function Kneel()
	Citizen.CreateThread(function()
        TaskStartScenarioInPlace(PlayerPedId(), "CODE_HUMAN_MEDIC_KNEEL", 0, 1)
    end)
end

---Medic tend to dead
function Tendto()
	Citizen.CreateThread(function()
        TaskStartScenarioInPlace(PlayerPedId(), "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, 1)
    end)
end

---Weld code
function Weld()
	Citizen.CreateThread(function()
        TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_WELDING", 0, 1)
    end)
end

---Drop weapon code
function DropWeapon()
    currentWeapon = GetSelectedPedWeapon(PlayerPedId())
    SetPedDropsInventoryWeapon(PlayerPedId(), currentWeapon, -2.0, 0.0, 0.5, 30)
    drawNotification("Dropped weapon")
end

function displayEmotes()
    TriggerEvent("chatMessage", "^1Jays Emotes: ^7^*/^rcancel to stop any emote.")
    TriggerEvent("chatMessage", "^*/^r^_traffic, ^*/^r^_mechanic, ^*/^r^_clipboard, ^*/^r^_copidle,^r")
    TriggerEvent("chatMessage", "^*/^r^_crowdcontrol, ^*/^r^_investigate, ^*/^r^_kneel, ^*/^r^_medic^r")
    TriggerEvent("chatMessage", "^*/^r^_weld, ^*/^r^_drop.^r")
end

function cancel()
    ClearPedTasksImmediately(GetPlayerPed(-1))
end

function DisplayNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end