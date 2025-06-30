local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "RenHub_VietHoa"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 320, 0, 380)
mainFrame.Position = UDim2.new(0, 20, 0, 20)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BorderSizePixel = 0
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 16)

local purpleBorder = Instance.new("Frame", mainFrame)
purpleBorder.Position = UDim2.new(0, -2, 0, -2)
purpleBorder.Size = UDim2.new(1, 4, 1, 4)
purpleBorder.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
purpleBorder.ZIndex = -1
Instance.new("UICorner", purpleBorder).CornerRadius = UDim.new(0, 18)

local titleBar = Instance.new("Frame", mainFrame)
titleBar.Size = UDim2.new(1, 0, 0, 45)
titleBar.BackgroundTransparency = 1

local titleLabel = Instance.new("TextLabel", titleBar)
titleLabel.Size = UDim2.new(1, -55, 1, 0)
titleLabel.Position = UDim2.new(0, 15, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "⚡ REN HUB VIỆT HÓA"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 18
titleLabel.TextXAlignment = Enum.TextXAlignment.Left

local minimizeBtn = Instance.new("TextButton", titleBar)
minimizeBtn.Size = UDim2.new(0, 35, 0, 35)
minimizeBtn.Position = UDim2.new(1, -45, 0, 5)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
minimizeBtn.Text = "−"
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 18
minimizeBtn.BorderSizePixel = 0
Instance.new("UICorner", minimizeBtn).CornerRadius = UDim.new(0, 8)

local tabFrame = Instance.new("Frame", mainFrame)
tabFrame.Size = UDim2.new(1, -20, 0, 40)
tabFrame.Position = UDim2.new(0, 10, 0, 50)
tabFrame.BackgroundTransparency = 1

local function createTab(parent, text, pos)
	local tab = Instance.new("TextButton", parent)
	tab.Size = UDim2.new(0.33, -7, 1, 0)
	tab.Position = pos
	tab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	tab.Text = text
	tab.TextColor3 = Color3.fromRGB(255, 255, 255)
	tab.Font = Enum.Font.GothamBold
	tab.TextSize = 14
	tab.BorderSizePixel = 0
	Instance.new("UICorner", tab).CornerRadius = UDim.new(0, 10)
	return tab
end

local tab1 = createTab(tabFrame, "CHÍNH", UDim2.new(0, 0, 0, 0))
local tab2 = createTab(tabFrame, "NHÌN XUYÊN", UDim2.new(0.33, 3, 0, 0))
local tab3 = createTab(tabFrame, "KHÁC", UDim2.new(0.66, 6, 0, 0))

local content1 = Instance.new("Frame", mainFrame)
content1.Size = UDim2.new(1, -20, 1, -100)
content1.Position = UDim2.new(0, 10, 0, 95)
content1.BackgroundTransparency = 1
content1.Visible = true

local content2 = content1:Clone()
content2.Parent = mainFrame
content2.Visible = false

local content3 = content1:Clone()
content3.Parent = mainFrame
content3.Visible = false

local function switchTab(tab)
	local inactive = Color3.fromRGB(20, 20, 20)
	local active = Color3.fromRGB(138, 43, 226)
	tab1.BackgroundColor3 = inactive
	tab2.BackgroundColor3 = inactive
	tab3.BackgroundColor3 = inactive
	tab1.TextColor3 = Color3.new(1, 1, 1)
	tab2.TextColor3 = Color3.new(1, 1, 1)
	tab3.TextColor3 = Color3.new(1, 1, 1)
	content1.Visible = false
	content2.Visible = false
	content3.Visible = false
	if tab == 1 then tab1.BackgroundColor3 = active content1.Visible = true
	elseif tab == 2 then tab2.BackgroundColor3 = active content2.Visible = true
	elseif tab == 3 then tab3.BackgroundColor3 = active content3.Visible = true end
end

tab1.MouseButton1Click:Connect(function() switchTab(1) end)
tab2.MouseButton1Click:Connect(function() switchTab(2) end)
tab3.MouseButton1Click:Connect(function() switchTab(3) end)
local function createButton(parent, text, position)
	local btn = Instance.new("TextButton", parent)
	btn.Size = UDim2.new(1, 0, 0, 45)
	btn.Position = position
	btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	btn.Text = text
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 16
	btn.BorderSizePixel = 0
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 12)
	
	btn.MouseEnter:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(138, 43, 226)}):Play()
	end)
	btn.MouseLeave:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(25, 25, 25)}):Play()
	end)

	return btn
end

-- Các nút chức năng
local btnFly = createButton(content1, "🛸 Bay", UDim2.new(0, 0, 0, 0))
local btnFlash = createButton(content1, "⚡ Flash", UDim2.new(0, 0, 0, 50))
local btnSpeed = createButton(content1, "🏃‍♂️ Chạy nhanh", UDim2.new(0, 0, 0, 100))
local btnNoclip = createButton(content1, "🚪 Xuyên tường", UDim2.new(0, 0, 0, 150))
local btnAntiKick = createButton(content1, "🛡️ Chống bị kick", UDim2.new(0, 0, 0, 200))

-- FLOAT / BAY
local flyOn = false
local bodyVel = nil
btnFly.MouseButton1Click:Connect(function()
	local char = player.Character or player.CharacterAdded:Wait()
	local root = char:WaitForChild("HumanoidRootPart")
	if not flyOn then
		bodyVel = Instance.new("BodyVelocity")
		bodyVel.Velocity = Vector3.new(0, 30, 0)
		bodyVel.MaxForce = Vector3.new(0, 1e5, 0)
		bodyVel.Parent = root
		btnFly.Text = "🛸 Đang bay"
		btnFly.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
	else
		if bodyVel then bodyVel:Destroy() end
		btnFly.Text = "🛸 Bay"
		btnFly.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	end
	flyOn = not flyOn
end)

-- FLASH (dịch chuyển nhanh)
btnFlash.MouseButton1Click:Connect(function()
	local char = player.Character
	if char and char:FindFirstChild("HumanoidRootPart") then
		char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + char.HumanoidRootPart.CFrame.LookVector * 50
		btnFlash.Text = "⚡ FLASH!"
		btnFlash.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
		task.wait(1)
		btnFlash.Text = "⚡ Flash"
		btnFlash.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	end
end)

-- SPEED
local speedOn = false
btnSpeed.MouseButton1Click:Connect(function()
	local hum = player.Character and player.Character:FindFirstChild("Humanoid")
	if hum then
		if speedOn then
			hum.WalkSpeed = 16
			btnSpeed.Text = "🏃‍♂️ Chạy nhanh"
			btnSpeed.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		else
			hum.WalkSpeed = 100
			btnSpeed.Text = "🏃‍♂️ Tốc độ x100"
			btnSpeed.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
		end
		speedOn = not speedOn
	end
end)

-- Noclip (xuyên tường mượt, không giựt lùi)
local noclip = false
btnNoclip.MouseButton1Click:Connect(function()
	noclip = not noclip
	if noclip then
		btnNoclip.Text = "🚪 Đang xuyên tường"
		btnNoclip.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
	else
		btnNoclip.Text = "🚪 Xuyên tường"
		btnNoclip.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	end
end)

RunService.Stepped:Connect(function()
	if noclip and player.Character then
		for _, part in pairs(player.Character:GetDescendants()) do
			if part:IsA("BasePart") and part.CanCollide == true then
				part.CanCollide = false
			end
		end
	end
end)

-- ANTI KICK
btnAntiKick.MouseButton1Click:Connect(function()
	btnAntiKick.Text = "🛡️ Đang bật..."
	btnAntiKick.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
	
	pcall(function()
		local mt = getrawmetatable(game)
		setreadonly(mt, false)
		local old = mt.__namecall
		mt.__namecall = newcclosure(function(self, ...)
			local args = {...}
			local method = getnamecallmethod()
			if method == "Kick" or tostring(method) == "kick" then
				return nil
			end
			return old(self, unpack(args))
		end)
	end)

	task.wait(1)
	btnAntiKick.Text = "🛡️ Anti Kick Bật"
	btnAntiKick.BackgroundColor3 = Color3.fromRGB(0, 255, 127)
end)
-- KHUNG THỨ 2: ESP
local espBtn = createButton(content2, "👁️ Bật ESP (nhìn xuyên)", UDim2.new(0, 0, 0, 0))
local espOn = false
local espList = {}

local function addESP(plr)
	if plr == player then return end
	if espList[plr] then return end
	local char = plr.Character or plr.CharacterAdded:Wait()
	local head = char:WaitForChild("Head")
	local gui = Instance.new("BillboardGui", CoreGui)
	gui.Adornee = head
	gui.AlwaysOnTop = true
	gui.Size = UDim2.new(0, 100, 0, 40)
	gui.StudsOffset = Vector3.new(0, 3, 0)

	local label = Instance.new("TextLabel", gui)
	label.Size = UDim2.new(1, 0, 1, 0)
	label.BackgroundTransparency = 1
	label.Text = "🔎 " .. plr.Name
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.TextStrokeColor3 = Color3.fromRGB(138, 43, 226)
	label.TextStrokeTransparency = 0
	label.TextScaled = true
	label.Font = Enum.Font.GothamBold

	espList[plr] = gui
end

local function clearESP()
	for _, gui in pairs(espList) do
		if gui then gui:Destroy() end
	end
	espList = {}
end

espBtn.MouseButton1Click:Connect(function()
	espOn = not espOn
	if espOn then
		espBtn.Text = "👁️ Đang bật ESP"
		espBtn.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
		for _, p in ipairs(Players:GetPlayers()) do
			addESP(p)
		end
	else
		clearESP()
		espBtn.Text = "👁️ Bật ESP (nhìn xuyên)"
		espBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	end
end)

-- KHUNG THỨ 3: PHÂN TÍCH NGƯỜI GIÀU NHẤT
local analyzeBtn = createButton(content3, "📊 Ai giàu nhất?", UDim2.new(0, 0, 0, 0))
analyzeBtn.MouseButton1Click:Connect(function()
	local max = 0
	local richest = "Không có dữ liệu"
	for _, p in ipairs(Players:GetPlayers()) do
		local stats = p:FindFirstChild("leaderstats")
		if stats and stats:FindFirstChild("Cash") then
			local val = tonumber(stats.Cash.Value)
			if val and val > max then
				max = val
				richest = p.Name
			end
		end
	end
	analyzeBtn.Text = "📊 Giàu nhất: " .. richest
	analyzeBtn.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
	task.wait(3)
	analyzeBtn.Text = "📊 Ai giàu nhất?"
	analyzeBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
end)

-- HIỆN THỜI GIAN HỒI VẬT PHẨM (COOLDOWN)
local function showCooldown(item)
	local label = Instance.new("TextLabel", screenGui)
	label.Size = UDim2.new(0, 180, 0, 30)
	label.Position = UDim2.new(1, -200, 1, -100 - (#screenGui:GetChildren() * 35))
	label.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	label.TextColor3 = Color3.new(1, 1, 1)
	label.Font = Enum.Font.GothamBold
	label.TextSize = 14
	label.Text = "⏱️ Đang chờ: " .. item.Name
	label.AnchorPoint = Vector2.new(0, 1)
	Instance.new("UICorner", label).CornerRadius = UDim.new(0, 8)
	
	task.delay(3, function()
		if label then label:Destroy() end
	end)
end

-- Theo dõi cooldown các item (Tool)
for _, tool in ipairs(player.Backpack:GetChildren()) do
	if tool:IsA("Tool") then
		tool.Activated:Connect(function()
			showCooldown(tool)
		end)
	end
end

player.Backpack.ChildAdded:Connect(function(tool)
	if tool:IsA("Tool") then
		tool.Activated:Connect(function()
			showCooldown(tool)
		end)
	end
end)
-- SERVER HOP
local serverhopBtn = createButton(content3, "🔁 Chuyển Server", UDim2.new(0, 0, 0, 50))

local function getServers()
	local success, result = pcall(function()
		return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
	end)
	local servers = {}
	if success and result and result.data then
		for _, s in ipairs(result.data) do
			if s.playing and s.id ~= game.JobId then
				table.insert(servers, s.id)
			end
		end
	end
	return servers
end

local function hopServer()
	serverhopBtn.Text = "🔁 Đang tìm server..."
	serverhopBtn.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
	local servers = getServers()
	if #servers > 0 then
		serverhopBtn.Text = "🔁 Đang chuyển..."
		serverhopBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 127)
		TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)])
	else
		serverhopBtn.Text = "❌ Không tìm thấy"
		serverhopBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		task.wait(2)
		serverhopBtn.Text = "🔁 Chuyển Server"
		serverhopBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	end
end

serverhopBtn.MouseButton1Click:Connect(hopServer)

-- MINIMIZE (THU NHỎ)
local minimized = false
minimizeBtn.MouseButton1Click:Connect(function()
	if minimized then
		mainFrame:TweenSize(UDim2.new(0, 320, 0, 380), "Out", "Quad", 0.3, true)
		tabFrame.Visible = true
		content1.Visible = currentTab == 1
		content2.Visible = currentTab == 2
		content3.Visible = currentTab == 3
		minimizeBtn.Text = "−"
	else
		mainFrame:TweenSize(UDim2.new(0, 320, 0, 45), "Out", "Quad", 0.3, true)
		tabFrame.Visible = false
		content1.Visible = false
		content2.Visible = false
		content3.Visible = false
		minimizeBtn.Text = "+"
	end
	minimized = not minimized
end)

-- DRAG GUI
local dragging = false
local dragStart, startPos

local function updateDrag(input)
	local delta = input.Position - dragStart
	mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
		startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

titleBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = mainFrame.Position
	end
end)

titleBar.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		updateDrag(input)
	end
end)

titleBar.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = false
	end
end)
