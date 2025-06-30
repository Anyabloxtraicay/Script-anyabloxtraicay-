local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer 
local playerGui = player:WaitForChild("PlayerGui")

local colors = {
    background = Color3.fromRGB(15, 15, 15),
    button = Color3.fromRGB(25, 25, 25),
    buttonHover = Color3.fromRGB(113, 33, 185),
    accent = Color3.fromRGB(113, 33, 185),
    text = Color3.fromRGB(255, 255, 255),
    success = Color3.fromRGB(0, 200, 83),
    warning = Color3.fromRGB(255, 165, 0),
    error = Color3.fromRGB(255, 69, 58)
}

local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "RenHubMobile"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 350, 0, 450)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -225)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = colors.background
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 16)

local border = Instance.new("Frame", mainFrame)
border.Position = UDim2.new(0, -2, 0, -2)
border.Size = UDim2.new(1, 4, 1, 4)
border.BackgroundColor3 = colors.accent
border.ZIndex = -1
Instance.new("UICorner", border).CornerRadius = UDim.new(0, 18)

local titleBar = Instance.new("Frame", mainFrame)
titleBar.Size = UDim2.new(1, 0, 0, 45)
titleBar.BackgroundTransparency = 1

local titleLabel = Instance.new("TextLabel", titleBar)
titleLabel.Size = UDim2.new(1, -55, 1, 0)
titleLabel.Position = UDim2.new(0, 15, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "⚡ REN HUB MOBILE"
titleLabel.TextColor3 = colors.text
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 18
titleLabel.TextXAlignment = Enum.TextXAlignment.Left

local minimizeBtn = Instance.new("TextButton", titleBar)
minimizeBtn.Size = UDim2.new(0, 35, 0, 35)
minimizeBtn.Position = UDim2.new(1, -45, 0, 5)
minimizeBtn.BackgroundColor3 = colors.button
minimizeBtn.Text = "−"
minimizeBtn.TextColor3 = colors.text
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 18
minimizeBtn.BorderSizePixel = 0
Instance.new("UICorner", minimizeBtn).CornerRadius = UDim.new(0, 8)
local tabFrame = Instance.new("Frame", mainFrame)
tabFrame.Size = UDim2.new(1, -20, 0, 40)
tabFrame.Position = UDim2.new(0, 10, 0, 50)
tabFrame.BackgroundTransparency = 1

local function createTab(parent, text, position)
    local tab = Instance.new("TextButton", parent)
    tab.Size = UDim2.new(0.33, -7, 1, 0)
    tab.Position = position
    tab.BackgroundColor3 = colors.button
    tab.Text = text
    tab.TextColor3 = colors.text
    tab.Font = Enum.Font.GothamBold
    tab.TextSize = 14
    tab.BorderSizePixel = 0
    Instance.new("UICorner", tab).CornerRadius = UDim.new(0, 10)
    return tab
end

local mainTab = createTab(tabFrame, "CHÍNH", UDim2.new(0, 0, 0, 0))
local espTab = createTab(tabFrame, "ESP", UDim2.new(0.33, 3, 0, 0))
local moreTab = createTab(tabFrame, "KHÁC", UDim2.new(0.66, 6, 0, 0))

local mainContent = Instance.new("ScrollingFrame", mainFrame)
mainContent.Size = UDim2.new(1, -20, 1, -100)
mainContent.Position = UDim2.new(0, 10, 0, 95)
mainContent.BackgroundTransparency = 1
mainContent.Visible = true
mainContent.ScrollBarThickness = 5
mainContent.CanvasSize = UDim2.new(0, 0, 0, 600)
mainContent.AutomaticCanvasSize = Enum.AutomaticSize.Y

local espContent = mainContent:Clone()
espContent.Parent = mainFrame
espContent.Visible = false

local moreContent = mainContent:Clone()
moreContent.Parent = mainFrame
moreContent.Visible = false

local currentTab = "Main"
local function switchTab(tab)
    mainTab.BackgroundColor3 = colors.button
    espTab.BackgroundColor3 = colors.button
    moreTab.BackgroundColor3 = colors.button
    mainContent.Visible = false
    espContent.Visible = false
    moreContent.Visible = false
    if tab == "Main" then
        mainTab.BackgroundColor3 = colors.accent
        mainContent.Visible = true
    elseif tab == "ESP" then
        espTab.BackgroundColor3 = colors.accent
        espContent.Visible = true
    elseif tab == "More" then
        moreTab.BackgroundColor3 = colors.accent
        moreContent.Visible = true
    end
    currentTab = tab
end

mainTab.MouseButton1Click:Connect(function() switchTab("Main") end)
espTab.MouseButton1Click:Connect(function() switchTab("ESP") end)
moreTab.MouseButton1Click:Connect(function() switchTab("More") end)

local function createButton(parent, text, position, size, icon)
    local button = Instance.new("TextButton", parent)
    button.Size = size or UDim2.new(1, 0, 0, 50)
    button.Position = position
    button.BackgroundColor3 = colors.button
    button.Text = (icon or "") .. " " .. text
    button.TextColor3 = colors.text
    button.Font = Enum.Font.GothamBold
    button.TextSize = 16
    button.BorderSizePixel = 0
    button.AutoButtonColor = false
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 12)
    button.MouseButton1Down:Connect(function()
        button.BackgroundColor3 = colors.accent
    end)
    button.MouseButton1Up:Connect(function()
        button.BackgroundColor3 = colors.buttonHover
        task.wait(0.2)
        button.BackgroundColor3 = colors.button
    end)
    return button
end
-- TĂNG TỐC
local speedBtn = createButton(mainContent, "⚡ TĂNG TỐC", UDim2.new(0, 0, 0, 0))
local speedOn = false
local originalWalkspeed
speedBtn.MouseButton1Click:Connect(function()
    local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
    if not humanoid then return end
    speedOn = not speedOn
    if speedOn then
        originalWalkspeed = humanoid.WalkSpeed
        humanoid.WalkSpeed = 75
        speedBtn.Text = "⚡ TĂNG TỐC ON"
        speedBtn.BackgroundColor3 = colors.success
    else
        humanoid.WalkSpeed = originalWalkspeed or 16
        speedBtn.Text = "⚡ TĂNG TỐC"
        speedBtn.BackgroundColor3 = colors.button
    end
end)

-- CHỐNG KICK
local antikickBtn = createButton(mainContent, "🛡️ ANTI KICK", UDim2.new(0, 0, 0, 60))
antikickBtn.MouseButton1Click:Connect(function()
    local mt = getrawmetatable(game)
    setreadonly(mt, false)
    local oldNameCall = mt.__namecall
    mt.__namecall = newcclosure(function(self, ...)
        if getnamecallmethod() == "Kick" then return nil end
        return oldNameCall(self, ...)
    end)
    antikickBtn.Text = "🛡️ ANTI KICK ON"
    antikickBtn.BackgroundColor3 = colors.success
end)

-- XUYÊN TƯỜNG
local noclipBtn = createButton(mainContent, "👻 XUYÊN TƯỜNG", UDim2.new(0, 0, 0, 120))
local noclip = false
local noclipConnection
noclipBtn.MouseButton1Click:Connect(function()
    noclip = not noclip
    if noclip then
        noclipConnection = RunService.Stepped:Connect(function()
            if player.Character then
                for _, part in pairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
        noclipBtn.Text = "👻 XUYÊN TƯỜNG ON"
        noclipBtn.BackgroundColor3 = colors.success
    else
        if noclipConnection then noclipConnection:Disconnect() end
        noclipBtn.Text = "👻 XUYÊN TƯỜNG"
        noclipBtn.BackgroundColor3 = colors.button
    end
end)

-- BAY
local flyBtn = createButton(mainContent, "🕊️ BAY", UDim2.new(0, 0, 0, 180))
local fly = false
flyBtn.MouseButton1Click:Connect(function()
    fly = not fly
    local char = player.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    if fly then
        local bv = Instance.new("BodyVelocity", root)
        bv.Name = "FlyVelocity"
        bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
        bv.Velocity = Vector3.new(0, 50, 0)
        flyBtn.Text = "🕊️ ĐANG BAY"
        flyBtn.BackgroundColor3 = colors.success
    else
        if root:FindFirstChild("FlyVelocity") then
            root.FlyVelocity:Destroy()
        end
        flyBtn.Text = "🕊️ BAY"
        flyBtn.BackgroundColor3 = colors.button
    end
end)
-- THU NHỎ GIAO DIỆN
local minimized = false
minimizeBtn.MouseButton1Click:Connect(function()
    if minimized then
        mainFrame:TweenSize(UDim2.new(0, 350, 0, 450), "Out", "Quad", 0.3, true)
        tabFrame.Visible = true
        switchTab(currentTab)
        minimizeBtn.Text = "−"
    else
        mainFrame:TweenSize(UDim2.new(0, 350, 0, 45), "Out", "Quad", 0.3, true)
        tabFrame.Visible = false
        mainContent.Visible = false
        espContent.Visible = false
        moreContent.Visible = false
        minimizeBtn.Text = "+"
    end
    minimized = not minimized
end)

-- KÉO GIAO DIỆN MOBILE
local dragging, dragStart, startPos = false
local function beginDrag(input)
    dragging = true
    dragStart = input.Position
    startPos = mainFrame.Position
end
local function updateDrag(input)
    if dragging then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end
local function endDrag() dragging = false end
titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        beginDrag(input)
    end
end)
titleBar.InputChanged:Connect(function(input)
    if dragging then updateDrag(input) end
end)
titleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        endDrag()
    end
end)

-- TÁC GIẢ
local creditsBtn = createButton(moreContent, "💜 TÁC GIẢ", UDim2.new(0, 0, 0, 0))
creditsBtn.MouseButton1Click:Connect(function()
    creditsBtn.Text = "💜 HurrySDM & Ren"
    creditsBtn.BackgroundColor3 = colors.accent
    task.wait(3)
    creditsBtn.Text = "💜 TÁC GIẢ"
    creditsBtn.BackgroundColor3 = colors.button
end)
