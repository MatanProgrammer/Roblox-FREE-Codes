-- Make sure to put this script in StarterPlayer -> StarterPlayerScripts

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local normalHeight = humanoid.HipHeight
local crouchHeight = normalHeight / 2

local function onInputBegan(input, gameProcessed)
	if input.KeyCode == Enum.KeyCode.C then
		humanoid.HipHeight = crouchHeight
	end
end

local function onInputEnded(input, gameProcessed)
	if input.KeyCode == Enum.KeyCode.C then
		humanoid.HipHeight = normalHeight
	end
end

UserInputService.InputBegan:Connect(onInputBegan)
UserInputService.InputEnded:Connect(onInputEnded)
