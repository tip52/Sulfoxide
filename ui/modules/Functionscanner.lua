local searchfunctions = import("modules/Functionscanner.lua")
local functionscannerpath = ui.Main.group.Functionscanner
local funcframe = functionscannerpath.Results.Func
funcframe.Parent = nil
functionscannerpath.Searchbar.Search.FocusLost:Connect(function(enterpressed)
if enterpressed then
    if functionscannerpath.Searchbar.Search.Text == "" then
        warn("query is too short!")
        return
    end
    local mode = functionscannerpath.FiltersFrame:FindFirstChild("Name").ImageTransparency == 0 and "Name" or "Path"
    for i,v in pairs(functionscannerpath.Results:GetChildren()) do
        if v.Name == "Func" then
            v:Destroy()
        end
    end
    searchfunctions(functionscannerpath.Searchbar.Search.Text, mode, funcframe)
end
end)
