local StaminaGetter = {}
guiScalefactor = 500;

function StaminaGetter.getStamina(player1)
	local player = player1
	return player:GetAttribute("Stamina")
end

function StaminaGetter.getStaminaRegen(player1)
	local player = player1
	return player:GetAttribute("StaminaRegenRate")
end

function StaminaGetter.getPlayerconsumtion(player1)
	local player = player1
	return player:GetAttribute("PlayerConsumingStamina")
end

function StaminaGetter.getCurrentstamina(player1)
	local player = player1
	return player:GetAttribute("CurrentStamina")
	end
function StaminaGetter.convertTocurrentstamina(player1)
	local player = player1
	local currentStamina = (player:GetAttribute("Stamina")
		* StaminaGetter.getCurrentstamconvert())
		+ StaminaGetter.getLevelonestamina()
	return currentStamina
end
function StaminaGetter.getCurrentstamconvert()
	return script:GetAttribute("StaminaToCurrentStamina")
end

function StaminaGetter.getLevelonestamina()
	return script:GetAttribute("LevelOneStamina")
end

function StaminaGetter.getScalefactor()
	return guiScalefactor
end
return StaminaGetter
