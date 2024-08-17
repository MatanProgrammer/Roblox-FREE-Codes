local groupId = 123456 -- Replace with your group ID

game.Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local rankValue = Instance.new("StringValue")
	rankValue.Name = "Rank"
	rankValue.Parent = leaderstats

	local rank = player:GetRankInGroup(groupId)
	local rankName = player:GetRoleInGroup(groupId)

	rankValue.Value = rankName
end)
