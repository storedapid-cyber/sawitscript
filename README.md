# 🏔️ Roblox Custom Mountain Title

Custom Title Script for Roblox Map  
Created by ReyXdira

## ✨ Features
- Custom text title
- Multiple color options:
  - Gold
  - Rainbow
  - Red
  - White
  - Pink
  - BlueRed
- Black background
- Loading animation
- Auto remove after loading

## 📌 Installation
1. Open Roblox Studio
2. Go to StarterPlayer > StarterPlayerScripts
3. Insert LocalScript
4. Paste CustomTitle.lua

## 🎨 How To Change Text

Edit this line:

```lua
Config.TitleText = "MAP GUNUNG"
--========================================--
--   CUSTOM TITLE MAP GUNUNG
--   Creator: ReyXdira
--========================================--

local player = game.Players.LocalPlayer
local TweenService = game:GetService("TweenService")

--============================--
--          CONFIG
--============================--
local Config = {}

Config.TitleText = "MAP GUNUNG"
Config.SelectedColor = "Rainbow"
-- "Gold", "Rainbow", "Red", "White", "Pink", "BlueRed"

Config.LoadingTime = 5

--============================--
--        GUI SETUP
--============================--

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomTitleGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local background = Instance.new("Frame")
background.Size = UDim2.new(1,0,1,0)
background.BackgroundColor3 = Color3.fromRGB(0,0,0)
background.Parent = screenGui

-- Gradient Background
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0,0,0)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(30,30,30))
}
gradient.Parent = background

-- TITLE
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0.3,0)
title.Position = UDim2.new(0,0,0.35,0)
title.BackgroundTransparency = 1
title.Text = Config.TitleText
title.TextScaled = true
title.Font = Enum.Font.GothamBlack
title.TextTransparency = 1
title.Parent = background

-- CREDIT
local credit = Instance.new("TextLabel")
credit.Size = UDim2.new(1,0,0.05,0)
credit.Position = UDim2.new(0,0,0.92,0)
credit.BackgroundTransparency = 1
credit.Text = "Created by ReyXdira"
credit.TextScaled = true
credit.Font = Enum.Font.Gotham
credit.TextColor3 = Color3.fromRGB(255,255,255)
credit.TextTransparency = 1
credit.Parent = background

-- LOADING
local loading = Instance.new("TextLabel")
loading.Size = UDim2.new(1,0,0.1,0)
loading.Position = UDim2.new(0,0,0.75,0)
loading.BackgroundTransparency = 1
loading.Text = "Loading..."
loading.TextScaled = true
loading.Font = Enum.Font.GothamBold
loading.TextColor3 = Color3.fromRGB(255,255,255)
loading.TextTransparency = 1
loading.Parent = background

--============================--
--        FADE IN
--============================--

for _,v in pairs(screenGui:GetDescendants()) do
	if v:IsA("TextLabel") then
		TweenService:Create(v, TweenInfo.new(1), {TextTransparency = 0}):Play()
	end
end

--============================--
--        COLOR SYSTEM
--============================--

local function applyColor()
	if Config.SelectedColor == "Gold" then
		title.TextColor3 = Color3.fromRGB(255,215,0)

	elseif Config.SelectedColor == "Red" then
		title.TextColor3 = Color3.fromRGB(255,0,0)

	elseif Config.SelectedColor == "White" then
		title.TextColor3 = Color3.fromRGB(255,255,255)

	elseif Config.SelectedColor == "Pink" then
		title.TextColor3 = Color3.fromRGB(255,105,180)

	elseif Config.SelectedColor == "BlueRed" then
		title.TextColor3 = Color3.fromRGB(170,0,255)

	elseif Config.SelectedColor == "Rainbow" then
		task.spawn(function()
			while title.Parent do
				for i = 0,1,0.01 do
					title.TextColor3 = Color3.fromHSV(i,1,1)
					task.wait(0.03)
				end
			end
		end)
	end
end

applyColor()

--============================--
--     LOADING ANIMATION
--============================--

task.spawn(function()
	for i = 1, Config.LoadingTime do
		loading.Text = "Loading" .. string.rep(".", i % 4)
		task.wait(1)
	end
	
	--============================--
	--        FADE OUT
	--============================--
	
	for _,v in pairs(screenGui:GetDescendants()) do
		if v:IsA("TextLabel") then
			TweenService:Create(v, TweenInfo.new(1), {TextTransparency = 1}):Play()
		elseif v:IsA("Frame") then
			TweenService:Create(v, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
		end
	end
	
	task.wait(1)
	screenGui:Destroy()
end)
