local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local AttributeSetter = ServerScriptService.AttributeSetter
local AttributeSetterFunctions = require(AttributeSetter)
local StaminaModule = require(AttributeSetter.StaminaModule)
local StaminaUsed = ReplicatedStorage.Triggers.StaminaUsed
local PlayerDash = require(script.Parent.PlayerDash)
local StaminaModule = require(script.Parent)


StaminaUsed.OnServerEvent:Connect(function(player, ActionName)
	print("Triggered")
	print(ActionName,player)
	if ActionName == "DashScript"  then
		if StaminaModule.getCurrentstamina(player) >= 20 then
			PlayerDash.Dash(player)

		end


	end

end)