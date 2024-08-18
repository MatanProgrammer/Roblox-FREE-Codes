-- Make sure to put this LOCAL script in StarterPlayer -> StarterPlayerScripts

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local doubleJumpEnabled = true
local canDoubleJump = false
local hasDoubleJumped = false
local jumpPower = 50
local doubleJumpPower = 70
local jumpCooldown = 0.25
local lastJumpTime = 0

local function onJumpRequest()
    local currentTime = tick()
    print("Jump request received at", currentTime)
    
    if humanoid:GetState() == Enum.HumanoidStateType.Freefall and canDoubleJump and not hasDoubleJumped and (currentTime - lastJumpTime) >= jumpCooldown then
        print("Performing double jump")
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        humanoid:Move(Vector3.new(0, doubleJumpPower, 0), true)
        hasDoubleJumped = true
        lastJumpTime = currentTime
    elseif humanoid:GetState() == Enum.HumanoidStateType.Jumping then
        print("First jump detected")
        canDoubleJump = true
        lastJumpTime = currentTime
    end
end

local function onStateChanged(_, newState)
    print("State changed to:", newState)
    if newState == Enum.HumanoidStateType.Landed then
        print("Landed, resetting double jump")
        hasDoubleJumped = false
        canDoubleJump = false
    elseif newState == Enum.HumanoidStateType.Freefall then
        print("In freefall, can double jump")
        canDoubleJump = true
    end
end

UserInputService.JumpRequest:Connect(onJumpRequest)
humanoid.StateChanged:Connect(onStateChanged)
