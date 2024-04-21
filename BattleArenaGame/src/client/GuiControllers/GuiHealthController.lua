
local player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")


local healthGetter = require(ReplicatedStorage.ClientHealthGetter)
local health

local scaleFactor = healthGetter.getScalefactor()
local healthBar = player.PlayerGui.PlayerResourceBars.ResourceBarBoundry.HealthBorder.HealthMeter
local outlineOfhealthBar = player.PlayerGui.PlayerResourceBars.ResourceBarBoundry.HealthBorder.ActualHealth

local currenthealth

--Adjusts the background bar based on the converstion to the currenthealth
local function adjustOutLine()
	outlineOfhealthBar:TweenSize(UDim2.new(healthGetter.convertTocurrenthealth(player)/scaleFactor, 0, 1 , 0),
		Enum.EasingDirection.Out,
		Enum.EasingStyle.Quart,
		.1,
		true,
		nil
	)
end


function checkhealthBar()
	repeat
		task.wait()
		currenthealth = healthGetter.getCurrenthealth(player)
	until not(currenthealth == nil)


	healthBar:TweenSize(UDim2.new(currenthealth/scaleFactor, 0, 1 , 0),
		Enum.EasingDirection.Out,
		Enum.EasingStyle.Quart,
		.1,
		true,
		nil
		)


end

checkhealthBar()
adjustOutLine()
player:GetAttributeChangedSignal("CurrentHealth"):Connect(checkhealthBar)
player:GetAttributeChangedSignal("Chin"):Connect(adjustOutLine)