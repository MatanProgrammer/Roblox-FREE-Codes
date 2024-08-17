local Players = game:GetService("Players")

local teleportPosition = Vector3.new(0, 50, 0) -- Change this to your desired teleport location

local function onPlayerChatted(player, message)
    local command = string.lower(message)
    local args = string.split(command, " ")

    if args[1] == "/teleport" then
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(teleportPosition)
        end
    end
end

Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message)
        onPlayerChatted(player, message)
    end)
end)
