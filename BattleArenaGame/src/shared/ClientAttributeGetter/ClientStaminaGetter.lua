local ClientStaminaGetter = {}
guiScalefactor = 500;

function ClientStaminaGetter.getStamina(player1)
	local player = player1
	return player:GetAttribute("Stamina")
end

function ClientStaminaGetter.getStaminaRegen(player1)
	local player = player1
	return player:GetAttribute("StaminaRegenRate")
end

function ClientStaminaGetter.getPlayerconsumtion(player1)
	local player = player1
	return player:GetAttribute("PlayerConsumingStamina")
end

function ClientStaminaGetter.getCurrentstamina(player1)
	local player = player1
	return player:GetAttribute("CurrentStamina")
	end

function ClientStaminaGetter.getCurrentstamconvert()
	return script:GetAttribute("StaminaToCurrentStamina")
end

function ClientStaminaGetter.getLevelonestamina()
	return script:GetAttribute("LevelOneStamina")
end

function ClientStaminaGetter.getScalefactor()
	return guiScalefactor
end
return ClientStaminaGetter
