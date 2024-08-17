-- Make sure to put this script in StarterPlayer -> StarterPlayerScripts

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local wallJumpPower = 50
local isTouchingWall = false

local function onTouchWall(hit)
	if hit:IsA("Part") then
		print("Touching wall:", hit.Name)
		isTouchingWall = true
	end
end

local function onLeaveWall(hit)
	if hit:IsA("Part") then
		print("Left wall:", hit.Name)
		isTouchingWall = false
	end
end

local function onJumpRequest()
	print("Jump request received")
	if isTouchingWall then
		print("Performing wall jump")
		humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		humanoidRootPart.Velocity = Vector3.new(humanoidRootPart.Velocity.X, wallJumpPower, humanoidRootPart.Velocity.Z)
	end
end

-- Connect Touched and TouchEnded events to all parts of the character
for _, part in ipairs(character:GetDescendants()) do
	if part:IsA("BasePart") then
		part.Touched:Connect(onTouchWall)
		part.TouchEnded:Connect(onLeaveWall)
	end
end

UserInputService.JumpRequest:Connect(onJumpRequest)
