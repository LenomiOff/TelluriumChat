local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer

------------------------------------------------
-- SETTINGS
------------------------------------------------
local enabled = false
local boostForce = 500
local gravityValue = workspace.Gravity

------------------------------------------------
-- GUI
------------------------------------------------
local gui = Instance.new("ScreenGui")
gui.Name = "ModernBoostGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

------------------------------------------------
-- MAIN FRAME
------------------------------------------------
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 280, 0, 220)
frame.Position = UDim2.new(0.5, -140, 0.5, -110)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.Parent = gui

Instance.new("UICorner", frame).CornerRadius = UDim.new(0,12)

------------------------------------------------
-- TOP BAR
------------------------------------------------
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1,0,0,30)
topBar.BackgroundColor3 = Color3.fromRGB(30,30,30)
topBar.Parent = frame

Instance.new("UICorner", topBar).CornerRadius = UDim.new(0,12)

------------------------------------------------
-- TITLE
------------------------------------------------
local title = Instance.new("TextLabel")
title.BackgroundTransparency = 1
title.Size = UDim2.new(1,-40,1,0)
title.Position = UDim2.new(0,35,0,0)
title.Text = "Boost Menu"
title.Font = Enum.Font.GothamBold
title.TextSize = 14
title.TextColor3 = Color3.new(1,1,1)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = topBar

------------------------------------------------
-- MINIMIZE BUTTON
------------------------------------------------
local minimize = Instance.new("TextButton")
minimize.Size = UDim2.new(0,25,0,25)
minimize.Position = UDim2.new(0,5,0,2)
minimize.Text = ">"
minimize.Font = Enum.Font.GothamBold
minimize.TextSize = 18
minimize.BackgroundTransparency = 1
minimize.TextColor3 = Color3.new(1,1,1)
minimize.Parent = topBar

------------------------------------------------
-- CONTENT
------------------------------------------------
local content = Instance.new("Frame")
content.BackgroundTransparency = 1
content.Size = UDim2.new(1,0,1,-30)
content.Position = UDim2.new(0,0,0,30)
content.Parent = frame

------------------------------------------------
-- BOOST BUTTON
------------------------------------------------
local toggle = Instance.new("TextButton")
toggle.Size = UDim2.new(1,-20,0,35)
toggle.Position = UDim2.new(0,10,0,10)
toggle.Text = "No Vehicle"
toggle.Font = Enum.Font.GothamBold
toggle.TextSize = 14
toggle.BackgroundColor3 = Color3.fromRGB(80,80,80)
toggle.TextColor3 = Color3.new(1,1,1)
toggle.AutoButtonColor = false
toggle.Active = false
toggle.Parent = content

Instance.new("UICorner", toggle).CornerRadius = UDim.new(0,10)

------------------------------------------------
-- BOOST LABEL
------------------------------------------------
local boostLabel = Instance.new("TextLabel")
boostLabel.BackgroundTransparency = 1
boostLabel.Size = UDim2.new(1,0,0,20)
boostLabel.Position = UDim2.new(0,0,0,50)
boostLabel.Text = "Boost Force : "..boostForce
boostLabel.Font = Enum.Font.Gotham
boostLabel.TextSize = 13
boostLabel.TextColor3 = Color3.new(1,1,1)
boostLabel.Parent = content

------------------------------------------------
-- BOOST SLIDER
------------------------------------------------
local boostBG = Instance.new("Frame")
boostBG.Size = UDim2.new(1,-20,0,10)
boostBG.Position = UDim2.new(0,10,0,75)
boostBG.BackgroundColor3 = Color3.fromRGB(50,50,50)
boostBG.Parent = content

Instance.new("UICorner", boostBG).CornerRadius = UDim.new(1,0)

local boostFill = Instance.new("Frame")
boostFill.Size = UDim2.new(boostForce/5000,0,1,0)
boostFill.BackgroundColor3 = Color3.fromRGB(0,140,255)
boostFill.Parent = boostBG

Instance.new("UICorner", boostFill).CornerRadius = UDim.new(1,0)

local boostButton = Instance.new("TextButton")
boostButton.Size = UDim2.new(0,18,0,18)
boostButton.Position = UDim2.new(boostForce/5000,-9,0.5,-9)
boostButton.Text = ""
boostButton.BackgroundColor3 = Color3.fromRGB(255,255,255)
boostButton.Parent = boostBG

Instance.new("UICorner", boostButton).CornerRadius = UDim.new(1,0)

------------------------------------------------
-- GRAVITY LABEL
------------------------------------------------
local gravityLabel = Instance.new("TextLabel")
gravityLabel.BackgroundTransparency = 1
gravityLabel.Size = UDim2.new(1,0,0,20)
gravityLabel.Position = UDim2.new(0,0,0,105)
gravityLabel.Text = "Workspace Gravity : "..math.floor(gravityValue)
gravityLabel.Font = Enum.Font.Gotham
gravityLabel.TextSize = 13
gravityLabel.TextColor3 = Color3.new(1,1,1)
gravityLabel.Parent = content

------------------------------------------------
-- GRAVITY SLIDER
------------------------------------------------
local gravityBG = Instance.new("Frame")
gravityBG.Size = UDim2.new(1,-20,0,10)
gravityBG.Position = UDim2.new(0,10,0,130)
gravityBG.BackgroundColor3 = Color3.fromRGB(50,50,50)
gravityBG.Parent = content

Instance.new("UICorner", gravityBG).CornerRadius = UDim.new(1,0)

local gravityFill = Instance.new("Frame")
gravityFill.Size = UDim2.new(gravityValue/500,0,1,0)
gravityFill.BackgroundColor3 = Color3.fromRGB(255,170,0)
gravityFill.Parent = gravityBG

Instance.new("UICorner", gravityFill).CornerRadius = UDim.new(1,0)

local gravityButton = Instance.new("TextButton")
gravityButton.Size = UDim2.new(0,18,0,18)
gravityButton.Position = UDim2.new(gravityValue/500,-9,0.5,-9)
gravityButton.Text = ""
gravityButton.BackgroundColor3 = Color3.fromRGB(255,255,255)
gravityButton.Parent = gravityBG

Instance.new("UICorner", gravityButton).CornerRadius = UDim.new(1,0)

------------------------------------------------
-- DRAG WINDOW
------------------------------------------------
local dragging = false
local dragStart
local startPos

topBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = frame.Position
	end
end)

UIS.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then

		local delta = input.Position - dragStart

		frame.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

------------------------------------------------
-- MINIMIZE
------------------------------------------------
local minimized = false

minimize.MouseButton1Click:Connect(function()

	minimized = not minimized

	if minimized then
		content.Visible = false
		frame.Size = UDim2.new(0,280,0,30)
		minimize.Rotation = 90
	else
		content.Visible = true
		frame.Size = UDim2.new(0,280,0,220)
		minimize.Rotation = 0
	end
end)

------------------------------------------------
-- BUTTON CLICK
------------------------------------------------
toggle.MouseButton1Click:Connect(function()

	if not toggle.Active then
		return
	end

	enabled = not enabled
end)

------------------------------------------------
-- SLIDERS
------------------------------------------------
local boostSliding = false
local gravitySliding = false

boostButton.MouseButton1Down:Connect(function()
	boostSliding = true
end)

gravityButton.MouseButton1Down:Connect(function()
	gravitySliding = true
end)

UIS.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		boostSliding = false
		gravitySliding = false
	end
end)

UIS.InputChanged:Connect(function(input)

	if input.UserInputType ~= Enum.UserInputType.MouseMovement then
		return
	end

	------------------------------------------------
	-- BOOST
	------------------------------------------------
	if boostSliding then

		local sizeX = math.clamp(
			(input.Position.X - boostBG.AbsolutePosition.X)
			/ boostBG.AbsoluteSize.X,
			0,
			1
		)

		boostFill.Size = UDim2.new(sizeX,0,1,0)
		boostButton.Position = UDim2.new(sizeX,-9,0.5,-9)

		boostForce = math.floor(sizeX * 5000)

		boostLabel.Text = "Boost Force : "..boostForce
	end

	------------------------------------------------
	-- GRAVITY
	------------------------------------------------
	if gravitySliding then

		local sizeX = math.clamp(
			(input.Position.X - gravityBG.AbsolutePosition.X)
			/ gravityBG.AbsoluteSize.X,
			0,
			1
		)

		gravityFill.Size = UDim2.new(sizeX,0,1,0)
		gravityButton.Position = UDim2.new(sizeX,-9,0.5,-9)

		gravityValue = math.floor(sizeX * 500)

		gravityLabel.Text = "Workspace Gravity : "..gravityValue
	end
end)

------------------------------------------------
-- MAIN LOOP
------------------------------------------------
RunService.RenderStepped:Connect(function()

	-- Force la gravity en permanence
	if workspace.Gravity ~= gravityValue then
		workspace.Gravity = gravityValue
	end

	local character = player.Character
	if not character then return end

	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid then return end

	local seat = humanoid.SeatPart

	------------------------------------------------
	-- PAS ASSIS
	------------------------------------------------
	if not seat then

		enabled = false

		toggle.Text = "No Vehicle"
		toggle.BackgroundColor3 = Color3.fromRGB(80,80,80)
		toggle.Active = false

		return
	end

	------------------------------------------------
	-- ASSIS
	------------------------------------------------
	toggle.Active = true

	if enabled then
		toggle.Text = "Boost ON"
		toggle.BackgroundColor3 = Color3.fromRGB(0,140,255)
	else
		toggle.Text = "Boost OFF"
		toggle.BackgroundColor3 = Color3.fromRGB(120,120,120)
	end

	------------------------------------------------
	-- BOOST UNIQUEMENT SI THROTTLE > 0
	------------------------------------------------
	if enabled and seat:IsA("VehicleSeat") and seat.Throttle > 0 then

		local vehicle = seat:FindFirstAncestorOfClass("Model")
		if not vehicle then return end

		local root = vehicle.PrimaryPart or seat
		if not root then return end

		root.AssemblyLinearVelocity += root.CFrame.LookVector * boostForce * 0.01
	end
end)
