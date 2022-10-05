if MASK_LOADED == true then return end
getgenv().MASK_LOADED = true

local player = game:service"Players".LocalPlayer
local Item, ItemName = '[Surgeon Mask] - $25', 'Mask'
local function BuyMask()
    local oldpos = player.Character.HumanoidRootPart.CFrame
    repeat
        player.Character.HumanoidRootPart.CFrame = workspace.Ignored.Shop:FindFirstChild(Item).Head.CFrame*CFrame.new(0,1.5,0)
        fireclickdetector(workspace.Ignored.Shop:FindFirstChild(Item):FindFirstChild("ClickDetector"))
        wait(0.001)
    until player.Character:FindFirstChild(ItemName) or player.Backpack:FindFirstChild(ItemName)
    player.Character.HumanoidRootPart.CFrame = oldpos
    if player.Character:FindFirstChild(ItemName) or player.Backpack:FindFirstChild(ItemName) then
        return true
    else
        return false
    end
end

function MaskCmd(val)
    if val:lower() == 'on' then
        if player.DataFolder.Currency.Value >= 25 then
            if not player.Character:FindFirstChild(ItemName) or player.Backpack:FindFirstChild(ItemName) then
                local data = BuyMask()
                if data == true then
                    local mask = player.Character:FindFirstChild(ItemName) or player.Backpack:FindFirstChild(ItemName)
                    if mask then
                        if player.Backpack:FindFirstChild(ItemName) then
                            player.Backpack:FindFirstChild(ItemName).Parent = player.Character
                        end
                        player.Character:FindFirstChild(ItemName):Activate()
                        wait(.5)
                        if player.Character:FindFirstChild("In-gameMask"):FindFirstChild("Handle") then
                            player.Character:FindFirstChild("In-gameMask"):FindFirstChild("Handle"):Destroy()
                        end
                        if player.Character:FindFirstChild(ItemName) then
                            player.Character:FindFirstChild(ItemName).Parent = player.Backpack
                        end
                    else
                        Say("[error]")
                    end
                else
                    Say("[error]")
                end
            end
        end
    else
        local mask = player.Character:FindFirstChild(ItemName) or player.Backpack:FindFirstChild(ItemName)
        if mask then
            if player.Backpack:FindFirstChild(ItemName) then
                player.Backpack:FindFirstChild(ItemName).Parent = player.Character
            end
            player.Character:FindFirstChild(ItemName):Activate()
            if player.Character:FindFirstChild(ItemName) then
                player.Character:FindFirstChild(ItemName).Parent = player.Backpack
            end
        else
            Say("[no mask?]")
        end
    end
end
