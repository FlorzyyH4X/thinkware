--// Raise A Peter

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/FlorzyyH4X/thinkware/main/core/ui.lua"))()
local GUI = Library.GUI(true)

local Farming = GUI.Tab("Farming")

local Interactables = game:GetService("Workspace").Interactables
local Peter = Interactables.Peter.Peter
local MoneyBills = Interactables.MoneyBills

getgenv().cashAutoCollect = false
getgenv().cashGet = false

Farming.Toggle("Cash Auto-Collect", function(State)
    getgenv().cashAutoCollect = State
end, false)

Farming.Toggle("Get Cash", function(State)
    getgenv().cashGet = State
end, false)

game:GetService("RunService").RenderStepped:Connect(function()
    if (getgenv().cashAutoCollect) then
        game:GetService("Players").LocalPlayer.Character:SetPrimaryPartCFrame(Peter.PrimaryPart.CFrame)
        fireclickdetector(Peter.Clickable.DropMoney, Peter.Clickable.DropMoney.MaxActivationDistance)
    end

    if (getgenv().cashGet) then
        for _, Money in next, MoneyBills:GetChildren() do
            firetouchinterest(game:GetService("Players").LocalPlayer.Character.Head, Money, 0)
            wait(.001)
            firetouchinterest(game:GetService("Players").LocalPlayer.Character.Head, Money, 1)
        end
    end
end)
