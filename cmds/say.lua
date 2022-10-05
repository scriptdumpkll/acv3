if SAY_LOADAED == true then return end
getgenv().SAY_LOADAED = true

function SayMsg(arg)
    Say(arg:gsub(Settings['prefix'].."say ",""))
end
