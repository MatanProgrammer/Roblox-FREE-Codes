-- Make sure to put this LOCAL script in StarterPlayer -> StarterPlayerScripts

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local jumpSound = Instance.new("Sound", character)
jumpSound.SoundId = "rbxassetid://2428506580"
jumpSound.Volume = 0.3
local function onJumping()
	jumpSound:Play()
end

humanoid.Jumping:Connect(onJumping)
