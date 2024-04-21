local LocalStaminaGetter = {}
guiScalefactor = 500;

function LocalStaminaGetter.getStamina(player1)
	local player = player1
	return player:GetAttribute("Stamina")
end

function LocalStaminaGetter.getStaminaRegen(player1)
	local player = player1
	return player:GetAttribute("StaminaRegenRate")
end

function LocalStaminaGetter.getPlayerconsumtion(player1)
	local player = player1
	return player:GetAttribute("PlayerConsumingStamina")
end

function LocalStaminaGetter.getCurrentstamina(player1)
	local player = player1
	return player:GetAttribute("CurrentStamina")
	end

function LocalStaminaGetter.getCurrentstamconvert()
	return script:GetAttribute("StaminaToCurrentStamina")
end

function LocalStaminaGetter.getLevelonestamina()
	return script:GetAttribute("LevelOneStamina")
end

function LocalStaminaGetter.getScalefactor()
	return guiScalefactor
end
return LocalStaminaGetter
