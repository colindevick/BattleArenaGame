--On player connect, user attibutes are set.
local ServerScriptService = game:GetService("ServerScriptService")
local Players = game:GetService("Players")
local attributeSetter = require(ServerScriptService.AttributeSetter)

function initalizeAttributes(player)
	attributeSetter.SetInitalattibutes(player)
end

Players.PlayerAdded:Connect(initalizeAttributes)
