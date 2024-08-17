local Players = game:GetService("Players")

local afkTimeLimit = 300 -- Time limit in seconds

Players.PlayerAdded:Connect(function(player)
    local lastPosition = player.Character and player.Character.PrimaryPart.Position or Vector3.new()
    local afkTime = 0

    player.CharacterAdded:Connect(function(character)
        lastPosition = character.PrimaryPart.Position
        afkTime = 0
    end)

    while true do
        wait(1)
        if player.Character and player.Character.PrimaryPart then
            local currentPosition = player.Character.PrimaryPart.Position
            if currentPosition == lastPosition then
                afkTime = afkTime + 1
                if afkTime >= afkTimeLimit then
                    player:Kick("You have been kicked for being AFK.")
                end
            else
                afkTime = 0
                lastPosition = currentPosition
            end
        end
    end
end)
