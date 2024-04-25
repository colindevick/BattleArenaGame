local PlayerDash = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DashAnimation = script:WaitForChild('Animation')
local DashSound = script:WaitForChild('magic attack sound')
local StaminaModule = require(script.Parent)
local AttributeSetterFunctions =require(script.Parent.Parent)

--Settings
local velocity  = 15000 -- dash speed
local debounce = false -- debounce, do not set too true
local cooldown = 1 -- cooldown after dash
local duration = 0.3 -- dash duration

function PlayerDash.Dash(player)
	local character = player.Character

	if character and not debounce then
		debounce = true
		-- now we start dash script
		local playerDashSound = DashSound:Clone()
		playerDashSound.Parent = character
		local humanoid = character.Humanoid
		local HRP = character.HumanoidRootPart
		local loadedAnimation = humanoid.Animator:LoadAnimation(DashAnimation)
		local dashDirection = nil
		local moveDirection = humanoid.MoveDirection
		local lookVector = HRP.CFrame.LookVector
		local minusVelocity = -velocity -- in CFrame, if we set Z to positive, player will move backward instead of forward

		-- checking if player is on the ground, not floating
		local isOnGround = humanoid.FloorMaterial ~= Enum.Material.Air and humanoid.FloorMaterial ~= Enum.Material

		if isOnGround then
			if moveDirection == Vector3.new(0,0,0) then -- if player is not currently moving or walking
				dashDirection = HRP.Position + Vector3.new(lookVector.X, 0, lookVector.Z)
			else -- if player is moving
				dashDirection = HRP.Position + Vector3.new(moveDirection.X, 0, moveDirection.Z)
			end
			loadedAnimation:Play()
			playerDashSound:Play()
			player.Character.HumanoidRootPart.CanTouch = false
			AttributeSetterFunctions.setPlayerconsummingstamina(player, true)
			AttributeSetterFunctions.setCurrentstamina(player, (StaminaModule.getCurrentstamina(player) - 20))
			AttributeSetterFunctions.setPlayerregendelay(player, duration + StaminaModule.getCooldown())
			
			
				--using bodygyro to rotate player to the dash direction smoothly
				local bodyGyro = Instance.new("BodyGyro")
				bodyGyro.Parent = HRP
				bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
				bodyGyro.D = 0 -- D is the dampening
				bodyGyro.P = 500000 -- P is the aggressiveness
				bodyGyro.CFrame =CFrame.lookAt(HRP.Position, dashDirection) -- making player look at the dash direction

				local attachment = Instance.new("Attachment")
				attachment.Parent = HRP

				-- using VectorForce to move player forward
				local vectorForce = Instance.new("VectorForce")
				vectorForce.Parent = HRP
				-- vectorForce need attachment to tell where player is looking
				vectorForce.Attachment0 = attachment

			vectorForce.Force = Vector3.new(0,0,minusVelocity) -- now it will move player forward as the settings
			
				-- play dash animation

			humanoid.AutoRotate = false -- prevent player to rotate by themselves



				wait(duration)
				vectorForce:Destroy()
				bodyGyro:Destroy()
				attachment:Destroy()
				
				
				wait(.125)-- give some time before  stopping the animation
				
				AttributeSetterFunctions.setPlayerconsummingstamina(player, false)
				loadedAnimation:Stop()
				player.Character.HumanoidRootPart.CanTouch = true
				humanoid.AutoRotate = true
				wait(cooldown)

		end
		playerDashSound:Destroy()
		end
		--
		--wait(cooldown)
		debounce = false
	end

return PlayerDash
