if CDROP_LOADED == true then return end
getgenv().CDROP_LOADED = true
getgenv().CDROPPINGNOW = false
local goal,cur = 0, 0

local function Converter(args)
    local Lib = {
        k=1000,
        m=1000000,
        b=1000000000,
    }
    for i,v in pairs(Lib) do
        if args:lower():find(i:lower()) then
            return args:gsub(i,"")*Lib[i]
        end
    end
    return args
end

local function CleanUp(item)
    return item:lower():gsub("%$",""):gsub("%,","")
end

workspace.Ignored.Drop.ChildAdded:Connect(function(child)
    if child.Parent.Name == "Drop" then
        repeat wait(0.001) until child.Parent ~= nil
        if CDROPPINGNOW == true then
            local g = child.BillboardGui.TextLabel.Text:gsub("%,",""):gsub("%$","")
            cur = cur + tonumber(g)
            print(cur)
            if cur >= goal then
                CDROPPINGNOW = false
                game:service"RunService":UnbindFromRenderStep("DROP_CMD")
                Say("[end]")
            end
        end
        if LOOPDESTROYING_NOW == true then
            child:Destroy()
        end
    end
end)

function CdropCmd(arg)
    local data = Converter(arg)
    if tonumber(data) then
        CDROPPINGNOW = true
        goal = data
        Say("[start]")
        game:service"RunService":BindToRenderStep("DROP_CMD",3,function()
            game:service"ReplicatedStorage".MainEvent:FireServer("DropMoney",10000)
        end)
        return "ok"
    else
        return "error"
    end
end
