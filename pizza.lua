-- 1. Load the Rayfield UI Library from the internet
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 2. Create the main window
local Window = Rayfield:CreateWindow({
   Name = "My First Auto-Farm",
   LoadingTitle = "Loading Script...",
   LoadingIcon = 0, -- You can put a Roblox image ID here
   Theme = "Default",
})

-- 3. Create a tab inside the window
local MainTab = Window:CreateTab("Farming", nil) -- "Farming" is the tab name

-- 4. Create a button that runs your RSpy/Dex code
local Button = MainTab:CreateButton({
   Name = "Start Auto-Collect Coins",
   Callback = function()
       -- YOUR SCRIPT GOES HERE
       local coinFolder = workspace.Map.SpawnedCoins
       for _, coin in pairs(coinFolder:GetChildren()) do
           game:GetService("ReplicatedStorage").Remotes.CollectCoin:FireServer(coin)
           task.wait(0.1)
       end
   end,
})