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
   Name = "My Custom Action", 
   Callback = function()
       
       -- Delete the print statement below and paste your new RSpy/Dex code here
       print("My custom button was clicked!")
       
   end,
})
