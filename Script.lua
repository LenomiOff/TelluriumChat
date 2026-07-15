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

local speedLimit = 300 -- studs/s
local speedLimiterEnabled = true

------------------------------------------------
-- GUI PRINCIPALE
------------------------------------------------
local gui = Instance.new("ScreenGui")
gui.Name = "ModernBoostGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

------------------------------------------------
-- MAIN FRAME
------------------------------------------------
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 280, 0, 270)
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
title.Size = UDim2.new(1,-85,1,0)
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
-- BOUTON POSITION (📍) dans la top bar
------------------------------------------------
local posBtn = Instance.new("TextButton")
posBtn.Size = UDim2.new(0,25,0,22)
posBtn.Position = UDim2.new(1,-55,0,4)
posBtn.Text = "📍"
posBtn.Font = Enum.Font.GothamBold
posBtn.TextSize = 14
posBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
posBtn.TextColor3 = Color3.new(1,1,1)
posBtn.AutoButtonColor = false
posBtn.Parent = topBar

Instance.new("UICorner", posBtn).CornerRadius = UDim.new(0,6)

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
-- SPEED LIMIT LABEL
------------------------------------------------

local speedLabel = Instance.new("TextLabel")
speedLabel.BackgroundTransparency = 1
speedLabel.Size = UDim2.new(1,0,0,20)
speedLabel.Position = UDim2.new(0,0,0,160)
speedLabel.Text = "Speed Limit : "..speedLimit.." studs/s"
speedLabel.Font = Enum.Font.Gotham
speedLabel.TextSize = 13
speedLabel.TextColor3 = Color3.new(1,1,1)
speedLabel.Parent = content

------------------------------------------------
-- SPEED LIMIT SLIDER
------------------------------------------------

local speedBG = Instance.new("Frame")
speedBG.Size = UDim2.new(1,-20,0,10)
speedBG.Position = UDim2.new(0,10,0,185)
speedBG.BackgroundColor3 = Color3.fromRGB(50,50,50)
speedBG.Parent = content

Instance.new("UICorner", speedBG).CornerRadius = UDim.new(1,0)

local speedFill = Instance.new("Frame")
speedFill.Size = UDim2.new(speedLimit/1000,0,1,0)
speedFill.BackgroundColor3 = Color3.fromRGB(255,60,60)
speedFill.Parent = speedBG

Instance.new("UICorner", speedFill).CornerRadius = UDim.new(1,0)

local speedButton = Instance.new("TextButton")
speedButton.Size = UDim2.new(0,18,0,18)
speedButton.Position = UDim2.new(speedLimit/1000,-9,0.5,-9)
speedButton.Text = ""
speedButton.BackgroundColor3 = Color3.new(1,1,1)
speedButton.Parent = speedBG

Instance.new("UICorner", speedButton).CornerRadius = UDim.new(1,0)

------------------------------------------------
-- TELEPORTS
------------------------------------------------
local tpLabel = Instance.new("TextLabel")
tpLabel.BackgroundTransparency = 1
tpLabel.Size = UDim2.new(1,0,0,20)
tpLabel.Position = UDim2.new(0,0,0,215)
tpLabel.Text = "Teleports"
tpLabel.Font = Enum.Font.Gotham
tpLabel.TextSize = 13
tpLabel.TextColor3 = Color3.new(1,1,1)
tpLabel.Parent = content

local teleports = {
	["Spawn City"] = Vector3.new(-721, 135, 20641),
	["Spawn Town"] = Vector3.new(60, 136, 533),
	["Secret Car Spawn (Town)"] = Vector3.new(-208, 136, 2737),
	["Secret Car Spawn (City)"] = Vector3.new(-1397, 135, 20477)
}

local currentTP = "Click here to TP"

local tpButton = Instance.new("TextButton")
tpButton.Size = UDim2.new(1,-20,0,30)
tpButton.Position = UDim2.new(0,10,0,240)
tpButton.Text = currentTP
tpButton.Font = Enum.Font.GothamBold
tpButton.TextSize = 13
tpButton.BackgroundColor3 = Color3.fromRGB(40,40,40)
tpButton.TextColor3 = Color3.new(1,1,1)
tpButton.Parent = content

Instance.new("UICorner", tpButton).CornerRadius = UDim.new(0,10)

local tpIndex = 1
local tpNames = {}

for name in pairs(teleports) do
	table.insert(tpNames, name)
end

tpButton.MouseButton1Click:Connect(function()
	tpIndex += 1
	if tpIndex > #tpNames then
		tpIndex = 1
	end
	currentTP = tpNames[tpIndex]
	tpButton.Text = currentTP

	local char = player.Character
	if char and char:FindFirstChild("HumanoidRootPart") then
		char.HumanoidRootPart.CFrame = CFrame.new(teleports[currentTP])
	end
end)

------------------------------------------------
-- GUI POSITION (panneau séparé)
------------------------------------------------
local posFrame = Instance.new("Frame")
posFrame.Size = UDim2.new(0, 300, 0, 100)
posFrame.Position = UDim2.new(0.5, -150, 0.5, 120)  -- en dessous du boost menu
posFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
posFrame.Visible = false  -- caché par défaut
posFrame.Parent = gui

Instance.new("UICorner", posFrame).CornerRadius = UDim.new(0,12)

-- TOP BAR position
local posTopBar = Instance.new("Frame")
posTopBar.Size = UDim2.new(1,0,0,30)
posTopBar.BackgroundColor3 = Color3.fromRGB(30,30,30)
posTopBar.Parent = posFrame

Instance.new("UICorner", posTopBar).CornerRadius = UDim.new(0,12)

-- TITLE position
local posTitle = Instance.new("TextLabel")
posTitle.Size = UDim2.new(1,-35,1,0)
posTitle.Position = UDim2.new(0,35,0,0)
posTitle.BackgroundTransparency = 1
posTitle.Text = "Position Copier"
posTitle.Font = Enum.Font.GothamBold
posTitle.TextSize = 14
posTitle.TextColor3 = Color3.new(1,1,1)
posTitle.TextXAlignment = Enum.TextXAlignment.Left
posTitle.Parent = posTopBar

local posMinimize = Instance.new("TextButton")
posMinimize.Size = UDim2.new(0,25,0,25)
posMinimize.Position = UDim2.new(0,5,0,2)
posMinimize.Text = ">"
posMinimize.Font = Enum.Font.GothamBold
posMinimize.TextSize = 18
posMinimize.BackgroundTransparency = 1
posMinimize.TextColor3 = Color3.new(1,1,1)
posMinimize.Parent = posTopBar

local posMinimized = false

posMinimize.MouseButton1Click:Connect(function()
    posMinimized = not posMinimized
    if posMinimized then
        box.Visible = false
        posFrame.Size = UDim2.new(0,300,0,30)
        posMinimize.Rotation = 90
    else
        box.Visible = true
        posFrame.Size = UDim2.new(0,300,0,100)
        posMinimize.Rotation = 0
    end
end)

-- BOUTON CROIX ×
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0,22,0,22)
closeBtn.Position = UDim2.new(1,-26,0,4)
closeBtn.Text = "×"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18
closeBtn.BackgroundColor3 = Color3.fromRGB(180,50,50)
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.AutoButtonColor = false
closeBtn.Parent = posTopBar

Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0,6)

-- TEXTBOX position
local box = Instance.new("TextBox")
box.Size = UDim2.new(1,-20,0,35)
box.Position = UDim2.new(0,10,0,38)
box.BackgroundColor3 = Color3.fromRGB(40,40,40)
box.TextColor3 = Color3.new(1,1,1)
box.Font = Enum.Font.Code
box.TextSize = 13
box.ClearTextOnFocus = false
box.TextEditable = false
box.Text = "En attente..."
box.Parent = posFrame

Instance.new("UICorner", box).CornerRadius = UDim.new(0,8)

------------------------------------------------
-- DRAG du panneau position
------------------------------------------------
local posDragging = false
local posMinimized = false
local posDragStart
local posStartPos

local posIgnoreDrag = false

posMinimize.MouseButton1Down:Connect(function()
    posIgnoreDrag = true
end)

posMinimize.Activated:Connect(function()
    posIgnoreDrag = false
    posMinimized = not posMinimized
    if posMinimized then
        box.Visible = false
        posFrame.Size = UDim2.new(0,300,0,30)
        posMinimize.Rotation = 90
    else
        box.Visible = true
        posFrame.Size = UDim2.new(0,300,0,100)
        posMinimize.Rotation = 0
    end
end)

posTopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 and not posIgnoreDrag then
        posDragging = true
        posDragStart = input.Position
        posStartPos = posFrame.Position
    end
end)

UIS.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		posDragging = false
	end
end)

UIS.InputChanged:Connect(function(input)
	if posDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - posDragStart
		posFrame.Position = UDim2.new(
			posStartPos.X.Scale,
			posStartPos.X.Offset + delta.X,
			posStartPos.Y.Scale,
			posStartPos.Y.Offset + delta.Y
		)
	end
end)

-- Bouton 📍 → afficher/cacher le panneau position
posBtn.MouseButton1Click:Connect(function()
	posFrame.Visible = not posFrame.Visible
end)

-- Bouton × → fermer le panneau position
closeBtn.MouseButton1Click:Connect(function()
	posFrame.Visible = false
end)

-- Click sur textbox → sélectionner tout pour copier
box.Focused:Connect(function()
	box:CaptureFocus()
	box.SelectionStart = 1
	box.CursorPosition = #box.Text + 1
end)

------------------------------------------------
-- DRAG fenêtre principale
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
		frame.Size = UDim2.new(0,280,0,330)
		minimize.Rotation = 0
	end
end)

-- BOUTON FERMER GUI PRINCIPALE
local closeMain = Instance.new("TextButton")
closeMain.Size = UDim2.new(0,22,0,22)
closeMain.Position = UDim2.new(1,-26,0,4)
closeMain.Text = "×"
closeMain.Font = Enum.Font.GothamBold
closeMain.TextSize = 18
closeMain.BackgroundColor3 = Color3.fromRGB(180,50,50)
closeMain.TextColor3 = Color3.new(1,1,1)
closeMain.AutoButtonColor = false
closeMain.Parent = topBar

Instance.new("UICorner", closeMain).CornerRadius = UDim.new(0,6)

closeMain.MouseButton1Click:Connect(function()
    gui.Enabled = false
end)

------------------------------------------------
-- BOOST TOGGLE
------------------------------------------------
toggle.MouseButton1Click:Connect(function()
	if not toggle.Active then return end
	enabled = not enabled
end)

------------------------------------------------
-- SLIDERS
------------------------------------------------
local boostSliding = false
local gravitySliding = false

local boostSliding = false
local gravitySliding = false
local speedSliding = false

boostButton.MouseButton1Down:Connect(function()
	boostSliding = true
end)

gravityButton.MouseButton1Down:Connect(function()
	gravitySliding = true
end)

speedButton.MouseButton1Down:Connect(function()
    speedSliding = true
end)

UIS.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		boostSliding = false
		gravitySliding = false
		boostSliding = false
		gravitySliding = false
		speedSliding = false
	end
end)

UIS.InputChanged:Connect(function(input)
	if input.UserInputType ~= Enum.UserInputType.MouseMovement then return end

	if boostSliding then
		local sizeX = math.clamp(
			(input.Position.X - boostBG.AbsolutePosition.X) / boostBG.AbsoluteSize.X,
			0, 1
		)
		boostFill.Size = UDim2.new(sizeX,0,1,0)
		boostButton.Position = UDim2.new(sizeX,-9,0.5,-9)
		boostForce = math.floor(sizeX * 5000)
		boostLabel.Text = "Boost Force : "..boostForce
	end

	if gravitySliding then
		local sizeX = math.clamp(
			(input.Position.X - gravityBG.AbsolutePosition.X) / gravityBG.AbsoluteSize.X,
			0, 1
		)
		gravityFill.Size = UDim2.new(sizeX,0,1,0)
		gravityButton.Position = UDim2.new(sizeX,-9,0.5,-9)
		gravityValue = math.floor(sizeX * 500)
		gravityLabel.Text = "Workspace Gravity : "..gravityValue
		
	end

	if speedSliding then

    local sizeX = math.clamp(
        (input.Position.X - speedBG.AbsolutePosition.X) / speedBG.AbsoluteSize.X,
        0,
        1
    )

    speedFill.Size = UDim2.new(sizeX,0,1,0)
    speedButton.Position = UDim2.new(sizeX,-9,0.5,-9)

    speedLimit = math.floor(100 + sizeX * 900)

    speedLabel.Text =
        "Speed Limit : "..speedLimit.." studs/s"

end
end)

------------------------------------------------
-- MAIN LOOP
------------------------------------------------
RunService.RenderStepped:Connect(function()

	-- Gravity
	if workspace.Gravity ~= gravityValue then
		workspace.Gravity = gravityValue
	end

	-- Mise à jour position dans le textbox
	local char = player.Character
	if char and char:FindFirstChild("HumanoidRootPart") then
		local pos = char.HumanoidRootPart.Position
		box.Text =
			"Vector3.new(" ..
			math.floor(pos.X) .. ", " ..
			math.floor(pos.Y) .. ", " ..
			math.floor(pos.Z) .. ")"
	end

	-- Humanoid check
	local character = player.Character
	if not character then return end

	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid then return end

	local seat = humanoid.SeatPart

	if not seat then
		enabled = false
		toggle.Text = "No Vehicle"
		toggle.BackgroundColor3 = Color3.fromRGB(80,80,80)
		toggle.Active = false
		return
	end

	toggle.Active = true

	if enabled then
		toggle.Text = "Boost ON"
		toggle.BackgroundColor3 = Color3.fromRGB(0,140,255)
	else
		toggle.Text = "Boost OFF"
		toggle.BackgroundColor3 = Color3.fromRGB(120,120,120)
	end

	if enabled and seat:IsA("VehicleSeat") and seat.Throttle > 0 then

    local vehicle = seat:FindFirstAncestorOfClass("Model")
    if not vehicle then return end

    local root = vehicle.PrimaryPart or seat
    if not root then return end

    local speed = root.AssemblyLinearVelocity.Magnitude

    if speed < speedLimit then
        root.AssemblyLinearVelocity +=
            root.CFrame.LookVector * boostForce * 0.01
    end

end
end)
