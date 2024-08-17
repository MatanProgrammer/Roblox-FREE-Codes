local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(player)
	player.Chatted:Connect(function(message)
		print("[ CHAT MESSAGE | "..player.Name .. ": " .. message)
	end)
end)
