-- 1. Load the Rayfield UI Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 2. Create the main window
local Window = Rayfield:CreateWindow({
   Name = "My Custom Script",
   LoadingTitle = "Loading Script...",
   LoadingIcon = 0, 
   Theme = "Default",
})

-- 3. Create a tab inside the window
local MainTab = Window:CreateTab("Main", nil) 

-- 4. Create a TOGGLE for infinite looping
local AutoSellToggle = MainTab:CreateToggle({
   Name = "Infinite Auto-Sell", 
   CurrentValue = false, -- Starts turned off
   Callback = function(Value)
       -- 'Value' is true when turned on, and false when turned off
       getgenv().autoSell = Value
       
       -- This loop runs infinitely as long as the toggle is ON
       while getgenv().autoSell == true do
           local args = {"LemonStand"}
           
           for i = 1, 8 do
               local tycoonName = "Tycoon" .. tostring(i)
               local tycoonFolder = workspace:FindFirstChild(tycoonName)
               
               if tycoonFolder then
                   pcall(function()
                       tycoonFolder.Remotes.WakeIncomeStream:InvokeServer(unpack(args))
                   end)
               end
           end
           
           -- CRITICAL: Adds a 0.1-second pause so your game doesn't crash from spamming
           task.wait(0.1)
       end
   end,
})
