local ServerScriptService = game:GetService("ServerScriptService")
local HealthModule = {}
AttributeSetter = require(ServerScriptService.AttributeSetter)

function AttributeSetter.convertTocurrenthealth(player1)
	local player = player1
	local currentHealth = (player:GetAttribute("Health") * AttributeSetter.getCurrenthealthconvert()) + 200
	return currentHealth
end


return HealthModule
