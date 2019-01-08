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