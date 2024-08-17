local Players = game:GetService("Players")
local Teams = game:GetService("Teams")

local allowedTeams = {"Red", "Blue"} -- Add the names of the teams that players are allowed to change to

local function onPlayerChatted(player, message)
    local command = string.lower(message)
    local args = string.split(command, " ")

    if args[1] == "/changeteam" and args[2] then
        local teamName = args[2]:gsub("^%l", string.upper)
        local team = Teams:FindFirstChild(teamName)
        if team and table.find(allowedTeams, teamName) then
            player.Team = team
            print(player.Name .. " has changed to team " .. teamName)
        else
            print("Team " .. teamName .. " is not allowed or does not exist.")
        end
    end
end

Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message)
        onPlayerChatted(player, message)
    end)
end)
