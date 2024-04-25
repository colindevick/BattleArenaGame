local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local WeaponTransition = ReplicatedStorage.Triggers.WeaponTransition
local Unequip = ReplicatedStorage.Triggers.Unequip
local player = game.Players.LocalPlayer
local KeyCode = Enum.KeyCode.T
local connection = nil
local UserInputService = game:GetService("UserInputService")
local ShotGunHoldAnimation = script:WaitForChild("ShotGunTransiton")
local HoldingShotgunAnimation = script:WaitForChild("ShotGunHolding")
local ShotGunToSword = script:WaitForChild("ShotGunToSword")
local loadedToShotGun = player.Character.Humanoid.Animator:LoadAnimation(ShotGunHoldAnimation)
local loadedHoldShotgun=player.Character.Humanoid.Animator:LoadAnimation(HoldingShotgunAnimation)
local loadedTosword= player. Character.Humanoid.Animator:LoadAnimation(ShotGunToSword)

script.Parent.Equipped:Connect(function()

connection=
		UserInputService.InputBegan:Connect(function(input)
			print(input)
			if input.KeyCode == KeyCode then
			WeaponTransition:FireServer("Transition")
		end

		end)
	if player.Character.Shotgun_Sword:GetAttribute("WeaponState") == 2 then
			WeaponTransition:FireServer("Equip")
		end
end)

script.Parent.Unequipped:Connect(function()
	Unequip:FireServer()
	connection:Disconnect()
end)

