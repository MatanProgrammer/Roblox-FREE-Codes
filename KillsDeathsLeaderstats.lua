local Players = game:GetService("Players")

local function createLeaderstats(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local kills = Instance.new("IntValue")
	kills.Name = "Kills"
	kills.Value = 0
	kills.Parent = leaderstats

	local deaths = Instance.new("IntValue")
	deaths.Name = "Deaths"
	deaths.Value = 0
	deaths.Parent = leaderstats
end

local function onPlayerDeath(player)
	local leaderstats = player:FindFirstChild("leaderstats")
	if leaderstats then
		local deaths = leaderstats:FindFirstChild("Deaths")
		if deaths then
			deaths.Value = deaths.Value + 1
		end
	end
end

local function onPlayerKill(killer)
	local leaderstats = killer:FindFirstChild("leaderstats")
	if leaderstats then
		local kills = leaderstats:FindFirstChild("Kills")
		if kills then
			kills.Value = kills.Value + 1
		end
	end
end

Players.PlayerAdded:Connect(function(player)
	createLeaderstats(player)

	player.CharacterAdded:Connect(function(character)
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			humanoid.Died:Connect(function()
				onPlayerDeath(player)
				local creatorTag = humanoid:FindFirstChild("creator")
				if creatorTag and creatorTag.Value then
					local killer = creatorTag.Value
					if killer:IsA("Player") then
						onPlayerKill(killer)
					end
				end
			end)
		end
	end)
end)
