ToggleWinMinimize(TheWindowTitle)
{
SetTitleMatchMode,2
DetectHiddenWindows, Off
IfWinActive, %TheWindowTitle%
{
WinMinimize, %TheWindowTitle%
}
Else
{
IfWinExist, %TheWindowTitle%
{
WinGet, winid, ID, %TheWindowTitle%
DllCall("SwitchToThisWindow", "UInt", winid, "UInt", 1)
}
}
Return
}

!e::ToggleWinMinimize("All Notebooks - ashley.videtto@gmail.com - Evernote")
!o::ToggleWinMinimize("Inbox - Ashley.Videtto@aa.com - Outlook")
!s::ToggleWinMinimize("Slack - American Airlines")

!h::Send {Left}
return
!j::Send {Down}
return
!k::Send {Up}
return
!l::Send {Right}
return
!+h::Send {Home}
return
!+l::Send {End}
return
Capslock::Esc