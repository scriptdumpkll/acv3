if STOP_LOADED == true then return end
getgenv().STOP_LOADED = true
function StopCmd()
    pcall(function()
        game:service"RunService":UnbindFromRenderStep("DROP_CMD")
    end)
    pcall(function()
        game:service"RunService":UnbindFromRenderStep("CASHAURA_DUPE")
    end)
    getgenv().CDROPPINGNOW = false
end
