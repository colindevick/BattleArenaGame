local ClientStaminaCalculations = {}

local clientStaminaGetter = require("ClientStaminaGetter")

function ClientStaminaCalculations.convertTocurrentstamina(player1)
	local player = player1
	local currentStamina = (player:GetAttribute("Stamina")
		* clientStaminaGetter.getCurrentstamconvert()) --TODO Cache this calculation.
		+ clientStaminaGetter.getLevelonestamina()
	return currentStamina
end

return ClientStaminaCalculations