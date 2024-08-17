-- Paste this code into the part where you want to boost the player's speed
local speedBoostAmount = 50
local boostDuration = 5
local cooldownDuration = 5

local playersOnCooldown = {}

local function onTouch(hit)
	local player = game.Players:GetPlayerFromCharacter(hit.Parent)
	if player and player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
		if not playersOnCooldown[player.UserId] then
			local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
			humanoid.WalkSpeed = humanoid.WalkSpeed + speedBoostAmount
			playersOnCooldown[player.UserId] = true

			wait(boostDuration)
			humanoid.WalkSpeed = humanoid.WalkSpeed - speedBoostAmount

			wait(cooldownDuration - boostDuration)
			playersOnCooldown[player.UserId] = nil
		end
	end
end

script.Parent.Touched:Connect(onTouch)
