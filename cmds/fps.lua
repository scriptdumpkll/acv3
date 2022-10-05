if FPS_LOADED == true then return end
getgenv().FPS_LOADED = true

function FpsCmd(arg)
    pcall(function()
        setfpscap(tonumber(arg))
        Say("FPS set to "..tostring(arg))
    end)
end
