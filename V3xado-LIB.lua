-- [[ V3xado LIBRARY ]] --
local V3X = {}
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

local function Tween(obj, props, time)
    TweenService:Create(obj, TweenInfo.new(time or 0.4, Enum.EasingStyle.Quint), props):Play()
end

function V3X:CreateWindow(Name)
    local ScreenGui = Instance.new("ScreenGui", CoreGui)
    ScreenGui.Name = "V3X_Premium_UI"

    -- Main Glass Panel
    local Main = Instance.new("Frame", ScreenGui)
    Main.Name = "Main"
    Main.Size = UDim2.fromOffset(550, 350)
    Main.Position = UDim2.fromScale(0.5, 0.5)
    Main.AnchorPoint = Vector2.new(0.5, 0.5)
    Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Main.BackgroundTransparency = 0.3 -- The iPhone Translucency
    Main.BorderSizePixel = 0
    
    local Corner = Instance.new("UICorner", Main)
    Corner.CornerRadius = UDim.new(0, 20)

    -- Frosted Glass Blur Effect
    local Blur = Instance.new("BlurEffect", game:GetService("Lighting"))
    Blur.Size = 20
    Blur.Name = "V3X_Blur"

    -- Sidebar (Translucent Grey)
    local Sidebar = Instance.new("Frame", Main)
    Sidebar.Size = UDim2.new(0, 160, 1, 0)
    Sidebar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Sidebar.BackgroundTransparency = 0.96
    Sidebar.BorderSizePixel = 0
    Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 20)

    local Title = Instance.new("TextLabel", Sidebar)
    Title.Text = Name or "V3XHUB"
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.TextColor3 = Color3.new(1, 1, 1)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 20
    Title.BackgroundTransparency = 1

    -- Container for Elements
    local Container = Instance.new("ScrollingFrame", Main)
    Container.Size = UDim2.new(1, -180, 1, -20)
    Container.Position = UDim2.fromOffset(170, 10)
    Container.BackgroundTransparency = 1
    Container.ScrollBarThickness = 0
    local Layout = Instance.new("UIListLayout", Container)
    Layout.Padding = UDim.new(0, 8)

    local Library = {}

    -- [[ TOGGLE COMPONENT ]] --
    function Library:CreateToggle(Text, Callback)
        local TFrame = Instance.new("Frame", Container)
        TFrame.Size = UDim2.new(1, 0, 0, 45)
        TFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TFrame.BackgroundTransparency = 0.95
        Instance.new("UICorner", TFrame).CornerRadius = UDim.new(0, 10)

        local Label = Instance.new("TextLabel", TFrame)
        Label.Text = Text
        Label.Size = UDim2.new(1, -60, 1, 0)
        Label.Position = UDim2.fromOffset(12, 0)
        Label.TextColor3 = Color3.fromRGB(220, 220, 220)
        Label.Font = Enum.Font.Gotham
        Label.TextSize = 14
        Label.TextXAlignment = "Left"
        Label.BackgroundTransparency = 1

        local Switch = Instance.new("TextButton", TFrame)
        Switch.Size = UDim2.fromOffset(40, 22)
        Switch.Position = UDim2.new(1, -50, 0.5, 0)
        Switch.AnchorPoint = Vector2.new(0, 0.5)
        Switch.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        Switch.Text = ""
        Instance.new("UICorner", Switch).CornerRadius = UDim.new(1, 0)

        local Dot = Instance.new("Frame", Switch)
        Dot.Size = UDim2.fromOffset(18, 18)
        Dot.Position = UDim2.fromOffset(2, 2)
        Dot.BackgroundColor3 = Color3.new(1, 1, 1)
        Instance.new("UICorner", Dot).CornerRadius = UDim.new(1, 0)

        local State = false
        Switch.MouseButton1Click:Connect(function()
            State = not State
            Tween(Switch, {BackgroundColor3 = State and Color3.fromRGB(48, 209, 88) or Color3.fromRGB(60, 60, 60)}, 0.2)
            Tween(Dot, {Position = State and UDim2.fromOffset(20, 2) or UDim2.fromOffset(2, 2)}, 0.2)
            Callback(State)
        end)
    end

    -- [[ SLIDER COMPONENT ]] --
    function Library:CreateSlider(Text, Min, Max, Default, Callback)
        local SFrame = Instance.new("Frame", Container)
        SFrame.Size = UDim2.new(1, 0, 0, 60)
        SFrame.BackgroundTransparency = 0.95
        SFrame.BackgroundColor3 = Color3.new(1, 1, 1)
        Instance.new("UICorner", SFrame).CornerRadius = UDim.new(0, 10)

        local Label = Instance.new("TextLabel", SFrame)
        Label.Text = Text
        Label.Position = UDim2.fromOffset(12, 10)
        Label.TextColor3 = Color3.new(1, 1, 1)
        Label.Font = Enum.Font.Gotham
        Label.TextSize = 13
        Label.BackgroundTransparency = 1

        local Bar = Instance.new("Frame", SFrame)
        Bar.Size = UDim2.new(0.9, 0, 0, 4)
        Bar.Position = UDim2.fromScale(0.5, 0.75)
        Bar.AnchorPoint = Vector2.new(0.5, 0.5)
        Bar.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        Bar.BorderSizePixel = 0
        
        local Fill = Instance.new("Frame", Bar)
        Fill.Size = UDim2.fromScale((Default - Min)/(Max - Min), 1)
        Fill.BackgroundColor3 = Color3.fromRGB(0, 122, 255)
        Fill.BorderSizePixel = 0

        -- Slider Logic would go here (Mouse handling)
    end

    return Library
end

return V3X
