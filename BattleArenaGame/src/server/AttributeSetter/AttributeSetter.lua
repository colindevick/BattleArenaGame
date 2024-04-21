
--First script that should load as it sets the players attributs
--TODO add system that gets player attibutes from storage

local AttributeSetter = {}



ServerScriptService = game:GetService("ServerScriptService")
Player = game:GetService("Players")
DataStoresServices = game:GetService("DataStoreService")
local DataStores = ServerScriptService.DataStores
local SavedAttributes = require(DataStores:WaitForChild("AttributesSaved"))
--Defines the tickrate and current conversion of Stamina Levels to CurrentStamina
local staminaTocurrentstaminafactor = script:GetAttribute("StaminaToCurrentStamina")
local healthTocurrenthealthfactor = script:GetAttribute("HealthToCurrentHealth")
local levelOnestamina = 80
local levelOnehealth = 400
local currentRegendelay = 1

local currentAttributes = {
	"Stamina",
	"Health",
	"Energy"
}

game.ReplicatedStorage.HealthGetter:SetAttribute("HealthToCurrentHealth", healthTocurrenthealthfactor)
game.ReplicatedStorage.StaminaGetter:SetAttribute("StaminaToCurrentStamina", staminaTocurrentstaminafactor)
game.ReplicatedStorage.HealthGetter:SetAttribute("LevelOneHealth", levelOnehealth)
game.ReplicatedStorage.StaminaGetter:SetAttribute("LevelOneStamina", levelOnestamina)


--Sets inital attributes. Will eventually pull from storage for each player.
--Convert this to an Array for read ablity
local function assignmentLogic(player, playerAttributes)
	print(player.Name, playerAttributes)
	for a, l  in (playerAttributes) do
		player:SetAttribute(a,l)
	end
	
	player:SetAttribute("CurrentStamina", AttributeSetter.convertTocurrentstamina(player))
	player:SetAttribute("StaminaRegenRate", 45)
	player:SetAttribute("PlayerConsumingStamina", false)
	player:SetAttribute("CurrentEnergy", player:GetAttribute("Energy"))
	player:SetAttribute("CurrentHealth", AttributeSetter.convertTocurrenthealth(player))
	player:SetAttribute("CurrentRegenDelay", 0)
end

	

function AttributeSetter.SetInitalattibutes(player)
	local playerID = player.UserId
	
	assignmentLogic(player, SavedAttributes.getsavedAttributes(player))
end



function AttributeSetter.convertTocurrentstamina(player1)
	local player = player1
	local currentStamina = (player:GetAttribute("Stamina")
		* AttributeSetter.getCurrentstamconvert())
		+ levelOnestamina
	return currentStamina
end

function AttributeSetter.setCurrentstamina(player1, currentStamina1)
	local player = player1
	local newStamina = currentStamina1
	player:SetAttribute("CurrentStamina", newStamina)
	if player:GetAttribute("CurrentStamina") < 0 then
			player:SetAttribute("CurrentStamina", 0)
	end
		
end

function AttributeSetter.getCurrentstamconvert()
	return staminaTocurrentstaminafactor
end

function AttributeSetter.setPlayerconsummingstamina(player, consuming)
	player:setAttribute("PlayerConsumingStamina", consuming)
end

function AttributeSetter.setPlayercurrenthealth(player1, newHealth)
	local player = player1
	player:SetAttribute("CurrentHealth", newHealth)
end

function AttributeSetter.setPlayerregendelay(player, delaylength )
	player:SetAttribute("CurrentRegenDelay", delaylength)
end
function AttributeSetter.convertTocurrenthealth(player1)
	local player = player1
	local currentHealth = (player:GetAttribute("Chin")
		* AttributeSetter.getCurrenthealthconvert())
		+ levelOnehealth
	return currentHealth
end

function AttributeSetter.getCurrenthealthconvert ()
	return healthTocurrenthealthfactor
end

return AttributeSetter


