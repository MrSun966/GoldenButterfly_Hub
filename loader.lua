-- =========================================================================
-- GOLDEN BUTTERFLY - UNIVERSAL LOADER
-- =========================================================================
local currentPlaceId = game.PlaceId

local SupportedGames = {
    [8735521924] = "https://vss.pandadevelopment.net/virtual/file/734a90b717404860", 
}

local function SendNotification(title, text)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = title;
            Text = text;
            Duration = 5;
            Icon = "rbxassetid://4483362458";
        })
    end)
end

-- =========================================================================
-- CHECK & EXECUTE
-- =========================================================================

local scriptToLoad = SupportedGames[currentPlaceId]

if scriptToLoad then
    SendNotification("Golden Butterfly", "Game Supported! Loading Script...")
    
    local success, err = pcall(function()
        loadstring(game:HttpGet(scriptToLoad))()
    end)

    if not success then
        SendNotification("Error", "Failed to load script: " .. tostring(err))
        warn("Golden Butterfly Loader Error: " .. tostring(err))
    end
else

    SendNotification("Golden Butterfly", "Game Not Supported Yet!")
    warn("Game ID " .. tostring(currentPlaceId) .. " is not supported by Golden Butterfly.")
end
