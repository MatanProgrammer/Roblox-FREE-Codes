local lighting = game:GetService("Lighting")
local dayLength = 600 -- [ In Seconds ]
local nightLength = 600 -- [ In Seconds ]

while true do
    for i = 0, 1, 1/dayLength do
        lighting.ClockTime = i * 24
        wait(1)
    end
    for i = 1, 0, -1/nightLength do
        lighting.ClockTime = i * 24
        wait(1)
    end
end
