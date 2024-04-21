local ClientHealthGetter = {}

guiScalefactor = 1500;



function ClientHealthGetter.getHealth(player1)
	local player = player1
	return player:GetAttribute("Chin")
end

function ClientHealthGetter.getHealthRegen(player1)
	local player = player1
	return player:GetAttribute("HealthRegenRate")
end

function ClientHealthGetter.getPlayerconsumtion(player1)
	local player = player1
	return player:GetAttribute("PlayerConsumingHealth")
end

function ClientHealthGetter.getCurrenthealth(player1)
	local player = player1
	return player:GetAttribute("CurrentHealth")
end
function ClientHealthGetter.convertTocurrenthealth(player1)
	local player = player1
	local currentHealth = (player:GetAttribute("Chin") 
		* ClientHealthGetter.getCurrenthealthconvert())
		+ ClientHealthGetter.getLevelonehealth()
	return currentHealth
end
function ClientHealthGetter.getCurrenthealthconvert()
	return script:GetAttribute("HealthToCurrentHealth")
end

function ClientHealthGetter.getLevelonehealth()
	return script:GetAttribute("LevelOneHealth")
end

function ClientHealthGetter.getScalefactor()
	return guiScalefactor
end

return ClientHealthGetter
