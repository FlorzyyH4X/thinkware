local UIM = {}
local CurrentTheme = "Light"

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local function GenerateTweenStyle(Time: number, EasingStyle: Enum.EasingStyle, EasingDirection: Enum.EasingDirection)
	return TweenInfo.new(Time, EasingStyle, EasingDirection)
end

local TweenStyle = GenerateTweenStyle(.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local function Tween(Instance: Instance, Properties: {}) TweenService:Create(Instance, TweenStyle, Properties):Play() end

function UIM.Gui(LoadVisual)
	local ThinkwareUI = Instance.new("ScreenGui")
	local Container = Instance.new("Frame")
	local Corners = Instance.new("UICorner")
	local Title = Instance.new("TextLabel")
	local Description = Instance.new("TextLabel")
	local ThemeMode = Instance.new("TextButton")
	local Corners_2 = Instance.new("UICorner")
	local Toggle = Instance.new("Frame")
	local Corners_3 = Instance.new("UICorner")
	local TabSwitches = Instance.new("ScrollingFrame")
	local Layout = Instance.new("UIListLayout")
	local Padding = Instance.new("UIPadding")
	local TabFrames = Instance.new("Frame")
	
	local function LightTheme()
		CurrentTheme = "Light"

		Tween(ThemeMode, {BackgroundColor3 = Color3.fromRGB(225, 225, 225)})
		Tween(Toggle, {BackgroundColor3 = Color3.fromRGB(30, 30, 30), Size = UDim2.new(0.5, 0, 1, 0)})
		Tween(Container, {BackgroundColor3 = Color3.fromRGB(255, 255, 255)})
		Tween(Title, {TextColor3 = Color3.fromRGB(0, 0, 0)})
		Tween(Description, {TextColor3 = Color3.fromRGB(0, 0, 0)})
		Tween(TabSwitches, {BackgroundColor3 = Color3.fromRGB(225, 225, 225), ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)})

		for _, Buttons in pairs(TabSwitches:GetChildren()) do
			if Buttons:IsA("GuiButton") then
				Tween(Buttons, {BackgroundColor3 = Color3.fromRGB(255, 255, 255), TextColor3 = Color3.fromRGB(0, 0, 0)})
			end
		end

		for _, Frames in pairs(TabFrames:GetChildren()) do
			Frames.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)

			for _, Buttons in pairs(Frames:GetChildren()) do
				if Buttons:IsA("GuiButton") then
					Tween(Buttons, {BackgroundColor3 = Color3.fromRGB(225, 225, 225), TextColor3 = Color3.fromRGB(0, 0, 0)})

					if Buttons:FindFirstChild("ToggleText") then
						Tween(Buttons.ToggleText, {TextColor3 = Color3.fromRGB(0, 0, 0)})
						Tween(Buttons.ThemeMode, {BackgroundColor3 = Color3.fromRGB(240, 240, 240)})
					end
				end
			end
		end
	end

	local function DarkTheme()
		CurrentTheme = "Dark"

		Tween(ThemeMode, {BackgroundColor3 = Color3.fromRGB(45, 45, 45)})
		Tween(Toggle, {BackgroundColor3 = Color3.fromRGB(255, 255, 255), Size = UDim2.new(1, 0, 1, 0)})
		Tween(Container, {BackgroundColor3 = Color3.fromRGB(25, 25, 25)})
		Tween(Title, {TextColor3 = Color3.fromRGB(255, 255, 255)})
		Tween(Description, {TextColor3 = Color3.fromRGB(255, 255, 255)})
		Tween(TabSwitches, {BackgroundColor3 = Color3.fromRGB(35, 35, 35), ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)})

		for _, Buttons in pairs(TabSwitches:GetChildren()) do
			if Buttons:IsA("GuiButton") then
				Tween(Buttons, {BackgroundColor3 = Color3.fromRGB(25, 25, 25), TextColor3 = Color3.fromRGB(255, 255, 255)})
			end
		end

		for _, Frames in pairs(TabFrames:GetChildren()) do
			Frames.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)

			for _, Buttons in pairs(Frames:GetChildren()) do
				if Buttons:IsA("GuiButton") then
					Tween(Buttons, {BackgroundColor3 = Color3.fromRGB(35, 35, 35), TextColor3 = Color3.fromRGB(255, 255, 255)})

					if Buttons:FindFirstChild("ToggleText") then
						Tween(Buttons.ToggleText, {TextColor3 = Color3.fromRGB(255, 255, 255)})
						Tween(Buttons.ThemeMode, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)})
					end
				end
			end
		end
	end

	ThinkwareUI.Name = "ThinkwareUI"
	ThinkwareUI.Parent = game:GetService("CoreGui")
	ThinkwareUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ThinkwareUI.ResetOnSpawn = false
	ThinkwareUI.IgnoreGuiInset = true

	Container.Name = "Container"
	Container.Parent = ThinkwareUI
	Container.AnchorPoint = Vector2.new(0.5, 0.5)
	Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Container.BorderSizePixel = 0
	Container.Position = UDim2.new(0.5, 0, 0.5, 0)
	Container.Size = UDim2.new(0, 416, 0, 236)

	local dragging
	local dragInput
	local dragStart
	local startPos

	local function Lerp(a, b, m)
		return a + (b - a) * m
	end

	local lastMousePos
	local DRAG_SPEED = 8

	local function Update(dt)
		if not (dragging) then return end
		if not (startPos) then return end

		local delta = (lastMousePos - UserInputService:GetMouseLocation())
		local xGoal = (startPos.X.Offset - delta.X)
		local yGoal = (startPos.Y.Offset - delta.Y)

		Container.Position = UDim2.new(startPos.X.Scale, Lerp(Container.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(Container.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
	end

	Container.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = Container.Position
			lastMousePos = UserInputService:GetMouseLocation()

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	Container.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	RunService.Heartbeat:Connect(Update)

	Corners.CornerRadius = UDim.new(0, 4)
	Corners.Name = "Corners"
	Corners.Parent = Container

	Title.Name = "Title"
	Title.Parent = Container
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0.036057692, 0, 0.0296610165, 0)
	Title.Size = UDim2.new(0, 97, 0, 29)
	Title.Font = Enum.Font.SourceSansLight
	Title.Text = "thinkware"
	Title.TextColor3 = Color3.fromRGB(0, 0, 0)
	Title.TextSize = 32.000

	Description.Name = "Description"
	Description.Parent = Title
	Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Description.BackgroundTransparency = 1.000
	Description.BorderSizePixel = 0
	Description.Position = UDim2.new(-0.0618556701, 0, 1, 0)
	Description.Size = UDim2.new(0, 52, 0, 17)
	Description.Font = Enum.Font.SourceSansItalic
	Description.Text = "a roblox ui"
	Description.TextColor3 = Color3.fromRGB(0, 0, 0)
	Description.TextSize = 14.000

	ThemeMode.Name = "ThemeMode"
	ThemeMode.Parent = Container
	ThemeMode.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
	ThemeMode.BorderSizePixel = 0
	ThemeMode.Position = UDim2.new(0.298000038, 0, 0.0800000206, 0)
	ThemeMode.Size = UDim2.new(0, 20, 0, 10)
	ThemeMode.Font = Enum.Font.SourceSans
	ThemeMode.Text = ""
	ThemeMode.TextColor3 = Color3.fromRGB(0, 0, 0)
	ThemeMode.TextSize = 14.000
	
	ThemeMode.MouseButton1Click:Connect(function()
		if CurrentTheme == "Light" then
			DarkTheme()
		elseif CurrentTheme == "Dark" then
			LightTheme()
		end
	end)

	Corners_2.CornerRadius = UDim.new(0, 3)
	Corners_2.Name = "Corners"
	Corners_2.Parent = ThemeMode

	Toggle.Name = "Toggle"
	Toggle.Parent = ThemeMode
	Toggle.Active = true
	Toggle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Toggle.BorderSizePixel = 0
	Toggle.Selectable = true
	Toggle.Size = UDim2.new(0.5, 0, 1, 0)

	Corners_3.CornerRadius = UDim.new(0, 3)
	Corners_3.Name = "Corners"
	Corners_3.Parent = Toggle

	TabSwitches.Name = "TabSwitches"
	TabSwitches.Parent = Container
	TabSwitches.Active = true
	TabSwitches.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
	TabSwitches.BorderSizePixel = 0
	TabSwitches.Position = UDim2.new(0.036057692, 0, 0.254237294, 0)
	TabSwitches.Size = UDim2.new(0, 90, 0, 165)
	TabSwitches.ScrollBarThickness = 2

	Layout.Name = "Layout"
	Layout.Parent = TabSwitches
	Layout.SortOrder = Enum.SortOrder.LayoutOrder
	Layout.Padding = UDim.new(0, 5)

	Padding.Name = "Padding"
	Padding.Parent = TabSwitches
	Padding.PaddingLeft = UDim.new(0, 4)
	Padding.PaddingTop = UDim.new(0, 5)

	TabFrames.Name = "TabFrames"
	TabFrames.Parent = Container
	TabFrames.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabFrames.BackgroundTransparency = 1.000
	TabFrames.BorderSizePixel = 0
	TabFrames.Position = UDim2.new(0.269230783, 0, 0.254237294, 0)
	TabFrames.Size = UDim2.new(0, 296, 0, 165)
	
	local UIM2 = {}
	
	function UIM2.Tab(TabName)
		local UIM3 = {}
		
		local Button_Tab = Instance.new("TextButton")
		local Corners = Instance.new("UICorner")

		Button_Tab.Name = "Button_Tab"
		Button_Tab.Parent = TabSwitches
		Button_Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Button_Tab.BorderSizePixel = 0
		Button_Tab.Size = UDim2.new(0, 80, 0, 25)
		Button_Tab.Font = Enum.Font.SourceSans
		Button_Tab.Text = TabName
		Button_Tab.TextColor3 = Color3.fromRGB(0, 0, 0)
		Button_Tab.TextSize = 14.000

		Corners.CornerRadius = UDim.new(0, 4)
		Corners.Name = "Corners"
		Corners.Parent = Button_Tab
		
		local ScrollingFrame = Instance.new("ScrollingFrame")
		ScrollingFrame.Parent = TabFrames
		ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
		ScrollingFrame.BorderSizePixel = 0
		ScrollingFrame.BackgroundTransparency = 1
		ScrollingFrame.ScrollBarThickness = 2
		ScrollingFrame.ScrollBarImageColor3 = (CurrentTheme == "Light") and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
		ScrollingFrame.Visible = false
		
		local E = Instance.new("UIListLayout")
		E.Parent = ScrollingFrame
		E.Name = "Layout"
		E.Padding = UDim.new(0, 5)
		
		Button_Tab.MouseButton1Click:Connect(function()
			for _, E in next, TabFrames:GetChildren() do
				E.Visible = false
			end
			
			ScrollingFrame.Visible = true
		end)
		
		function UIM3.Button(A, B)
			local B = B or function() end
			local Button = Instance.new("TextButton")

			Button.Name = "Button"
			Button.Parent = ScrollingFrame
			Button.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
			Button.BorderSizePixel = 0
			Button.Size = UDim2.new(0, 290, 0, 25)
			Button.Text = A
			Button.Font = Enum.Font.SourceSans
			Button.TextColor3 = Color3.fromRGB(0, 0, 0)
			Button.TextSize = 14.000
			
			Button.MouseButton1Click:Connect(function() pcall(B) end)
		end

		function UIM3.Toggle(A, B, C)
			local B = B or function() end
			local D = C or false
			
			local Toggle = Instance.new("TextButton")
			local ToggleText = Instance.new("TextLabel")
			local ThemeMode = Instance.new("TextButton")
			local Corners = Instance.new("UICorner")
			local Toggle_2 = Instance.new("Frame")
			local Corners_2 = Instance.new("UICorner")

			Toggle.Name = "Toggle"
			Toggle.Parent = ScrollingFrame
			Toggle.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
			Toggle.BorderSizePixel = 0
			Toggle.Size = UDim2.new(0, 290, 0, 25)
			Toggle.Font = Enum.Font.SourceSans
			Toggle.Text = ""
			Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
			Toggle.TextSize = 14.000

			ToggleText.Name = "ToggleText"
			ToggleText.Parent = Toggle
			ToggleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleText.BackgroundTransparency = 1.000
			ToggleText.BorderSizePixel = 0
			ToggleText.Position = UDim2.new(0.0274759233, 0, 0, 0)
			ToggleText.Size = UDim2.new(0.970000029, 0, 1, 0)
			ToggleText.Font = Enum.Font.SourceSans
			ToggleText.Text = A
			ToggleText.TextColor3 = Color3.fromRGB(0, 0, 0)
			ToggleText.TextSize = 14.000
			ToggleText.TextXAlignment = Enum.TextXAlignment.Left

			ThemeMode.Name = "ThemeMode"
			ThemeMode.Parent = Toggle
			ThemeMode.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
			ThemeMode.BorderSizePixel = 0
			ThemeMode.Position = UDim2.new(0.904896617, 0, 0.280000031, 0)
			ThemeMode.Size = UDim2.new(0, 20, 0, 10)
			ThemeMode.Font = Enum.Font.SourceSans
			ThemeMode.Text = ""
			ThemeMode.TextColor3 = Color3.fromRGB(0, 0, 0)
			ThemeMode.TextSize = 14.000

			Corners.CornerRadius = UDim.new(0, 3)
			Corners.Name = "Corners"
			Corners.Parent = ThemeMode

			Toggle_2.Name = "Toggle"
			Toggle_2.Parent = ThemeMode
			Toggle_2.Active = true
			Toggle_2.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
			Toggle_2.BorderSizePixel = 0
			Toggle_2.Selectable = true
			Toggle_2.Size = UDim2.new(0.5, 0, 1, 0)

			Corners_2.CornerRadius = UDim.new(0, 3)
			Corners_2.Name = "Corners"
			Corners_2.Parent = Toggle_2
			
			local function EA()
				if (D == true) then
					D = false
					pcall(B, D)
					Tween(Toggle_2, {Size = UDim2.new(0.5, 0, 1, 0), BackgroundColor3 = Color3.fromRGB(255, 60, 60)})
				else
					D = true
					pcall(B, D)
					Tween(Toggle_2, {Size = UDim2.new(1, 0, 1, 0), BackgroundColor3 = Color3.fromRGB(60, 255, 60)})
				end
			end
			
			Toggle.MouseButton1Click:Connect(EA)
			ThemeMode.MouseButton1Click:Connect(EA)
			
			if (D) then
				pcall(B, D)
				Tween(Toggle_2, {Size = UDim2.new(1, 0, 1, 0), BackgroundColor3 = Color3.fromRGB(60, 255, 60)})
			end
		end
		
		return UIM3
	end
	
	task.spawn(function()
		if LoadVisual then
			local TweenStyle = GenerateTweenStyle(0.75, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
			
			Container.Size = UDim2.new(0, 0, 0, 0)

			Title.Visible = false
			Description.Visible = false
			Title.TextTransparency = 1
			Description.TextTransparency = 1

			ThemeMode.Visible = false
			Toggle.Visible = false
			ThemeMode.BackgroundTransparency = 1
			Toggle.BackgroundTransparency = 1

			TabSwitches.Visible = false
			TabSwitches.BackgroundTransparency = 1

			for _, Buttons in pairs(TabSwitches:GetChildren()) do
				if Buttons:IsA("GuiButton") then
					Buttons.Visible = false
					Buttons.BackgroundTransparency = 1
				end
			end

			Container:TweenSize(UDim2.new(0, 100, 0, 100), TweenStyle.EasingDirection, TweenStyle.EasingStyle, TweenStyle.Time)
			wait(TweenStyle.Time)

			Container:TweenSize(UDim2.new(0, 416, 0, 236), TweenStyle.EasingDirection, TweenStyle.EasingStyle, TweenStyle.Time)
			wait(TweenStyle.Time)

			Title.Visible = true
			Description.Visible = true

			Tween(Title, {TextTransparency = 0})
			Tween(Description, {TextTransparency = 0})

			wait(TweenStyle.Time)

			ThemeMode.Visible = true
			Toggle.Visible = true

			Tween(ThemeMode, {BackgroundTransparency = 0})
			Tween(Toggle, {BackgroundTransparency = 0})

			TabSwitches.Visible = true
			Tween(TabSwitches, {BackgroundTransparency = 0})

			for _, Buttons in pairs(TabSwitches:GetChildren()) do
				if Buttons:IsA("GuiButton") then
					Buttons.Visible = true
					Tween(Buttons, {BackgroundTransparency = 0})
				end
			end
			
			local TweenStyle = GenerateTweenStyle(.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
		end
	end)
	
	return UIM2
end

return UIM
