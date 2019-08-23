AddCSLuaFile("autorun/sh_config.lua")
local svcolor2 = Color(255, 255, 255)
 
surface.CreateFont("Murder_ScoreBoardFont", {
    font = "Roboto", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
    extended = false,
    size = 25,
    weight = 1000,
    blursize = 0,
    scanlines = 0,
    antialias = true,
    underline = false,
    italic = false,
    strikeout = false,
    symbol = false,
    rotary = false,
    shadow = false,
    additive = false,
    outline = false
})
 
surface.CreateFont("Murder_ScoreBoardFontPing", {
    font = "Roboto", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
    extended = false,
    size = 30,
    weight = 1000,
    blursize = 0,
    scanlines = 0,
    antialias = true,
    underline = false,
    italic = false,
    strikeout = false,
    symbol = false,
    rotary = false,
    shadow = false,
    additive = false,
    outline = false
})
 
surface.CreateFont("Murder_ScoreBoardFontUnderline", {
    font = "Roboto", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
    extended = false,
    size = 25,
    weight = 500,
    blursize = 0,
    scanlines = 0,
    antialias = true,
    underline = true,
    italic = false,
    strikeout = false,
    symbol = false,
    rotary = false,
    shadow = false,
    additive = false,
    outline = false
})
 
surface.CreateFont("Murder_ScoreBoardFontSmall", {
    font = "Arial", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
    extended = false,
    size = 20,
    weight = 500,
    blursize = 0,
    scanlines = 0,
    antialias = true,
    underline = false,
    italic = false,
    strikeout = false,
    symbol = false,
    rotary = false,
    shadow = false,
    additive = false,
    outline = false
})
surface.CreateFont("Murder_ScoreBoardFontSSmall", {
    font = "Arial", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
    extended = false,
    size = 18,
    weight = 650,
    blursize = 0,
    scanlines = 0,
    antialias = true,
    underline = false,
    italic = false,
    strikeout = false,
    symbol = false,
    rotary = false,
    shadow = false,
    additive = false,
    outline = false
})
surface.CreateFont("Murder_ScoreBoardFontSmall2", {
    font = "Roboto", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
    extended = false,
    size = 23,
    weight = 700,
    blursize = 0,
    scanlines = 0,
    antialias = true,
    underline = false,
    italic = false,
    strikeout = false,
    symbol = false,
    rotary = false,
    shadow = false,
    additive = false,
    outline = false
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
        MurderBoardScoreboard:Background(DriedSpongeMurderScoreboardBG)
        local title = vgui.Create("DPanel", MurderBoardScoreboard)
        title:Dock(TOP)
        title:SetSize(w / 2, h * .06)
        title:SetPos()
        title:TDLib()
        title:ClearPaint()
        title:Background(Color(0, 0, 0, 0))
        title:DualText(GetHostName(), "Murder_ScoreBoardFont", Color(255, 255, 255, 255), DriedSpongeMurderScoreboardSlogan, "Murder_ScoreBoardFontSmall", Color(200, 200, 200, 200), TEXT_ALIGN_CENTER)
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
        playerstab:Text("Players:", "Murder_ScoreBoardFontSmall2", DriedSpongeMurderScoreboardPlayerTitleColor, TEXT_ALIGN_CENTER, 0, 0)
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
            RunConsoleCommand("mu_jointeam3", "2")
        end
 
        local spectatorstab = DScrollPanel2:Add("DPanel")
        spectatorstab:Dock(TOP)
        spectatorstab:SetSize(w / 2, h * .05)
        spectatorstab:SetPos()
        spectatorstab:TDLib()
        spectatorstab:ClearPaint()
        spectatorstab:Background(Color(0, 0, 0, 0))
        spectatorstab:Text("Spectators:", "Murder_ScoreBoardFontSmall2", DriedSpongeMurderScoreboardSpectatorTitleColor, TEXT_ALIGN_CENTER, 0, 0)
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
            -- XadminCommands = {
            --     slay = { cmdname = "Slay", frametitle = "Reason",  func = function(self) RunConsoleCommand("xadmin_slay", v:SteamID(), self:GetValue())  end, time = false}
            --     }
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
                opt = DermaMenu()
                opt:Open(gui.MouseX(), gui.MouseY(), "", ownerpanel)
 
                --Open Steam profile button
                local steampro = opt:AddOption("Open Steam Profile", function()
                    v:ShowProfile()
                end)
 
                steampro:SetIcon("materials/icons/steamlogo.png")
 
                --mute button
                if v ~= LocalPlayer() and v:IsMuted() then
                        local unmute = opt:AddOption("Un-Mute", function()
                            v:SetMuted(false)
                        end)
 
                        unmute:SetIcon("icon16/sound.png")
                    else
                        if v ~= LocalPlayer()  then
                        local mute = opt:AddOption("Mute", function()
                            v:SetMuted(true)
                        end)
 
                        mute:SetIcon("icon16/sound_mute.png")
                    end
                end
 
                --copyoptsions
                local copy, optoption = opt:AddSubMenu("Copy")
                optoption:SetIcon("icon16/page_white_copy.png")
 
                --Copy SteamID
                local copyid = copy:AddOption("Copy SteamID", function()
                    SetClipboardText(v:SteamID())
                end)
 
                copyid:SetIcon("materials/icons/steamlogo.png")
 
                --Copy SteamID64
                if v:IsBot() == false then
                    local copyid64 = copy:AddOption("Copy SteamID64", function()
                        SetClipboardText(v:SteamID64())
                    end)
 
                    copyid64:SetIcon("materials/icons/steamlogo.png")
 
                    --Copy Profile URL
                    local copyprofile = copy:AddOption("Copy Profile URL", function()
                        SetClipboardText("http://steamcommunity.com/profiles/" .. v:SteamID64())
                    end)
 
                    copyprofile:SetIcon("materials/icons/steamlogo.png")
                end
 
                --copy name
                local copyname = copy:AddOption("Copy username", function()
                    SetClipboardText(v:Name())
                end)
 
                copyname:SetIcon("icon16/tag_blue.png")
 
                --beyond this are admin options
                if table.HasValue(ScoreBoardAdminGroups, LocalPlayer():GetUserGroup()) then
                    opt:AddSpacer()
                    --move to spectators
                    local moveteam = opt:AddOption("Move to spectators", function()
                        RunConsoleCommand("mu_movetospectate", v:EntIndex())
                    end)
                    moveteam:SetIcon("icon16/user_go.png")
                    --Force Murderer next round
                    local foremurder = opt:AddOption("Force murderer next round", function()
                        RunConsoleCommand("mu_forcenextmurderer", v:EntIndex())
                    end)
                    foremurder:SetIcon("icon16/user_red.png")
                    --Administartion
                    local adm, optoption = opt:AddSubMenu("Administration")
                    optoption:SetIcon("icon16/shield.png")
                    local util, optoption2 = opt:AddSubMenu("Utility")
                    optoption2:SetIcon("icon16/lightning.png")
                    local tp, optoption2 = opt:AddSubMenu("Teleportation")
                    optoption2:SetIcon("icon16/lightning.png")
                    --Xadmin ADMINISTRATION COMMANDS
                    --Slay
                    if DriedSpongeMurderScoreboardXADMIN == "xadmin" then
                        local slay = adm:AddOption("Slay " .. v:Name(), function()
                            local frame = vgui.Create("DFrame")
                            frame:SetSize(400, 100)
                            frame:TDLib()
                            frame:Center()
                            frame:SetTitle("Slay "..v:Name())
                            frame:MakePopup()
                            frame.lblTitle:SetFont("Murder_ScoreBoardFont")
                            frame.lblTitle:SetTextColor(DriedSpongeMurderScoreboardServerTextColor)
                            frame:ClearPaint()
                            frame:Background(DriedSpongeMurderScoreboardBG)
                            frame:Outline(DriedSpongeMurderScoreboardServerTextColor)
                            local rson = vgui.Create("DLabel", frame)
                            rson:Dock(TOP)
                            rson:SetText("Reason")
                            rson:SetFont("Murder_ScoreBoardFontSSmall")
                            rson:SetSize(40, 15)
                            rson:SetColor(DriedSpongeMurderScoreboardServerTextColor)
                            local TextEntry = vgui.Create("DTextEntry", frame)
                            TextEntry:SetPos(25, 50)
                            TextEntry:SetSize(75, 40)
                            TextEntry:SetTextColor(DriedSpongeMurderScoreboardServerTextColor)
                            TextEntry:SetFont("Murder_ScoreBoardFont")
                            TextEntry:Dock(BOTTOM)
                            TextEntry:SetText("")
                            TextEntry.OnEnter = function(self)
                                RunConsoleCommand("xadmin_slay", v:SteamID(), self:GetValue())
                                frame:Close()
                            end  end)    slay:SetIcon("materials/icons/slay.png")
                            local kick = adm:AddOption("Kick " .. v:Name(), function()
                                local frame = vgui.Create("DFrame")
                                frame:SetSize(400, 100)
                                frame:TDLib()
                                frame:Center()
                                frame:SetTitle("Kick "..v:Name())
                                frame:MakePopup()
                                frame.lblTitle:SetFont("Murder_ScoreBoardFont")
                                frame.lblTitle:SetTextColor(DriedSpongeMurderScoreboardServerTextColor)
                                frame:ClearPaint()
                                frame:Background(DriedSpongeMurderScoreboardBG)
                                frame:Outline(DriedSpongeMurderScoreboardServerTextColor)
                                local rson = vgui.Create("DLabel", frame)
                                rson:Dock(TOP)
                                rson:SetText("Reason")
                                rson:SetFont("Murder_ScoreBoardFontSSmall")
                                rson:SetSize(40, 15)
                                rson:SetColor(DriedSpongeMurderScoreboardServerTextColor)
                                local TextEntry = vgui.Create("DTextEntry", frame)
                                TextEntry:SetPos(25, 50)
                                TextEntry:SetSize(75, 40)
                                TextEntry:SetTextColor(DriedSpongeMurderScoreboardServerTextColor)
                                TextEntry:SetFont("Murder_ScoreBoardFont")
                                TextEntry:Dock(BOTTOM)
                                TextEntry:SetText("")
                                TextEntry.OnEnter = function(self)
                                    RunConsoleCommand("xadmin_kick", v:SteamID(), self:GetValue())
                                    frame:Close()
                                end  end)    kick:SetIcon("materials/icons/kick.png")
                                local ban = adm:AddOption("Ban " .. v:Name(), function()
                                    local bframe = vgui.Create("DFrame")
                                    bframe:SetSize(400, 145)
                                    bframe:TDLib()
                                    bframe:Center()
                                    bframe:SetTitle("Ban "..v:Name())
                                    bframe:MakePopup()
                                    bframe.lblTitle:SetFont("Murder_ScoreBoardFont")
                                    bframe.lblTitle:SetTextColor(DriedSpongeMurderScoreboardServerTextColor)
                                    bframe:ClearPaint()
                                    bframe:Background(DriedSpongeMurderScoreboardBG)
                                    bframe:Outline(DriedSpongeMurderScoreboardServerTextColor)
                                    local time = vgui.Create("DLabel", bframe)
                                    time:Dock(TOP)
                                    time:SetText("Time (Minutes, 0 for perma)")
                                    time:SetFont("Murder_ScoreBoardFontSSmall")
                                    time:SetColor(DriedSpongeMurderScoreboardServerTextColor)
                                    local DNumberWang = vgui.Create( "DNumberWang", bframe )
                                    DNumberWang:Dock(TOP)		
                                    DNumberWang:SetSize( 100, 25 )		
                                    DNumberWang:SetMin( 0 )				
                                    DNumberWang:SetMax( 100000 )				
                                    DNumberWang:SetDecimals( 0 )
                                    local rson = vgui.Create("DLabel", bframe)
                                    rson:Dock(TOP)
                                    rson:SetText("Reason")
                                    rson:SetSize(40, 15)
                                    rson:SetFont("Murder_ScoreBoardFontSSmall")
                                    rson:SetColor(DriedSpongeMurderScoreboardServerTextColor)		
                                    local TextEntry = vgui.Create("DTextEntry", bframe)
                                    TextEntry:SetPos(25, 50)
                                    TextEntry:SetSize(75, 40)
                                    TextEntry:SetTextColor(DriedSpongeMurderScoreboardServerTextColor)
                                    TextEntry:SetFont("Murder_ScoreBoardFont")
                                    TextEntry:Dock(BOTTOM)
                                    TextEntry:SetText("")
                                    TextEntry.OnEnter = function(self)
                                        RunConsoleCommand("xadmin_ban", v:SteamID(), DNumberWang:GetValue(), self:GetValue())
                                        bframe:Close()
                                    end  end)    ban:SetIcon("materials/icons/gavel.png")
                                    if v:GetNWBool("xAdminGagged") == false then
                                    local gag = adm:AddOption("Gag " .. v:Name(), function()
                                        local gframe = vgui.Create("DFrame")
                                        gframe:SetSize(400, 145)
                                        gframe:TDLib()
                                        gframe:Center()
                                        gframe:SetTitle("Gag "..v:Name())
                                        gframe:MakePopup()
                                        gframe.lblTitle:SetFont("Murder_ScoreBoardFont")
                                        gframe.lblTitle:SetTextColor(DriedSpongeMurderScoreboardServerTextColor)
                                        gframe:ClearPaint()
                                        gframe:Background(DriedSpongeMurderScoreboardBG)
                                        gframe:Outline(DriedSpongeMurderScoreboardServerTextColor)
                                        local time = vgui.Create("DLabel", gframe)
                                        time:Dock(TOP)
                                        time:SetText("Time (Minutes, 0 for perma)")
                                        time:SetFont("Murder_ScoreBoardFontSSmall")
                                        time:SetColor(DriedSpongeMurderScoreboardServerTextColor)
                                        local DNumberWang = vgui.Create( "DNumberWang", gframe )
                                        DNumberWang:Dock(TOP)		
                                        DNumberWang:SetSize( 100, 25 )		
                                        DNumberWang:SetMin( 0 )				
                                        DNumberWang:SetMax( 100000 )				
                                        DNumberWang:SetDecimals( 0 )
                                        local rson = vgui.Create("DLabel", gframe)
                                        rson:Dock(TOP)
                                        rson:SetText("Reason")
                                        rson:SetSize(40, 15)
                                        rson:SetFont("Murder_ScoreBoardFontSSmall")
                                        rson:SetColor(DriedSpongeMurderScoreboardServerTextColor)		
                                        local TextEntry = vgui.Create("DTextEntry", gframe)
                                        TextEntry:SetPos(25, 50)
                                        TextEntry:SetSize(75, 40)
                                        TextEntry:SetTextColor(DriedSpongeMurderScoreboardServerTextColor)
                                        TextEntry:SetFont("Murder_ScoreBoardFont")
                                        TextEntry:Dock(BOTTOM)
                                        TextEntry:SetText("")
                                        TextEntry.OnEnter = function(self)
                                            RunConsoleCommand("xadmin_gag", v:SteamID(), DNumberWang:GetValue(), self:GetValue())
                                            gframe:Close()
                                        end  end)    gag:SetIcon("icon16/sound_mute.png") else 
                                            local ungag = adm:AddOption("Un-Gag " .. v:Name(), function()
                                                    RunConsoleCommand("xadmin_ungag", v:SteamID())
                                                 end)    ungag:SetIcon("icon16/sound.png")
                                                 end

                                                 if v:GetNWBool("xAdminGod") == false  then 
                                                     godtxt = "God"
                                                     godcmd = "xadmin_god" 
                                                else
                                                     godtxt = "Un-God"    
                                                     godcmd = "xadmin_ungod" 
                                                end
                                                 local god = util:AddOption(godtxt.." "..v:Name(), function()
                                                        RunConsoleCommand(godcmd, v:SteamID())  
                                                     end)    
                                                     god:SetIcon("materials/icons/gavel.png")
                                                if v ~= LocalPlayer() then
                                                    local tp, optoption3 = opt:AddSubMenu("Teleportation")
                                                    optoption3:SetIcon("icon16/arrow_out.png")
                                                     local gto = tp:AddOption("Goto "..v:Name(), function()
                                                        RunConsoleCommand("xadmin_goto", v:SteamID())  
                                                     end)    
                                                     gto:SetIcon("icon16/arrow_left.png")
                                                     local brg = tp:AddOption("Bring "..v:Name(), function()
                                                        RunConsoleCommand("xadmin_tp", v:SteamID())  
                                                     end)    
                                                     brg:SetIcon("icon16/arrow_right.png")
                                                end
                                
                    end
                end
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
            opt = DermaMenu()
            opt:Open(gui.MouseX(), gui.MouseY(), "", ownerpanel)
 
            --Open Steam profile button
            local steampro = opt:AddOption("Open Steam Profile", function()
                v:ShowProfile()
            end)
 
            steampro:SetIcon("icon16/world.png")
 
            --mute button
            if v ~= LocalPlayer() then
                if v:IsMuted() then
                    local unmute = opt:AddOption("Un-Mute", function()
                        v:SetMuted(false)
                    end)
 
                    unmute:SetIcon("icon16/sound.png")
                else
                    local mute = opt:AddOption("Mute", function()
                        v:SetMuted(true)
                    end)
 
                    mute:SetIcon("icon16/sound_mute.png")
                end
            end
 
            --beyond this are admin options
            if table.HasValue(ScoreBoardAdminGroups, LocalPlayer():GetUserGroup()) then
                opt:AddSpacer()
                local copy, optoption = opt:AddSubMenu("Do you want to die?")
                optoption:SetIcon("icon16/user_red.png")
 
                local copyid = copy:AddOption("Copy SteamID", function()
                    RunConsoleCommand("mu_movetospectate", v:EntIndex())
                end)
 
                copyid:SetIcon("icon16/user_go.png")
            end
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