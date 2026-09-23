-- 1. Load the Rayfield UI Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 2. Create the main window
local Window = Rayfield:CreateWindow({
   Name = "Sell Lemon Auto-Farm",
   LoadingTitle = "Loading Script...",
   LoadingIcon = 0, 
   Theme = "Default",
})

-- 3. Create a tab inside the window
local MainTab = Window:CreateTab("Main", nil) 

-- 4. TOGGLE 1: Infinite Auto-Sell
local AutoSellToggle = MainTab:CreateToggle({
   Name = "Infinite Auto-Sell", 
   CurrentValue = false,
   Callback = function(Value)
       getgenv().autoSell = Value
       
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
           
           task.wait(0.1)
       end
   end,
})

-- 5. TOGGLE 2: Auto Upgrade Cash Register
local AutoUpgradeToggle = MainTab:CreateToggle({
   Name = "Auto Upgrade Cash Register", 
   CurrentValue = false,
   Callback = function(Value)
       getgenv().autoUpgrade = Value
       
       while getgenv().autoUpgrade == true do
           local args = {false, false}
           
           for i = 1, 8 do
               local tycoonName = "Tycoon" .. tostring(i)
               local tycoonFolder = workspace:FindFirstChild(tycoonName)
               
               if tycoonFolder then
                   pcall(function()
                       tycoonFolder.Purchases["Lemon Stand"].Buttons.Other["Cash Register"].Purchase:InvokeServer(unpack(args))
                   end)
               end
           end
           
           task.wait(0.5)
       end
   end,
})

-- 6. TOGGLE 3: Auto Upgrade Lemon Stand (Your newest code)
local AutoUpgradeLemonToggle = MainTab:CreateToggle({
   Name = "Auto Upgrade Lemon Stand", 
   CurrentValue = false,
   Callback = function(Value)
       getgenv().autoUpgradeLemon = Value
       
       while getgenv().autoUpgradeLemon == true do
           local args = {1}
           
           for i = 1, 8 do
               local tycoonName = "Tycoon" .. tostring(i)
               local tycoonFolder = workspace:FindFirstChild(tycoonName)
               
               if tycoonFolder then
                   pcall(function()
                       -- Safely navigating the three nested folders
                       tycoonFolder.Purchases["Lemon Stand"]["Lemon Stand"]["Lemon Stand"].Upgrade:InvokeServer(unpack(args))
                   end)
               end
           end
           
           task.wait(0.5)
       end
   end,
})
