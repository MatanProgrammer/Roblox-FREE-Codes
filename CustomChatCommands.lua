local Players = game:GetService("Players")

-- Command enable/disable flags
local enableReset = true
local enableRefresh = true
local enableInvisible = true
local enableVisible = true

local function onPlayerChatted(player, message)
	local command = string.lower(message)
	local args = string.split(command, " ")

	print("Player " .. player.Name .. " issued command: " .. command)

	if (args[1] == "/re" or args[1] == "/reset") and enableReset then
		if player.Character then
			player.Character:BreakJoints()
		end
	elseif (args[1] == "/refresh" or args[1] == "/ref") and enableRefresh then
		if player.Character then
			local position = player.Character.PrimaryPart.Position
			player:LoadCharacter()
			player.Character:SetPrimaryPartCFrame(CFrame.new(position))
		end
	elseif args[1] == "/invisible" and enableInvisible then
		if player.Character then
			for _, part in pairs(player.Character:GetChildren()) do
				if part:IsA("BasePart") then
					part.Transparency = 1
				elseif part:IsA("Accessory") and part:FindFirstChild("Handle") then
					part.Handle.Transparency = 1
				elseif part:IsA("Decal") then
					part.Transparency = 1
				end
			end
			if player.Character:FindFirstChild("Head") then
				for _, decal in pairs(player.Character.Head:GetChildren()) do
					if decal:IsA("Decal") then
						decal.Transparency = 1
					end
				end
			end
			if player.Character:FindFirstChild("HumanoidRootPart") then
				player.Character.HumanoidRootPart.Transparency = 1
			end
		end
	elseif args[1] == "/visible" and enableVisible then
		if player.Character then
			for _, part in pairs(player.Character:GetChildren()) do
				if part:IsA("BasePart") then
					part.Transparency = 0
				elseif part:IsA("Accessory") and part:FindFirstChild("Handle") then
					part.Handle.Transparency = 0
				elseif part:IsA("Decal") then
					part.Transparency = 0
				end
			end
			if player.Character:FindFirstChild("Head") then
				for _, decal in pairs(player.Character.Head:GetChildren()) do
					if decal:IsA("Decal") then
						decal.Transparency = 0
					end
				end
			end
			if player.Character:FindFirstChild("HumanoidRootPart") then
				player.Character.HumanoidRootPart.Transparency = 1
			end
		end
	end
end

Players.PlayerAdded:Connect(function(player)
	player.Chatted:Connect(function(message)
		onPlayerChatted(player, message)
	end)
end)
