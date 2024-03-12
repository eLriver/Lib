local Library = {State = true,FirstTab = nil,TabCount = 0}

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new
local mouse = game:GetService("Players").LocalPlayer:GetMouse()


local function MakeDraggable(ClickObject, Object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	ClickObject.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			Dragging = true
			DragStart = Input.Position
			StartPosition = Object.Position

			Input.Changed:Connect(function()
				if Input.UserInputState == Enum.UserInputState.End then
					Dragging = false
				end
			end)
		end
	end)

	ClickObject.InputChanged:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
			DragInput = Input
		end
	end)

	UserInputService.InputChanged:Connect(function(Input)
		if Input == DragInput and Dragging then
			local Delta = Input.Position - DragStart
			Object.Position = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
		end
	end)
end

local UiName = "EndLessRiver"
-- local numLetters = math.random(5,20) for i = 1,numLetters do UiName = UiName..string.char(math.random(97,122)) end

function Library:CreateWindow(Name, Parent)
    local WindowInit = {}
    local ScreenGui = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local MainCorner = Instance.new("UICorner")
    local PageSide = Instance.new("Frame")
    local PagesFolder = Instance.new("Folder")
    local TopBar = Instance.new("Frame")
    local ImageLabel = Instance.new("ImageLabel")
    local ImageCorner = Instance.new("UICorner")
    local TextLabel = Instance.new("TextLabel")
    local TopCorner = Instance.new("UICorner")
    local UIGradient = Instance.new("UIGradient")
    local GameName = Instance.new("TextLabel")
    local TabSide = Instance.new("Frame")
    local TabCorner = Instance.new("UICorner")
    local Tabs = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local UICorner = Instance.new("UICorner")

    local function ToggleUI()
        UserInputService.InputBegan:Connect(function (Input)
            if Input.KeyCode == Enum.KeyCode.RightControl and Library.State == true then
                Library.State = false
                game.CoreGui[UiName].Enabled = false
            else
                if Input.KeyCode == Enum.KeyCode.RightControl and Library.State == false then
                    Library.State = true
                    game.CoreGui[UiName].Enabled = true
                end
            end
        end)
    end

    MakeDraggable(TopBar, Main)
    ToggleUI()

    ScreenGui.Name = UiName
    ScreenGui.Parent = Parent or game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false

    Main.Name = "Main"
    Main.Parent = ScreenGui
    Main.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
    Main.BorderSizePixel = 0
    Main.ClipsDescendants = true
    Main.Position = UDim2.new(0, 660, 0, 255)
    Main.Size = UDim2.new(0, 600, 0, 400)
    Main.ZIndex = 2

    MainCorner.CornerRadius = UDim.new(0, 5)
    MainCorner.Name = "MainCorner"
    MainCorner.Parent = Main

    PageSide.Name = "PageSide"
    PageSide.Parent = Main
    PageSide.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
    PageSide.BorderColor3 = Color3.fromRGB(27, 42, 53)
    PageSide.BorderSizePixel = 0
    PageSide.Position = UDim2.new(0.300000012, 0, 0.075000003, 0)
    PageSide.Size = UDim2.new(0, 420, 0, 370)

    PagesFolder.Name = "PagesFolder"
    PagesFolder.Parent = PageSide

    TopBar.Name = "TopBar"
    TopBar.Parent = Main
    TopBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TopBar.BorderSizePixel = 0
    TopBar.ClipsDescendants = true
    TopBar.Size = UDim2.new(0, 600, 0, 30)

    ImageLabel.Parent = TopBar
    ImageLabel.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
    ImageLabel.BackgroundTransparency = 1.000
    ImageLabel.BorderSizePixel = 0
    ImageLabel.Size = UDim2.new(0, 50, 0, 30)
    ImageLabel.Image = "rbxassetid://9434260076"

    ImageCorner.CornerRadius = UDim.new(0, 5)
    ImageCorner.Name = "ImageCorner"
    ImageCorner.Parent = ImageLabel

    TextLabel.Parent = TopBar
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.BorderSizePixel = 0
    TextLabel.Position = UDim2.new(0, 45, 0, 0)
    TextLabel.Size = UDim2.new(0, 300, 0, 30)
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.Text = "EndLessRiver"
    TextLabel.TextColor3 = Color3.fromRGB(226, 226, 226)
    TextLabel.TextSize = 16.000
    TextLabel.TextWrapped = true
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left

    TopCorner.CornerRadius = UDim.new(0, 5)
    TopCorner.Name = "TopCorner"
    TopCorner.Parent = TopBar

    UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(31, 24, 40)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(158, 51, 83)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(234, 75, 123))}
    UIGradient.Parent = TopBar

    GameName.Name = "GameName"
    GameName.Parent = TopBar
    GameName.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
    GameName.BackgroundTransparency = 1.000
    GameName.BorderSizePixel = 0
    GameName.Position = UDim2.new(0, 265, 0, 0)
    GameName.Size = UDim2.new(0, 260, 0, 30)
    GameName.Font = Enum.Font.GothamBold
    GameName.Text = Name
    GameName.TextColor3 = Color3.fromRGB(226, 226, 226)
    GameName.TextSize = 16.000

    TabSide.Name = "TabSide"
    TabSide.Parent = Main
    TabSide.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
    TabSide.BorderSizePixel = 0
    TabSide.Position = UDim2.new(0, 0, 0, 30)
    TabSide.Size = UDim2.new(0, 180, 0, 370)
    TabSide.ClipsDescendants = true

    TabCorner.CornerRadius = UDim.new(0, 5)
    TabCorner.Name = "TabCorner"
    TabCorner.Parent = TabSide

    Tabs.Name = "Tabs"
    Tabs.Parent = TabSide
    Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Tabs.BackgroundTransparency = 1.000
    Tabs.Position = UDim2.new(0, 50, 0, 5)
    Tabs.Size = UDim2.new(0, 130, 0, 365)
    Tabs.ZIndex = 2

    UIListLayout.Parent = Tabs
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 2)

    UICorner.CornerRadius = UDim.new(0, 5)
    UICorner.Parent = PageSide

    local function FirstTab()
        for _,Page in pairs(PagesFolder:GetChildren()) do
            if Page:IsA("ScrollingFrame") then
                if Page.Name == Library.FirstTab.."Page" then
                    Page.Visible = true
                else
                    Page.Visible = false
                end
            end
        end
    end

    function WindowInit:CreateTab(Name)
        local TabInit = {}
        local TextButton = Instance.new("TextButton")
        local SelectedFrame = Instance.new("Frame")
        local UIGradient_2 = Instance.new("UIGradient")
        local TBLabel = Instance.new("TextLabel")
        local Page = Instance.new("ScrollingFrame")
        local UIListLayout_6 = Instance.new("UIListLayout")

        TextButton.Name = Name.."Tab"
        TextButton.Parent = Tabs
        TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextButton.BackgroundTransparency = 1.000
        TextButton.Size = UDim2.new(0, 130, 0, 30)
        TextButton.Text = ""
        TextButton.AutoButtonColor = false

        SelectedFrame.Name = Name.."S"
        SelectedFrame.Parent = TextButton
        SelectedFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SelectedFrame.BorderSizePixel = 0
        SelectedFrame.Position = UDim2.new(0, 130, 0, 0)
        SelectedFrame.Size = UDim2.new(0, 165, 0, 30)

        UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(182, 50, 95)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 136, 124))}
        UIGradient_2.Parent = SelectedFrame

        TBLabel.Name = "TBLabel"
        TBLabel.Parent = TextButton
        TBLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TBLabel.BackgroundTransparency = 1.000
        TBLabel.Position = UDim2.new(0, 0, 0, 0)
        TBLabel.Size = UDim2.new(0, 130, 0, 30)
        TBLabel.Font = Enum.Font.GothamBold
        TBLabel.Text = Name
        TBLabel.TextColor3 = Color3.fromRGB(226, 226, 226)
        TBLabel.TextSize = 16.000
        TBLabel.TextWrapped = true
        TBLabel.TextXAlignment = Enum.TextXAlignment.Left


        Page.Name = Name.."Page"
        Page.Parent = PagesFolder
        Page.Active = true
        Page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Page.BackgroundTransparency = 1.000
        Page.BorderSizePixel = 0
        Page.Size = UDim2.new(0, 420, 0, 370)
        Page.CanvasSize = UDim2.new(0, 0, 0, 0)
        Page.ScrollBarThickness = 5

        UIListLayout_6.Parent = Page
        UIListLayout_6.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout_6.SortOrder = Enum.SortOrder.LayoutOrder

        Library.TabCount = Library.TabCount + 1
        if Library.TabCount == 1 then
            Library.FirstTab = Name
        end

        local function UpdateSize()
            local cS = UIListLayout_6.AbsoluteContentSize
            TweenService:Create(Page, tweenInfo(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                CanvasSize = UDim2.new(0, cS.X, 0, cS.Y + 10)
            }):Play()
        end

        local function SelectedFirst()
            for _,v in pairs(Tabs:GetChildren()) do
                if v.Name == Library.FirstTab.."Tab" then
                    for _,s in pairs(v:GetChildren()) do
                        if s:IsA("Frame") then
                            TweenService:Create(s, tweenInfo(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                Position = UDim2.new(0, -35, 0, 0)
                            }):Play()
                        end
                    end
                end
            end
        end

        FirstTab()
        SelectedFirst()
        UpdateSize()

        TextButton.MouseButton1Click:Connect(function ()
            UpdateSize()
            for _,Page in pairs(PagesFolder:GetChildren()) do
                Page.Visible = false
            end
            Page.Visible = true
            for _,s in pairs(Tabs:GetChildren()) do
                for _,v in pairs(s:GetChildren()) do
                    if v:IsA("Frame") then
                        TweenService:Create(v, tweenInfo(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            Position = UDim2.new(0, 130, 0, 0)
                        }):Play()
                        wait(0.12)
                        TweenService:Create(SelectedFrame, tweenInfo(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            Position = UDim2.new(0, -35, 0, 0)
                        }):Play()
                    end
                end
            end
        end)

        function TabInit:CreateSection(Name)
            local SectionInit = {}
            local sectionFrame = Instance.new("Frame")
            local UIListLayout_2 = Instance.new("UIListLayout")
            local sectionHead = Instance.new("Frame")
            local TextLabel_2 = Instance.new("TextLabel")
            local sectionInner = Instance.new("ScrollingFrame")
            local UIListLayout_3 = Instance.new("UIListLayout")

            sectionFrame.Name = "sectionFrame"
            sectionFrame.Parent = Page
            sectionFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            sectionFrame.BackgroundTransparency = 1.000
            sectionFrame.BorderSizePixel = 0
            sectionFrame.Position = UDim2.new(0, 20, 0, -370)
            sectionFrame.Size = UDim2.new(0, 380, 0, 0)

            UIListLayout_2.Parent = sectionFrame
            UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
            UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_2.Padding = UDim.new(0, 5)

            sectionHead.Name = "sectionHead"
            sectionHead.Parent = sectionFrame
            sectionHead.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            sectionHead.BackgroundTransparency = 1.000
            sectionHead.BorderSizePixel = 0
            sectionHead.Size = UDim2.new(0, 380, 0, 30)

            TextLabel_2.Name = Name.."Sc"
            TextLabel_2.Parent = sectionHead
            TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_2.BackgroundTransparency = 1.000
            TextLabel_2.BorderSizePixel = 0
            TextLabel_2.Size = UDim2.new(0, 380, 0, 30)
            TextLabel_2.Font = Enum.Font.GothamBold
            TextLabel_2.Text = Name
            TextLabel_2.TextColor3 = Color3.fromRGB(226, 226, 226)
            TextLabel_2.TextSize = 16.000

            sectionInner.Name = "sectionInner"
            sectionInner.Parent = sectionFrame
            sectionInner.Active = true
            sectionInner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            sectionInner.BackgroundTransparency = 1.000
            sectionInner.BorderSizePixel = 0
            sectionInner.Position = UDim2.new(0, 0, 0.0472972989, 0)
            sectionInner.Size = UDim2.new(0, 380, 0, 705)
            sectionInner.CanvasSize = UDim2.new(0, 0, 0, 0)
            sectionInner.ScrollBarThickness = 5

            UIListLayout_3.Parent = sectionInner
            UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_3.Padding = UDim.new(0, 5)

            local function UpdateSection()
                local InnerSc = UIListLayout_3.AbsoluteContentSize
                sectionInner.Size = UDim2.new(0, 380, 0, InnerSc.Y)
                local FrameSc = UIListLayout_2.AbsoluteContentSize
                sectionFrame.Size = UDim2.new(0, 380, 0, FrameSc.Y)
            end

            UpdateSize()

            function SectionInit:CreateLabel(Name)
                local LabelInit = {}
                local LabelElement = Instance.new("Frame")
                local TextLabel_7 = Instance.new("TextLabel")
                local UICorner_9 = Instance.new("UICorner")
                local UIGradient_5 = Instance.new("UIGradient")

                LabelElement.Name = "LabelElement"
                LabelElement.Parent = sectionInner
                LabelElement.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                LabelElement.BorderSizePixel = 0
                LabelElement.Position = UDim2.new(0, 0, 0, 0)
                LabelElement.Size = UDim2.new(0, 380, 0, 25)

                TextLabel_7.Parent = LabelElement
                TextLabel_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_7.BackgroundTransparency = 1.000
                TextLabel_7.Position = UDim2.new(0, 15, 0, 0)
                TextLabel_7.Size = UDim2.new(0, 365, 0, 25)
                TextLabel_7.Font = Enum.Font.GothamBold
                TextLabel_7.Text = Name
                TextLabel_7.TextColor3 = Color3.fromRGB(226, 226, 226)
                TextLabel_7.TextSize = 16.000
                TextLabel_7.TextWrapped = true
                TextLabel_7.TextXAlignment = Enum.TextXAlignment.Left

                UICorner_9.CornerRadius = UDim.new(0, 5)
                UICorner_9.Parent = LabelElement

                UIGradient_5.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(31, 24, 40)), ColorSequenceKeypoint.new(0.57, Color3.fromRGB(158, 51, 83)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(234, 75, 123))}
                UIGradient_5.Parent = LabelElement

                UpdateSize()
                UpdateSection()

                function LabelInit:UpdateText(Text)
                    if TextLabel_7.Text ~= Text then
                        TextLabel_7.Text = Text
                    end
                end

                return LabelInit
            end
            function SectionInit:CreateButton(Name, Callback)
                local ButtonInit = {}
                local ButtonElement = Instance.new("TextButton")
                local UICorner_3 = Instance.new("UICorner")
                local TextLabel_4 = Instance.new("TextLabel")
                local UIGradient_3 = Instance.new("UIGradient")

                ButtonElement.Name = "ButtonElement"
                ButtonElement.Parent = sectionInner
                ButtonElement.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ButtonElement.BorderSizePixel = 0
                ButtonElement.Size = UDim2.new(0, 380, 0, 25)
                ButtonElement.AutoButtonColor = false
                ButtonElement.Font = Enum.Font.SourceSans
                ButtonElement.Text = ""
                ButtonElement.TextColor3 = Color3.fromRGB(0, 0, 0)
                ButtonElement.TextSize = 14.000

                UICorner_3.CornerRadius = UDim.new(0, 5)
                UICorner_3.Parent = ButtonElement

                TextLabel_4.Parent = ButtonElement
                TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_4.BackgroundTransparency = 1.000
                TextLabel_4.BorderSizePixel = 0
                TextLabel_4.Position = UDim2.new(0, 15, 0, 0)
                TextLabel_4.Size = UDim2.new(0, 360, 0, 25)
                TextLabel_4.Font = Enum.Font.GothamBold
                TextLabel_4.Text = Name
                TextLabel_4.TextColor3 = Color3.fromRGB(226, 226, 226)
                TextLabel_4.TextSize = 16.000
                TextLabel_4.TextXAlignment = Enum.TextXAlignment.Left

                UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(182, 50, 95)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 136, 124))}
                UIGradient_3.Parent = ButtonElement

                UpdateSize()
                UpdateSection()

                ButtonElement.MouseButton1Click:Connect(function ()
                    Callback()
                end)

                function ButtonInit:UpdateButton(Text)
                    TextLabel_4.Text = Text
                end

                return ButtonInit
            end

            function SectionInit:CreateToggle(Name, Info, Default, Callback)
                local ToggleInit = {}
                local ToggleinfoElement = Instance.new("TextButton")
                local UICorner_8 = Instance.new("UICorner")
                local TextLabel_6 = Instance.new("TextLabel")
                local toggleOff_2 = Instance.new("ImageLabel")
                local toggleOn_2 = Instance.new("ImageLabel")
                local infoFrame = Instance.new("Frame")
                local UIListLayout_50 = Instance.new("UIListLayout")

                ToggleinfoElement.Name = "ToggleinfoElement"
                ToggleinfoElement.Parent = sectionInner
                ToggleinfoElement.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
                ToggleinfoElement.BorderSizePixel = 0
                ToggleinfoElement.Position = UDim2.new(0, 0, 0.446808517, 0)
                ToggleinfoElement.Size = UDim2.new(0, 380, 0, 30)
                ToggleinfoElement.AutoButtonColor = false
                ToggleinfoElement.Font = Enum.Font.GothamBold
                ToggleinfoElement.Text = ""
                ToggleinfoElement.TextColor3 = Color3.fromRGB(226, 226, 226)
                ToggleinfoElement.TextSize = 16.000
                ToggleinfoElement.TextWrapped = true

                UICorner_8.CornerRadius = UDim.new(0, 5)
                UICorner_8.Parent = ToggleinfoElement

                TextLabel_6.Parent = ToggleinfoElement
                TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_6.BackgroundTransparency = 1.000
                TextLabel_6.Position = UDim2.new(0, 15, 0, 0)
                TextLabel_6.Size = UDim2.new(0, 270, 0, 30)
                TextLabel_6.Font = Enum.Font.GothamBold
                TextLabel_6.Text = Name
                TextLabel_6.TextColor3 = Color3.fromRGB(226, 226, 226)
                TextLabel_6.TextSize = 16.000
                TextLabel_6.TextXAlignment = Enum.TextXAlignment.Left

                toggleOff_2.Name = "toggleOff"
                toggleOff_2.Parent = ToggleinfoElement
                toggleOff_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                toggleOff_2.BackgroundTransparency = 1.000
                toggleOff_2.BorderSizePixel = 0
                toggleOff_2.Position = UDim2.new(0, 345, 0, 5)
                toggleOff_2.Size = UDim2.new(0, 20, 0, 20)
                toggleOff_2.Image = "rbxassetid://9436806283"
                toggleOff_2.Visible = true

                toggleOn_2.Name = "toggleOn"
                toggleOn_2.Parent = ToggleinfoElement
                toggleOn_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                toggleOn_2.BackgroundTransparency = 1.000
                toggleOn_2.BorderSizePixel = 0
                toggleOn_2.Position = UDim2.new(0, 345, 0, 5)
                toggleOn_2.Size = UDim2.new(0, 20, 0, 20)
                toggleOn_2.Image = "rbxassetid://9436808002"
                toggleOn_2.Visible = false

                infoFrame.Name = "infoFrame"
                infoFrame.Parent = ToggleinfoElement
                infoFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                infoFrame.BackgroundTransparency = 1.000
                infoFrame.Position = UDim2.new(0, 15, 0, 30)
                infoFrame.Size = UDim2.new(0, 365, 0, 0)
                infoFrame.ClipsDescendants = true

                UIListLayout_50.Parent = infoFrame
                UIListLayout_50.HorizontalAlignment = Enum.HorizontalAlignment.Center
                UIListLayout_50.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout_50.Padding = UDim.new(0, 0)

                if Info == nil then
                    Info = ""
                    infoFrame:Destroy()
                    ToggleinfoElement.Size = UDim2.new(0, 380, 0, 30)
                elseif Info == "" then
                    infoFrame:Destroy()
                    ToggleinfoElement.Size = UDim2.new(0, 380, 0, 30)
                elseif Info ~= nil or "" then
                    local info = Instance.new("TextLabel")

                    info.Name = "info"
                    info.Parent = infoFrame
                    info.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
                    info.BackgroundTransparency = 1.000
                    info.BorderSizePixel = 0
                    info.Position = UDim2.new(0, 0, 0, 0)
                    info.Size = UDim2.new(0, 365, 0, info.TextBounds.Y)
                    info.Font = Enum.Font.GothamBold
                    info.Text = Info
                    info.TextColor3 = Color3.fromRGB(190, 190, 190)
                    info.TextSize = 14.000
                    info.TextWrapped = true
                    info.TextXAlignment = Enum.TextXAlignment.Left

                    local s = UIListLayout_50.AbsoluteContentSize
                    ToggleinfoElement.Size = UDim2.new(0, 380, 0, 35 + s.Y)
                    infoFrame.Size = UDim2.new(0, 365, 0, 5 + s.Y)
                end

                local ToggleState = false

                if Default == "" or Default == false then
                    toggleOn_2.Visible = false
                elseif Default == true then
                    ToggleState = true
                    toggleOn_2.Visible = true
                end

                ToggleinfoElement.MouseButton1Click:Connect(function ()
                    if ToggleState == false then
                        TweenService:Create(toggleOn_2, tweenInfo(0.11, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            Visible = true
                        }):Play()
                    else
                        TweenService:Create(toggleOn_2, tweenInfo(0.11, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            Visible = false
                        }):Play()
                    end
                    ToggleState = not ToggleState
                    pcall(Callback, ToggleState)
                end)

                UpdateSize()
                UpdateSection()

                return ToggleInit
            end

            function SectionInit:CreateSlider(Name, Min, Max, Callback)
                local SliderInit = {}
                local sliderElement = Instance.new("TextButton")
                local sliderCorner = Instance.new("UICorner")
                local sdName = Instance.new("TextLabel")
                local SlideBtn = Instance.new("TextButton")
                local UICorner_4 = Instance.new("UICorner")
                local UIListLayout_4 = Instance.new("UIListLayout")
                local Slideliner = Instance.new("Frame")
                local UICorner_5 = Instance.new("UICorner")
                local UIGradient_4 = Instance.new("UIGradient")
                local Val = Instance.new("TextBox")
                local UICorner_6 = Instance.new("UICorner")

                sliderElement.Name = "sliderElement"
                sliderElement.Parent = sectionInner
                sliderElement.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
                sliderElement.Size = UDim2.new(0, 380, 0, 55)
                sliderElement.AutoButtonColor = false
                sliderElement.Font = Enum.Font.SourceSans
                sliderElement.Text = ""
                sliderElement.TextColor3 = Color3.fromRGB(0, 0, 0)
                sliderElement.TextSize = 14.000

                sliderCorner.CornerRadius = UDim.new(0, 5)
                sliderCorner.Name = "sliderCorner"
                sliderCorner.Parent = sliderElement

                sdName.Name = "sdName"
                sdName.Parent = sliderElement
                sdName.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
                sdName.BackgroundTransparency = 1.000
                sdName.BorderSizePixel = 0
                sdName.Position = UDim2.new(0, 10, 0, 0)
                sdName.Size = UDim2.new(0, 210, 0, 25)
                sdName.ZIndex = 14
                sdName.Font = Enum.Font.GothamBold
                sdName.Text = Name
                sdName.TextColor3 = Color3.fromRGB(226, 226, 226)
                sdName.TextSize = 16.000
                sdName.TextXAlignment = Enum.TextXAlignment.Left

                SlideBtn.Name = "SlideBtn"
                SlideBtn.Parent = sliderElement
                SlideBtn.BackgroundColor3 = Color3.fromRGB(104, 104, 104)
                SlideBtn.Position = UDim2.new(0, 5, 0, 40)
                SlideBtn.Size = UDim2.new(0, 370, 0, 5)
                SlideBtn.AutoButtonColor = false
                SlideBtn.Font = Enum.Font.SourceSans
                SlideBtn.Text = ""
                SlideBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
                SlideBtn.TextSize = 14.000

                UICorner_4.CornerRadius = UDim.new(0, 5)
                UICorner_4.Parent = SlideBtn

                UIListLayout_4.Parent = SlideBtn
                UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder

                Slideliner.Name = "Slideliner"
                Slideliner.Parent = SlideBtn
                Slideliner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Slideliner.BorderSizePixel = 0
                Slideliner.Position = UDim2.new(0, 5, 0, 40)
                Slideliner.Size = UDim2.new(0, 0, 0, 5)

                UICorner_5.CornerRadius = UDim.new(0, 5)
                UICorner_5.Parent = Slideliner

                UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(182, 50, 95)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 136, 124))}
                UIGradient_4.Parent = Slideliner

                Val.Name = "Val"
                Val.Parent = sliderElement
                Val.BackgroundColor3 = Color3.fromRGB(104, 104, 104)
                Val.BorderSizePixel = 0
                Val.Position = UDim2.new(0, 243, 0, 6)
                Val.Size = UDim2.new(0, 130, 0, 25)
                Val.Font = Enum.Font.GothamBold
                Val.PlaceholderColor3 = Color3.fromRGB(226, 226, 226)
                Val.Text = Min
                Val.TextColor3 = Color3.fromRGB(226, 226, 226)
                Val.TextSize = 16.000

                UICorner_6.CornerRadius = UDim.new(0, 5)
                UICorner_6.Parent = Val

                UpdateSize()
                UpdateSection()

                local Value
                local bfValue = Val.Text

                Val.FocusLost:Connect(function (enterPressed)
                    if not enterPressed then
                        return
                    elseif enterPressed then
                        Callback(Val.Text)
                        local Pos = 370 / Max
                        local OpL = Pos * Val.Text
                        Slideliner.Size = UDim2.new(0, OpL, 0, 5)
                    end
                end)

                SlideBtn.MouseButton1Down:Connect(function ()
                    Value = math.floor((((tonumber(Max) - tonumber(Min)) / 370) * Slideliner.AbsoluteSize.X) + tonumber(Min)) or 0
                    pcall(function()
                        Callback(Value)
                    end)
                    Slideliner:TweenSize(UDim2.new(0, math.clamp(mouse.X - Slideliner.AbsolutePosition.X, 0, 370), 0, 5), "InOut", "Linear", 0.05, true)
                    moveconnection = mouse.Move:Connect(function()
                        Val.Text = Value
                        Value = math.floor((((tonumber(Max) - tonumber(Min)) / 370) * Slideliner.AbsoluteSize.X) + tonumber(Min))
                        pcall(function()
                            Callback(Value)
                        end)
                        Slideliner:TweenSize(UDim2.new(0, math.clamp(mouse.X - Slideliner.AbsolutePosition.X, 0, 370), 0, 5), "InOut", "Linear", 0.05, true)
                    end)
                    unconnection = UserInputService.InputEnded:Connect(function(Mouse)
                        if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                            Value = math.floor((((tonumber(Max) - tonumber(Min)) / 370) * Slideliner.AbsoluteSize.X) + tonumber(Min))
                            pcall(function()
                                Callback(Value)
                            end)
                            Val.Text = Value
                            Slideliner:TweenSize(UDim2.new(0, math.clamp(mouse.X - Slideliner.AbsolutePosition.X, 0, 370), 0, 5), "InOut", "Linear", 0.05, true)
                                moveconnection:Disconnect()
                                unconnection:Disconnect()
                        end
                    end)
                end)

                return SliderInit
            end

            function SectionInit:CreateDropdown(Name, OptionTable, Callback)
                local DropdownInit = {}
                local DropDownElement = Instance.new("Frame")
                local DropDown = Instance.new("TextButton")
                local UICorner_7 = Instance.new("UICorner")
                local TextLabel_5 = Instance.new("TextLabel")
                local ImageLabel_2 = Instance.new("ImageLabel")
                local ScrollingDrop = Instance.new("ScrollingFrame")
                local DropFrame = Instance.new("Frame")
                local OptionFrame = Instance.new("Frame")
                local UIListLayout_5 = Instance.new("UIListLayout")

                DropDownElement.Name = "DropDownElement"
                DropDownElement.Parent = sectionInner
                DropDownElement.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropDownElement.BackgroundTransparency = 1.000
                DropDownElement.BorderSizePixel = 0
                DropDownElement.ClipsDescendants = true
                DropDownElement.Size = UDim2.new(0, 380, 0, 25)

                DropDown.Name = "DropDown"
                DropDown.Parent = DropDownElement
                DropDown.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
                DropDown.BorderSizePixel = 0
                DropDown.Size = UDim2.new(0, 380, 0, 25)
                DropDown.ZIndex = 2
                DropDown.AutoButtonColor = false
                DropDown.Font = Enum.Font.SourceSans
                DropDown.Text = ""
                DropDown.TextColor3 = Color3.fromRGB(0, 0, 0)
                DropDown.TextSize = 14.000

                UICorner_7.CornerRadius = UDim.new(0, 5)
                UICorner_7.Parent = DropDown

                TextLabel_5.Parent = DropDown
                TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_5.BackgroundTransparency = 1.000
                TextLabel_5.BorderSizePixel = 0
                TextLabel_5.Position = UDim2.new(0, 15, 0, 0)
                TextLabel_5.Size = UDim2.new(0, 360, 0, 25)
                TextLabel_5.Font = Enum.Font.GothamBold
                TextLabel_5.Text = Name
                TextLabel_5.TextColor3 = Color3.fromRGB(226, 226, 226)
                TextLabel_5.TextSize = 16.000
                TextLabel_5.TextXAlignment = Enum.TextXAlignment.Left

                ImageLabel_2.Parent = DropDown
                ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ImageLabel_2.BackgroundTransparency = 1.000
                ImageLabel_2.BorderSizePixel = 0
                ImageLabel_2.Position = UDim2.new(0, 355, 0, 5)
                ImageLabel_2.Rotation = 0.000
                ImageLabel_2.Size = UDim2.new(0, 15, 0, 15)
                ImageLabel_2.Image = "rbxassetid://9437002990"

                ScrollingDrop.Name = "ScrollingDrop"
                ScrollingDrop.Parent = DropDownElement
                ScrollingDrop.Active = true
                ScrollingDrop.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
                ScrollingDrop.BorderSizePixel = 0
                ScrollingDrop.Position = UDim2.new(0, 0, 0, 25)
                ScrollingDrop.Size = UDim2.new(0, 380, 0, 160)
                ScrollingDrop.CanvasSize = UDim2.new(0, 0, 0, 0)
                ScrollingDrop.ScrollBarThickness = 5
                ScrollingDrop.Visible = true

                DropFrame.Name = "DropFrame"
                DropFrame.Parent = ScrollingDrop
                DropFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropFrame.BackgroundTransparency = 1.000
                DropFrame.Position = UDim2.new(0, 0, 0, 5)
                DropFrame.Size = UDim2.new(0, 380, 0, 155)

                OptionFrame.Name = "OptionFrame"
                OptionFrame.Parent = DropFrame
                OptionFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                OptionFrame.BackgroundTransparency = 1.000
                OptionFrame.BorderSizePixel = 0
                OptionFrame.Position = UDim2.new(0, 30, 0, 0)
                OptionFrame.Size = UDim2.new(0, 330, 0, 0)
                OptionFrame.ClipsDescendants = true

                UIListLayout_5.Parent = OptionFrame
                UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout_5.Padding = UDim.new(0, 2)

                UpdateSection()
                UpdateSize()

                local DropOpening = false

                DropDown.MouseButton1Click:Connect(function ()
                    if DropOpening then
                        DropOpening = false
                        ImageLabel_2.Rotation = 0.000
                        DropDownElement:TweenSize(UDim2.new(0, 380,0, 25), "InOut", "Linear", 0.08)
                        ScrollingDrop.CanvasSize = UDim2.new(0, 0, 0, 0)
                        ScrollingDrop.Visible = false
                        OptionFrame.Size = UDim2.new(0, 330, 0, 0)
                        wait(0.1)
                        UpdateSection()
                        UpdateSize()
                    else
                        DropOpening = true
                        ScrollingDrop.Visible = true
                        ImageLabel_2.Rotation = 90.000
                        DropDownElement:TweenSize(UDim2.new(0, 380,0, 180), "InOut", "Linear", 0.08)
                        ScrollingDrop.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_5.AbsoluteContentSize.Y + 10)
                        OptionFrame.Size = UDim2.new(0, 330, 0, UIListLayout_5.AbsoluteContentSize.Y)
                        wait(0.1)
                        UpdateSection()
                        UpdateSize()
                    end
                end)

                for _,OptionName in pairs(OptionTable) do
                    local Option = Instance.new("TextButton")

                    Option.Name = "thingselect"
                    Option.Parent = OptionFrame
                    Option.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
                    Option.BackgroundTransparency = 1.000
                    Option.BorderSizePixel = 0
                    Option.Position = UDim2.new(0, 0, 0, 0)
                    Option.Size = UDim2.new(0, 330, 0, 25)
                    Option.ZIndex = 2
                    Option.AutoButtonColor = false
                    Option.Font = Enum.Font.GothamBold
                    Option.Text = OptionName
                    Option.TextColor3 = Color3.fromRGB(226, 226, 226)
                    Option.TextSize = 14.000
                    Option.TextXAlignment = Enum.TextXAlignment.Left
                    Option.ClipsDescendants = true

                    Option.MouseButton1Click:Connect(function ()
                        TextLabel_5.Text = OptionName
                        DropOpening = false
                        DropDownElement:TweenSize(UDim2.new(0, 380,0, 25), "InOut", "Linear", 0.08)
                        ScrollingDrop.CanvasSize = UDim2.new(0, 0, 0, 0)
                        OptionFrame.Size = UDim2.new(0, 330, 0, 0)
                        ImageLabel_2.Rotation = 0.000
                        ScrollingDrop.Visible = false
                        Callback(OptionName)
                        wait(0.1)
                        UpdateSection()
                        UpdateSize()
                    end)
                end

                function DropdownInit:Refresh(newOptionTable)
                    newOptionTable = newOptionTable or {}
                    for i,v in next, OptionFrame:GetChildren() do
                        if v.Name == "thingselect" then
                            v:Destroy()
                        end
                    end
                    for i,v in pairs(newOptionTable) do
                        local Option = Instance.new("TextButton")

                        Option.Name = "thingselect"
                        Option.Parent = OptionFrame
                        Option.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
                        Option.BackgroundTransparency = 1.000
                        Option.BorderSizePixel = 0
                        Option.Position = UDim2.new(0, 0, 0, 0)
                        Option.Size = UDim2.new(0, 330, 0, 25)
                        Option.ZIndex = 2
                        Option.AutoButtonColor = false
                        Option.Font = Enum.Font.GothamBold
                        Option.Text = v
                        Option.TextColor3 = Color3.fromRGB(226, 226, 226)
                        Option.TextSize = 14.000
                        Option.TextXAlignment = Enum.TextXAlignment.Left
                        Option.ClipsDescendants = true
    
                        Option.MouseButton1Click:Connect(function ()
                            TextLabel_5.Text = v
                            DropOpening = false
                            DropDownElement:TweenSize(UDim2.new(0, 380,0, 25), "InOut", "Linear", 0.08)
                            ScrollingDrop.CanvasSize = UDim2.new(0, 0, 0, 0)
                            OptionFrame.Size = UDim2.new(0, 330, 0, 0)
                            ImageLabel_2.Rotation = 0.000
                            ScrollingDrop.Visible = false
                            Callback(v)
                            wait(0.1)
                            UpdateSection()
                            UpdateSize()
                        end)
                        UpdateSection()
                        UpdateSize()
                    end
                    if DropOpening then
                        ScrollingDrop.Visible = true
                        ImageLabel_2.Rotation = 90.000
                        DropDownElement:TweenSize(UDim2.new(0, 380,0, 180), "InOut", "Linear", 0.08)
                        ScrollingDrop.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_5.AbsoluteContentSize.Y + 10)
                        OptionFrame.Size = UDim2.new(0, 330, 0, UIListLayout_5.AbsoluteContentSize.Y)
                        wait(0.1)
                        UpdateSection()
                        UpdateSize()
                    else
                        ImageLabel_2.Rotation = 0.000
                        DropDownElement:TweenSize(UDim2.new(0, 380,0, 25), "InOut", "Linear", 0.08)
                        ScrollingDrop.CanvasSize = UDim2.new(0, 0, 0, 0)
                        ScrollingDrop.Visible = false
                        OptionFrame.Size = UDim2.new(0, 330, 0, 0)
                        wait(0.1)
                        UpdateSection()
                        UpdateSize()
                    end
                end
                return DropdownInit
            end

            function SectionInit:CreateSearchBox(Name, OptionTable, Callback)
                local SearchBoxInit = {}
                local SearchBoxElement = Instance.new("Frame")
                local Dropdowner = Instance.new("TextButton")
                local UICorner = Instance.new("UICorner")
                local TextLabel = Instance.new("TextLabel")
                local ImageLabel = Instance.new("ImageLabel")
                local DropScrolling = Instance.new("ScrollingFrame")
                local DownFrame = Instance.new("Frame")
                local Things = Instance.new("Frame")
                local UIListLayout = Instance.new("UIListLayout")
                local SearchBox = Instance.new("TextBox")
                local UICorner_2 = Instance.new("UICorner")

                SearchBoxElement.Name = "SearchBoxElement"
                SearchBoxElement.Parent = sectionInner
                SearchBoxElement.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SearchBoxElement.BackgroundTransparency = 1.000
                SearchBoxElement.BorderSizePixel = 0
                SearchBoxElement.ClipsDescendants = true
                SearchBoxElement.Position = UDim2.new(0, 0, 0, 0)
                SearchBoxElement.Size = UDim2.new(0, 380, 0, 25)

                Dropdowner.Name = "Dropdowner"
                Dropdowner.Parent = SearchBoxElement
                Dropdowner.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
                Dropdowner.BorderSizePixel = 0
                Dropdowner.Size = UDim2.new(0, 380, 0, 25)
                Dropdowner.ZIndex = 2
                Dropdowner.AutoButtonColor = false
                Dropdowner.Font = Enum.Font.SourceSans
                Dropdowner.Text = ""
                Dropdowner.TextColor3 = Color3.fromRGB(0, 0, 0)
                Dropdowner.TextSize = 14.000

                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = Dropdowner

                TextLabel.Parent = Dropdowner
                TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel.BackgroundTransparency = 1.000
                TextLabel.BorderSizePixel = 0
                TextLabel.Position = UDim2.new(0, 15, 0, 0)
                TextLabel.Size = UDim2.new(0, 360, 0, 25)
                TextLabel.Font = Enum.Font.GothamBold
                TextLabel.Text = Name
                TextLabel.TextColor3 = Color3.fromRGB(226, 226, 226)
                TextLabel.TextSize = 16.000
                TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                TextLabel.Visible = true

                ImageLabel.Parent = Dropdowner
                ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ImageLabel.BackgroundTransparency = 1.000
                ImageLabel.BorderSizePixel = 0
                ImageLabel.Position = UDim2.new(0, 355, 0, 5)
                ImageLabel.Rotation = 0.000
                ImageLabel.Size = UDim2.new(0, 15, 0, 15)
                ImageLabel.Image = "rbxassetid://9437002990"

                DropScrolling.Name = "DropScrolling"
                DropScrolling.Parent = SearchBoxElement
                DropScrolling.Active = true
                DropScrolling.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
                DropScrolling.BorderSizePixel = 0
                DropScrolling.Position = UDim2.new(0, 0, 0, 25)
                DropScrolling.Size = UDim2.new(0, 380, 0, 160)
                DropScrolling.CanvasSize = UDim2.new(0, 0, 0, 0)
                DropScrolling.ScrollBarThickness = 5
                DropScrolling.Visible = true

                DownFrame.Name = "DownFrame"
                DownFrame.Parent = DropScrolling
                DownFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DownFrame.BackgroundTransparency = 1.000
                DownFrame.Position = UDim2.new(0, 0, 0, 5)
                DownFrame.Size = UDim2.new(0, 380, 0, 155)

                Things.Name = "Things"
                Things.Parent = DownFrame
                Things.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Things.BackgroundTransparency = 1.000
                Things.BorderSizePixel = 0
                Things.ClipsDescendants = true
                Things.Position = UDim2.new(0, 30, 0, 0)
                Things.Size = UDim2.new(0, 330, 0, 0)

                UIListLayout.Parent = Things
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout.Padding = UDim.new(0, 2)

                SearchBox.Name = "SearchBox"
                SearchBox.Parent = SearchBoxElement
                SearchBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SearchBox.BackgroundTransparency = 1.000
                SearchBox.Position = UDim2.new(0, 15, 0, 0)
                SearchBox.Size = UDim2.new(0, 335, 0, 25)
                SearchBox.ZIndex = 2
                SearchBox.Font = Enum.Font.GothamBold
                SearchBox.PlaceholderColor3 = Color3.fromRGB(226, 226, 226)
                SearchBox.PlaceholderText = ""
                SearchBox.Text = ""
                SearchBox.TextColor3 = Color3.fromRGB(226, 226, 226)
                SearchBox.TextSize = 16.000
                SearchBox.TextXAlignment = Enum.TextXAlignment.Left
                SearchBox.Visible = false

                UICorner_2.CornerRadius = UDim.new(0, 5)
                UICorner_2.Parent = SearchBox

                UpdateSection()
                UpdateSize()

                local DropOpening = false

                local function TextCheck()
                    for _,v in pairs(sectionInner:GetChildren()) do
                        if v.Name == "SearchBoxElement" then
                            for _,v in pairs(v:GetChildren()) do
                                if v.Name == "SearchBox" then
                                    if v.Text == "" then
                                        TextLabel.Visible = true
                                    else
                                        TextLabel.Visible = false
                                    end
                                end
                            end
                        end
                    end
                end

                local function UpdateInputOfSearchText()
                    local InputText = string.upper(SearchBox.Text)
                    for _,button in pairs(Things:GetChildren()) do
                        if button:IsA("TextButton") then
                            if InputText == "" or string.find(string.upper(button.Name),InputText) ~= nil then
                                button.Visible = true
                            else
                                button.Visible = false
                            end
                        end
                    end
                end

                Dropdowner.MouseButton1Click:Connect(function()
                    if DropOpening then
                        DropOpening = false
                        ImageLabel.Rotation = 0.000
                        SearchBoxElement:TweenSize(UDim2.new(0, 380,0, 25), "InOut", "Linear", 0.08)
                        DropScrolling.CanvasSize = UDim2.new(0, 0, 0, 0)
                        DropScrolling.Visible = false
                        Things.Size = UDim2.new(0, 330, 0, 0)

                        SearchBox.Visible = false

                        wait(0.1)
                        UpdateSection()
                        UpdateSize()
                    else
                        DropOpening = true
                        DropScrolling.Visible = true
                        ImageLabel.Rotation = 90.000
                        SearchBoxElement:TweenSize(UDim2.new(0, 380,0, 180), "InOut", "Linear", 0.08)
                        DropScrolling.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
                        Things.Size = UDim2.new(0, 330, 0, UIListLayout.AbsoluteContentSize.Y)

                        SearchBox.Visible = true
                        if SearchBox.Changed then
                            SearchBox.Changed:Connect(TextCheck)
                            SearchBox.Changed:Connect(UpdateInputOfSearchText)
                        end

                        wait(0.1)
                        UpdateSection()
                        UpdateSize()
                    end
                end)

                for _,OptionName in pairs(OptionTable) do
                    local Option = Instance.new("TextButton")

                    Option.Name = "thingselect"
                    Option.Parent = Things
                    Option.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
                    Option.BackgroundTransparency = 1.000
                    Option.BorderSizePixel = 0
                    Option.Position = UDim2.new(0, 0, 0, 0)
                    Option.Size = UDim2.new(0, 330, 0, 25)
                    Option.ZIndex = 2
                    Option.AutoButtonColor = false
                    Option.Font = Enum.Font.GothamBold
                    Option.Text = OptionName
                    Option.TextColor3 = Color3.fromRGB(226, 226, 226)
                    Option.TextSize = 14.000
                    Option.TextXAlignment = Enum.TextXAlignment.Left
                    Option.ClipsDescendants = true

                    Option.MouseButton1Click:Connect(function ()
                        TextLabel.Text = OptionName
                        SearchBox.Text = ""
                        DropOpening = false
                        SearchBoxElement:TweenSize(UDim2.new(0, 380,0, 25), "InOut", "Linear", 0.08)
                        DropScrolling.CanvasSize = UDim2.new(0, 0, 0, 0)
                        Things.Size = UDim2.new(0, 330, 0, 0)
                        ImageLabel.Rotation = 0.000
                        DropScrolling.Visible = false
                        SearchBox.Visible = false
                        Callback(OptionName)
                        wait(0.1)
                        UpdateSection()
                        UpdateSize()
                    end)
                end

                function SearchBoxInit:Refresh(newOptionTable)
                    newOptionTable = newOptionTable or {}
                    for i,v in next, Things:GetChildren() do
                        if v.Name == "thingselect" then
                            v:Destroy()
                        end
                    end
                    for i,v in pairs(newOptionTable) do
                        local Option = Instance.new("TextButton")

                        Option.Name = "thingselect"
                        Option.Parent = Things
                        Option.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
                        Option.BackgroundTransparency = 1.000
                        Option.BorderSizePixel = 0
                        Option.Position = UDim2.new(0, 0, 0, 0)
                        Option.Size = UDim2.new(0, 330, 0, 25)
                        Option.ZIndex = 2
                        Option.AutoButtonColor = false
                        Option.Font = Enum.Font.GothamBold
                        Option.Text = v
                        Option.TextColor3 = Color3.fromRGB(226, 226, 226)
                        Option.TextSize = 14.000
                        Option.TextXAlignment = Enum.TextXAlignment.Left
                        Option.ClipsDescendants = true
    
                        Option.MouseButton1Click:Connect(function ()
                            TextLabel.Text = v
                            SearchBox.Text = ""
                            DropOpening = false
                            SearchBoxElement:TweenSize(UDim2.new(0, 380,0, 25), "InOut", "Linear", 0.08)
                            DropScrolling.CanvasSize = UDim2.new(0, 0, 0, 0)
                            Things.Size = UDim2.new(0, 330, 0, 0)
                            ImageLabel.Rotation = 0.000
                            DropScrolling.Visible = false
                            SearchBox.Visible = false
                            Callback(v)
                            wait(0.1)
                            UpdateSection()
                            UpdateSize()
                        end)
                        UpdateSection()
                        UpdateSize()
                    end
                    if DropOpening then
                        DropScrolling.Visible = true
                        ImageLabel.Rotation = 90.000
                        SearchBoxElement:TweenSize(UDim2.new(0, 380,0, 180), "InOut", "Linear", 0.08)
                        DropScrolling.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
                        Things.Size = UDim2.new(0, 330, 0, UIListLayout.AbsoluteContentSize.Y)

                        SearchBox.Visible = true
                        if SearchBox.Changed then
                            SearchBox.Changed:Connect(TextCheck)
                            SearchBox.Changed:Connect(UpdateInputOfSearchText)
                        end

                        wait(0.1)
                        UpdateSection()
                        UpdateSize()
                    else
                        ImageLabel.Rotation = 0.000
                        SearchBoxElement:TweenSize(UDim2.new(0, 380,0, 25), "InOut", "Linear", 0.08)
                        DropScrolling.CanvasSize = UDim2.new(0, 0, 0, 0)
                        DropScrolling.Visible = false
                        Things.Size = UDim2.new(0, 330, 0, 0)

                        SearchBox.Visible = false

                        wait(0.1)
                        UpdateSection()
                        UpdateSize()
                    end
                end
                return SearchBoxInit
            end

            function SectionInit:CreateDropSelect(Name, OptionTable, Callback)
                local DropSelectInit = {}
                local SelectCb = {}
                local DropSelectElement = Instance.new("Frame")
                local Dropdowner = Instance.new("TextButton")
                local UICorner = Instance.new("UICorner")
                local TextLabel = Instance.new("TextLabel")
                local ImageLabel = Instance.new("ImageLabel")
                local DropScrolling = Instance.new("ScrollingFrame")
                local DownFrame = Instance.new("Frame")
                local Things = Instance.new("Frame")
                local UIListLayout = Instance.new("UIListLayout")
                local SearchBox = Instance.new("TextBox")
                local UICorner_3 = Instance.new("UICorner")

                DropSelectElement.Name = "DropSelectElement"
                DropSelectElement.Parent = sectionInner
                DropSelectElement.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropSelectElement.BackgroundTransparency = 1.000
                DropSelectElement.BorderSizePixel = 0
                DropSelectElement.ClipsDescendants = true
                DropSelectElement.Position = UDim2.new(0, 0, 0, 0)
                DropSelectElement.Size = UDim2.new(0, 380, 0, 25)

                Dropdowner.Name = "Dropdowner"
                Dropdowner.Parent = DropSelectElement
                Dropdowner.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
                Dropdowner.BorderSizePixel = 0
                Dropdowner.Size = UDim2.new(0, 380, 0, 25)
                Dropdowner.ZIndex = 2
                Dropdowner.AutoButtonColor = false
                Dropdowner.Font = Enum.Font.SourceSans
                Dropdowner.Text = ""
                Dropdowner.TextColor3 = Color3.fromRGB(0, 0, 0)
                Dropdowner.TextSize = 14.000

                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = Dropdowner

                TextLabel.Parent = Dropdowner
                TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel.BackgroundTransparency = 1.000
                TextLabel.BorderSizePixel = 0
                TextLabel.Position = UDim2.new(0, 15, 0, 0)
                TextLabel.Size = UDim2.new(0, 360, 0, 25)
                TextLabel.Font = Enum.Font.GothamBold
                TextLabel.Text = Name
                TextLabel.TextColor3 = Color3.fromRGB(226, 226, 226)
                TextLabel.TextSize = 16.000
                TextLabel.TextXAlignment = Enum.TextXAlignment.Left

                ImageLabel.Parent = Dropdowner
                ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ImageLabel.BackgroundTransparency = 1.000
                ImageLabel.BorderSizePixel = 0
                ImageLabel.Position = UDim2.new(0, 355, 0, 5)
                ImageLabel.Rotation = 0.000
                ImageLabel.Size = UDim2.new(0, 15, 0, 15)
                ImageLabel.Image = "rbxassetid://9437002990"

                DropScrolling.Name = "DropScrolling"
                DropScrolling.Parent = DropSelectElement
                DropScrolling.Active = true
                DropScrolling.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
                DropScrolling.BorderSizePixel = 0
                DropScrolling.Position = UDim2.new(0, 0, 0, 25)
                DropScrolling.Size = UDim2.new(0, 380, 0, 160)
                DropScrolling.CanvasSize = UDim2.new(0, 0, 0, 0)
                DropScrolling.ScrollBarThickness = 5

                DownFrame.Name = "DownFrame"
                DownFrame.Parent = DropScrolling
                DownFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DownFrame.BackgroundTransparency = 1.000
                DownFrame.Position = UDim2.new(0, 0, 0, 5)
                DownFrame.Size = UDim2.new(0, 380, 0, 155)

                Things.Name = "Things"
                Things.Parent = DownFrame
                Things.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Things.BackgroundTransparency = 1.000
                Things.BorderSizePixel = 0
                Things.ClipsDescendants = true
                Things.Position = UDim2.new(0, 15, 0, 0)
                Things.Size = UDim2.new(0, 350, 0, 0)

                UIListLayout.Parent = Things
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout.Padding = UDim.new(0, 2)

                SearchBox.Name = "SearchBox"
                SearchBox.Parent = DropSelectElement
                SearchBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SearchBox.BackgroundTransparency = 1.000
                SearchBox.Position = UDim2.new(0, 15, 0, 0)
                SearchBox.Size = UDim2.new(0, 335, 0, 25)
                SearchBox.Visible = false
                SearchBox.ZIndex = 2
                SearchBox.Font = Enum.Font.GothamBold
                SearchBox.PlaceholderColor3 = Color3.fromRGB(226, 226, 226)
                SearchBox.Text = ""
                SearchBox.TextColor3 = Color3.fromRGB(226, 226, 226)
                SearchBox.TextSize = 16.000
                SearchBox.TextXAlignment = Enum.TextXAlignment.Left

                UICorner_3.CornerRadius = UDim.new(0, 5)
                UICorner_3.Parent = SearchBox

                UpdateSection()
                UpdateSize()

                local DropOpening = false

                local function TextCheck()
                    for _,v in pairs(sectionInner:GetChildren()) do
                        if v.Name == "DropSelectElement" then
                            for _,v in pairs(v:GetChildren()) do
                                if v.Name == "SearchBox" then
                                    if v.Text == "" then
                                        TextLabel.Visible = true
                                    else
                                        TextLabel.Visible = false
                                    end
                                end
                            end
                        end
                    end
                end

                local function UpdateInputOfSearchText()
                    local InputText = string.upper(SearchBox.Text)
                    for _,button in pairs(Things:GetChildren()) do
                        if button:IsA("Frame") then
                            if InputText == "" or string.find(string.upper(button.Name),InputText) ~= nil then
                                button.Visible = true
                            else
                                button.Visible = false
                            end
                        end
                    end
                end

                Dropdowner.MouseButton1Click:Connect(function()
                    if DropOpening then
                        DropOpening = false
                        ImageLabel.Rotation = 0.000
                        DropSelectElement:TweenSize(UDim2.new(0, 380,0, 25), "InOut", "Linear", 0.08)
                        DropScrolling.CanvasSize = UDim2.new(0, 0, 0, 0)
                        DropScrolling.Visible = false
                        Things.Size = UDim2.new(0, 330, 0, 0)

                        SearchBox.Visible = false
                        SearchBox.Text = ""

                        wait(0.1)
                        UpdateSection()
                        UpdateSize()
                    else
                        DropOpening = true
                        DropScrolling.Visible = true
                        ImageLabel.Rotation = 90.000
                        DropSelectElement:TweenSize(UDim2.new(0, 380,0, 180), "InOut", "Linear", 0.08)
                        DropScrolling.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
                        Things.Size = UDim2.new(0, 330, 0, UIListLayout.AbsoluteContentSize.Y)

                        SearchBox.Visible = true
                        if SearchBox.Changed then
                            SearchBox.Changed:Connect(TextCheck)
                            SearchBox.Changed:Connect(UpdateInputOfSearchText)
                        end

                        wait(0.1)
                        UpdateSection()
                        UpdateSize()
                    end
                end)


                for _,OptionName in pairs(OptionTable) do
                    local ThingOp = Instance.new("Frame")
                    local selecting = Instance.new("Frame")
                    local UICorner_2 = Instance.new("UICorner")
                    local Red = Instance.new("UIGradient")
                    local thingselect = Instance.new("TextButton")

                    ThingOp.Name = "ThingOp"
                    ThingOp.Parent = Things
                    ThingOp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ThingOp.BackgroundTransparency = 1.000
                    ThingOp.BorderSizePixel = 0
                    ThingOp.Size = UDim2.new(0, 350, 0, 25)

                    selecting.Name = "selecting"
                    selecting.Parent = ThingOp
                    selecting.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    selecting.BorderSizePixel = 0
                    selecting.Position = UDim2.new(0, 5, 0, 5)
                    selecting.Size = UDim2.new(0, 5, 0, 0) -- Y = 15
                    selecting.Visible = true

                    UICorner_2.CornerRadius = UDim.new(0, 5)
                    UICorner_2.Parent = selecting

                    Red.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(182, 50, 95)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 136, 124))}
                    Red.Name = "Red"
                    Red.Parent = selecting

                    thingselect.Name = OptionName
                    thingselect.Parent = ThingOp
                    thingselect.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
                    thingselect.BackgroundTransparency = 1.000
                    thingselect.BorderSizePixel = 0
                    thingselect.Position = UDim2.new(0, 15, 0, 0)
                    thingselect.Size = UDim2.new(0, 330, 0, 25)
                    thingselect.ZIndex = 2
                    thingselect.AutoButtonColor = false
                    thingselect.Font = Enum.Font.GothamBold
                    thingselect.Text = OptionName
                    thingselect.TextColor3 = Color3.fromRGB(226, 226, 226)
                    thingselect.TextSize = 14.000
                    thingselect.TextXAlignment = Enum.TextXAlignment.Left

                    local function removeindex(array, index)
                        for i,v in pairs(array) do
                            if v == index then
                                table.remove(array, i)
                            end
                        end
                    end

                    thingselect.MouseButton1Click:Connect(function()
                        if selecting.Size == UDim2.new(0, 5, 0, 0) then
                            selecting:TweenSize(UDim2.new(0, 5, 0, 15), "InOut", "Linear", 0.08)
                            table.insert(SelectCb, thingselect.Name)
                        else
                            selecting:TweenSize(UDim2.new(0, 5, 0, 0), "InOut", "Linear", 0.08)
                            removeindex(SelectCb, thingselect.Name)
                        end
                        Callback(SelectCb)
                        wait(0.1)
                        UpdateSection()
                        UpdateSize()
                    end)
                end

                function DropSelectInit:Refresh(newOptionTable)
                    newOptionTable = newOptionTable or {}
                    for i,v in next, Things:GetChildren() do
                        if v.Name == "ThingOp" then
                            v:Destroy()
                        end
                    end
                    for i,v in pairs(newOptionTable) do
                        local ThingOp = Instance.new("Frame")
                        local selecting = Instance.new("Frame")
                        local UICorner_2 = Instance.new("UICorner")
                        local Red = Instance.new("UIGradient")
                        local thingselect = Instance.new("TextButton")
    
                        ThingOp.Name = "ThingOp"
                        ThingOp.Parent = Things
                        ThingOp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        ThingOp.BackgroundTransparency = 1.000
                        ThingOp.BorderSizePixel = 0
                        ThingOp.Size = UDim2.new(0, 350, 0, 25)
    
                        selecting.Name = "selecting"
                        selecting.Parent = ThingOp
                        selecting.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        selecting.BorderSizePixel = 0
                        selecting.Position = UDim2.new(0, 5, 0, 5)
                        selecting.Size = UDim2.new(0, 5, 0, 0) -- Y = 15
                        selecting.Visible = true
    
                        UICorner_2.CornerRadius = UDim.new(0, 5)
                        UICorner_2.Parent = selecting
    
                        Red.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(182, 50, 95)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 136, 124))}
                        Red.Name = "Red"
                        Red.Parent = selecting
    
                        thingselect.Name = v
                        thingselect.Parent = ThingOp
                        thingselect.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
                        thingselect.BackgroundTransparency = 1.000
                        thingselect.BorderSizePixel = 0
                        thingselect.Position = UDim2.new(0, 15, 0, 0)
                        thingselect.Size = UDim2.new(0, 330, 0, 25)
                        thingselect.ZIndex = 2
                        thingselect.AutoButtonColor = false
                        thingselect.Font = Enum.Font.GothamBold
                        thingselect.Text = v
                        thingselect.TextColor3 = Color3.fromRGB(226, 226, 226)
                        thingselect.TextSize = 14.000
                        thingselect.TextXAlignment = Enum.TextXAlignment.Left
    
                        local function removeindex(array, index)
                            for i,v in pairs(array) do
                                if v == index then
                                    table.remove(array, i)
                                end
                            end
                        end
    
                        thingselect.MouseButton1Click:Connect(function()
                            if selecting.Size == UDim2.new(0, 5, 0, 0) then
                                selecting:TweenSize(UDim2.new(0, 5, 0, 15), "InOut", "Linear", 0.08)
                                table.insert(SelectCb, thingselect.Name)
                            else
                                selecting:TweenSize(UDim2.new(0, 5, 0, 0), "InOut", "Linear", 0.08)
                                removeindex(SelectCb, thingselect.Name)
                            end
                            Callback(SelectCb)
                            wait(0.1)
                            UpdateSection()
                            UpdateSize()
                        end)
                        UpdateSection()
                        UpdateSize()
                    end
                    if DropOpening then
                        DropScrolling.Visible = true
                        ImageLabel.Rotation = 90.000
                        DropSelectElement:TweenSize(UDim2.new(0, 380,0, 180), "InOut", "Linear", 0.08)
                        DropScrolling.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
                        Things.Size = UDim2.new(0, 330, 0, UIListLayout.AbsoluteContentSize.Y)

                        SearchBox.Visible = true
                        if SearchBox.Changed then
                            SearchBox.Changed:Connect(TextCheck)
                            SearchBox.Changed:Connect(UpdateInputOfSearchText)
                        end

                        wait(0.1)
                        UpdateSection()
                        UpdateSize()
                    else
                        ImageLabel.Rotation = 0.000
                        DropSelectElement:TweenSize(UDim2.new(0, 380,0, 25), "InOut", "Linear", 0.08)
                        DropScrolling.CanvasSize = UDim2.new(0, 0, 0, 0)
                        DropScrolling.Visible = false
                        Things.Size = UDim2.new(0, 330, 0, 0)

                        SearchBox.Visible = false
                        SearchBox.Text = ""

                        wait(0.1)
                        UpdateSection()
                        UpdateSize()
                    end
                end
                return DropSelectInit
            end
            return SectionInit
        end
        return TabInit
    end
    return WindowInit
end
return Library
