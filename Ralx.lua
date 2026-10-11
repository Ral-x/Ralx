-- Core Gui & Player definition
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- UI Setup
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RAL_X_Gui"
screenGui.Parent = CoreGui or player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 220, 0, 160)
frame.Position = UDim2.new(0.05, 0, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

-- Menu Title: RAL X
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 35)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
title.Text = "RAL X"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 16
title.Font = Enum.Font.SourceSansBold
title.Parent = frame

-- Buttons
local mixBtn = Instance.new("TextButton")
mixBtn.Size = UDim2.new(0.9, 0, 0, 40)
mixBtn.Position = UDim2.new(0.05, 0, 0.3, 0)
mixBtn.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
mixBtn.Text = "Mix: Yellow + Blue"
mixBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
mixBtn.TextSize = 13
mixBtn.Font = Enum.Font.SourceSansBold
mixBtn.Parent = frame

local rainbowBtn = Instance.new("TextButton")
rainbowBtn.Size = UDim2.new(0.9, 0, 0, 40)
rainbowBtn.Position = UDim2.new(0.05, 0, 0.62, 0)
rainbowBtn.BackgroundColor3 = Color3.fromRGB(255, 69, 0)
rainbowBtn.Text = "Rainbow Mode: OFF"
rainbowBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
rainbowBtn.TextSize = 13
rainbowBtn.Font = Enum.Font.SourceSansBold
rainbowBtn.Parent = frame

-- Logic
local isRainbowActive = false

mixBtn.MouseButton1Click:Connect(function()
    isRainbowActive = false
    rainbowBtn.Text = "Rainbow Mode: OFF"
    
    local color1 = Color3.fromRGB(255, 255, 0)
    local color2 = Color3.fromRGB(0, 0, 255)
    local mixedColor = Color3.new(
        (color1.R + color2.R) / 2,
        (color1.G + color2.G) / 2,
        (color1.B + color2.B) / 2
    )
    print("Mixed Color Applied:", mixedColor)
end)

rainbowBtn.MouseButton1Click:Connect(function()
    isRainbowActive = not isRainbowActive
    
    if isRainbowActive then
        rainbowBtn.Text = "Rainbow Mode: ON"
        task.spawn(function()
            while isRainbowActive do
                for i = 0, 1, 0.02 do
                    if not isRainbowActive then break end
                    local rainbowColor = Color3.fromHSV(i, 1, 1)
                    task.wait(0.05)
                end
            end
        end)
    else
        rainbowBtn.Text = "Rainbow Mode: OFF"
    end
end)
