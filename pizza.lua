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

-- 4. Your ONLY button
local MyButton = MainTab:CreateButton({
   Name = "Wake Income", 
   Callback = function()
       local args = {"LemonStand"}
       
       -- Loop through numbers 1 to 8 to find your active tycoon
       for i = 1, 8 do
           local tycoonName = "Tycoon" .. tostring(i)
           local tycoonFolder = workspace:FindFirstChild(tycoonName)
           
           -- If a tycoon folder is found, try to fire the remote
           if tycoonFolder then
               pcall(function()
                   tycoonFolder.Remotes.WakeIncomeStream:InvokeServer(unpack(args))
               end)
           end
       end
   end,
})
