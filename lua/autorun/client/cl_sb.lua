AddCSLuaFile("autorun/sh_config.lua")
AddCSLuaFile("autorun/client/cl_functions.lua")
local svcolor2 = Color(255, 255, 255)
 
surface.CreateFont("Murder_ScoreBoardFont", {
    font = "Roboto", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
    extended = false,
    size = 25,
    weight = 1000,

    antialias = true

})
surface.CreateFont("Murder_ScoreBoardTOPFont", {
    font = "Roboto", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
    extended = false,
    size = 30,
    weight = 1000,
    blursize = 0,
    scanlines = 0,
    antialias = true

})
surface.CreateFont("Murder_ScoreBoardFontPing", {
    font = "Roboto", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
    extended = false,
    size = 30,
    weight = 1000,
    blursize = 0,
    scanlines = 0,
    antialias = true

})
 
surface.CreateFont("Murder_ScoreBoardFontUnderline", {
    font = "Roboto", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
    extended = false,
    size = 25,
    weight = 500,
    blursize = 0,
    scanlines = 0,
    antialias = true

})
 
surface.CreateFont("Murder_ScoreBoardFontSmall", {
    font = "Arial", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
    extended = false,
    size = 20,
    weight = 500,
    blursize = 0,
    scanlines = 0,
    antialias = true

})
surface.CreateFont("Murder_ScoreBoardFontSSmall", {
    font = "Arial", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
    extended = false,
    size = 18,
    weight = 650,
    blursize = 0,
    scanlines = 0,
    antialias = true
})
surface.CreateFont("Murder_ScoreBoardFontSmall2", {
    font = "Roboto", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
    extended = false,
    size = 23,
    weight = 700,
    blursize = 0,
    scanlines = 0,
    antialias = true
})
 
local function ToggleScoreboard(toggle)
    if toggle then

        local scrw, scrh = ScrW(), ScrH()
        MurderBoardScoreboard = vgui.Create("DFrame")
        MurderBoardScoreboard:SetTitle("")
        MurderBoardScoreboard:SetSize(scrw * .70, scrh * .75)
        local w, h = MurderBoardScoreboard:GetWide(), MurderBoardScoreboard:GetTall()
        MurderBoardScoreboard:Center()
        MurderBoardScoreboard:MakePopup()
        MurderBoardScoreboard:ShowCloseButton(false)
        MurderBoardScoreboard:SetDraggable(false)
        MurderBoardScoreboard:TDLib()
        MurderBoardScoreboard:FadeIn(DriedSpongeMurderScoreboardFadeIN)
        MurderBoardScoreboard:ClearPaint()
        MurderBoardScoreboard:Blur()
        MurderBoardScoreboard:DockPadding( 5, 7,5, 5 )
        MurderBoardScoreboard:Background(DriedSpongeMurderScoreboardBG)
        local title = vgui.Create("DPanel", MurderBoardScoreboard)
        title:Dock(TOP)
        title:SetSize(w / 2, h * .07)
        title:SetPos()
        title:TDLib()
        title:ClearPaint()
        title:Background(Color(0, 0, 0, 0))
        title:DualText(GetHostName(), "Murder_ScoreBoardTOPFont", Color(255, 255, 255, 255), DriedSpongeMurderScoreboardSlogan, "Murder_ScoreBoardFontSmall", Color(200, 200, 200, 200), TEXT_ALIGN_CENTER)
        MurderBoardScoreboard:Text("Map: " .. game.GetMap(), "Murder_ScoreBoardFont", DriedSpongeMurderScoreboardServerTextColor, TEXT_ALIGN_RIGHT, -10, -h / 2.1)
        MurderBoardScoreboard:Text("Players: "..player.GetCount().."/" .. game.MaxPlayers(), "Murder_ScoreBoardFont", DriedSpongeMurderScoreboardServerTextColor, TEXT_ALIGN_LEFT, 10, -h / 2.1)
        local DScrollPanel = vgui.Create("DScrollPanel", MurderBoardScoreboard)
        DScrollPanel:SetSize(w / 2, MurderBoardScoreboard:GetTall())
        DScrollPanel:Dock(LEFT)
        DScrollPanel:TDLib()
        DScrollPanel:HideVBar()
        local DScrollPanel2 = vgui.Create("DScrollPanel", MurderBoardScoreboard)
        DScrollPanel2:SetSize(w / 2 - 15, h)
        DScrollPanel2:Dock(RIGHT)
        DScrollPanel2:TDLib()
        DScrollPanel2:HideVBar()
        local playerstab = DScrollPanel:Add("DPanel")
        playerstab:Dock(TOP)
        playerstab:SetSize(w / 2, h * .05)
        playerstab:SetPos()
        playerstab:TDLib()
        playerstab:ClearPaint()
        playerstab:Background(Color(0, 0, 0, 0))
        playerstab:Text("Players", "Murder_ScoreBoardFontSmall2", DriedSpongeMurderScoreboardPlayerTitleColor, TEXT_ALIGN_CENTER, 0, 0)
        local JoinPlayers = vgui.Create("DButton", playerstab)
        JoinPlayers:SetText("Join Players")
        JoinPlayers:TDLib()
        JoinPlayers:ClearPaint()
        JoinPlayers:Background(Color(255, 255, 255, 0))
        JoinPlayers:Outline(Color(0, 0, 0, 0))
        JoinPlayers:BarHover(Color(255, 0, 0, 255), 3)
        JoinPlayers:Dock(LEFT)
        JoinPlayers:SetTextColor(svcolor2)
        JoinPlayers:SetFont("Murder_ScoreBoardFontSmall")
        JoinPlayers:SetSize(150, 20)
 
        JoinPlayers.DoClick = function()
            RunConsoleCommand("mu_jointeam", "2")
        end
 
        local spectatorstab = DScrollPanel2:Add("DPanel")
        spectatorstab:Dock(TOP)
        spectatorstab:SetSize(w / 2, h * .05)
        spectatorstab:SetPos()
        spectatorstab:TDLib()
        spectatorstab:ClearPaint()
        spectatorstab:Background(Color(0, 0, 0, 0))
        spectatorstab:Text("Spectators", "Murder_ScoreBoardFontSmall2", DriedSpongeMurderScoreboardSpectatorTitleColor, TEXT_ALIGN_CENTER, 0, 0)
        local JoinSpectators = vgui.Create("DButton", spectatorstab)
        JoinSpectators:SetText("Join Spectators")
        JoinSpectators:TDLib()
        JoinSpectators:ClearPaint()
        JoinSpectators:Background(Color(255, 255, 255, 0))
        JoinSpectators:Outline(Color(0, 0, 0, 0))
        JoinSpectators:BarHover(DriedSpongeMurderScoreboardHoverBarColor, 3)
        JoinSpectators:Dock(RIGHT)
        JoinSpectators:SetTextColor(svcolor2)
        JoinSpectators:SetFont("Murder_ScoreBoardFontSmall")
        JoinSpectators:SetSize(150, 20)
 
        JoinSpectators.DoClick = function()
            RunConsoleCommand("mu_jointeam", "1")
        end
 
        for k, v in pairs(team.GetPlayers(2)) do
     
            local playerpanel = DScrollPanel:Add("DButton")
            playerpanel:SetSize(w, h * .11)
            playerpanel:Dock(TOP)
            playerpanel:TDLib()
            playerpanel:DockMargin(0, 5, 0, 0)
            playerpanel:ClearPaint()

            playerpanel:Background(Color(0, 0, 0, 200))
            playerpanel:SetText("")
            playerpanel:BarHover(Color(255, 0, 0, 255), 3)
            playerpanel:DualText(v:Name(), "Murder_ScoreBoardFont", DriedSpongeMurderScoreboardNameColor, v:GetUserGroup(), "Murder_ScoreBoardFontSmall", DriedSpongeMurderScoreboardUserGroupColor, TEXT_ALIGN_CENTER)
 
            playerpanel.DoClick = function()
                scoreboardoptions(v)
                end
            
        
 
        local av = vgui.Create("DPanel", playerpanel)
        av:TDLib()
        av:Dock(LEFT)
        av:CircleAvatar()
        av:SetPlayer(v, 184)
        local pingply = vgui.Create("DLabel", playerpanel)
        pingply:Dock(RIGHT)
        pingply:SetText(v:Ping())
        pingply:SetFont("Murder_ScoreBoardFontPing")
        pingply:SetColor(DriedSpongeMurderScoreboardPingColor)
    end
 
    for k, v in pairs(team.GetPlayers(1)) do
        local playerpanel2 = DScrollPanel2:Add("DButton")
        playerpanel2:SetSize(w, h * .11)
        playerpanel2:Dock(TOP)
        playerpanel2:TDLib()
        playerpanel2:DockMargin(0, 5, 0, 0)
        playerpanel2:ClearPaint()
        playerpanel2:Background(Color(0, 0, 0, 200))
        playerpanel2:SetText("")
        playerpanel2:BarHover(Color(255, 0, 0, 255), 3)
        playerpanel2:DualText(v:Name(), "Murder_ScoreBoardFont", DriedSpongeMurderScoreboardNameColor, v:GetUserGroup(), "Murder_ScoreBoardFontSmall", DriedSpongeMurderScoreboardUserGroupColor, TEXT_ALIGN_CENTER)
 
        playerpanel2.DoClick = function()
            scoreboardoptions(v)
        end
 
        local av2 = vgui.Create("DPanel", playerpanel2)
        av2:TDLib()
        av2:Dock(LEFT)
        av2:CircleAvatar()
        av2:SetPlayer(v, 184)
        local pingply2 = vgui.Create("DLabel", playerpanel2)
        pingply2:Dock(RIGHT)
        pingply2:SetText(v:Ping())
        pingply2:SetFont("Murder_ScoreBoardFontPing")
        pingply2:SetColor(DriedSpongeMurderScoreboardPingColor)
        end
    

else
            if IsValid(MurderBoardScoreboard) then
               MurderBoardScoreboard:Remove()
                end
        end
end
hook.Add("ScoreboardShow", "CustomOpenScoreboard", function()
    ToggleScoreboard(true)
 
    return false
end)
hook.Add("ScoreboardHide", "CustomHidscoreboard", function()
    ToggleScoreboard(false)
end)


--[ERROR] addons/scoreboard/lua/autorun/client/cl_sb.lua:318: attempt to index global 'v' (a nil value)
  --1. ToggleScoreboard - addons/scoreboard/lua/autorun/client/cl_sb.lua:318
  -- 2. v - addons/scoreboard/lua/autorun/client/cl_sb.lua:395
    --3. unknown - lua/includes/modules/hook.lua:84