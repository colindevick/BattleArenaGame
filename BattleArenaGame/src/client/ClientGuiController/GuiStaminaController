
local player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")


local staminaGetter = require(ReplicatedStorage.StaminaGetter)

local scaleFactor = staminaGetter.getScalefactor()
local staminaBar = player.PlayerGui.PlayerResourceBars.ResourceBarBoundry.StaminaBorder.StaminaMeter
local outlineOfstaminaBar = player.PlayerGui.PlayerResourceBars.ResourceBarBoundry.StaminaBorder.ActualStamina

local currentStamina

--Adjusts the background bar based on the converstion to the currentstamina 
local function adjustOutLine()
	outlineOfstaminaBar:TweenSize(UDim2.new(staminaGetter.convertTocurrentstamina(player)/scaleFactor, 0, 1, 0),
		Enum.EasingDirection.Out,
		Enum.EasingStyle.Quart,
		.1,
		true,
		nil
	)
end


function checkStaminaBar()
	repeat
		task.wait()
		currentStamina = staminaGetter.getCurrentstamina(player)
	until not(currentStamina == nil)
	staminaBar:TweenSize(UDim2.new(currentStamina/scaleFactor, 0, 1 , 0),
		Enum.EasingDirection.Out,
		Enum.EasingStyle.Quart,
		.1,
		true,
		nil
		)
	
end 


checkStaminaBar()
adjustOutLine()
player:GetAttributeChangedSignal("CurrentStamina"):Connect(checkStaminaBar)
player:GetAttributeChangedSignal("Stamina"):Connect(adjustOutLine)