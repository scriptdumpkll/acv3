if LOOPDESTROY_LOADED == true then return end
getgenv().LOOPDESTROY_LOADED = true
getgenv().LOOPDESTROYING = false

workspace.Ignored.Drop.ChildAdded:Connect(function(item)
    if LOOPDESTROYING == true then
        repeat wait(0.001) until item.Parent ~= nil
        wait(2)
        pcall(function()
            item:Destroy()
        end)
    end
end)

function LoopdestroyCmd(val)
    if val:lower() == 'on' then
        Say("[on]")
        LOOPDESTROYING = true
    else
        Say("[off]")
        LOOPDESTROYING = false
    end
end
