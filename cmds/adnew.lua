if ADNEW_LOADED == true then return end
getgenv().ADNEW_LOADED = true

function AdnewCmd(_string_)
    Settings['admsg'] = _string_
    Say("[new ad message set]")
end
