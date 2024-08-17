-- Make sure to put this script in StarterPlayer -> StarterPlayerScripts

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local dashSpeed = 100
local dashDuration = 0.2
local isDashing = false

local function onInputBegan(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.F then
        if not isDashing then
            isDashing = true
            local dashDirection = humanoid.MoveDirection
            humanoidRootPart.Velocity = dashDirection * dashSpeed
            wait(dashDuration)
            humanoidRootPart.Velocity = Vector3.new(0, humanoidRootPart.Velocity.Y, 0)
            isDashing = false
        end
    end
end

UserInputService.InputBegan:Connect(onInputBegan)
