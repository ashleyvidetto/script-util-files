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
!c::ToggleWinMinimize("Computer")
!m::ToggleWinMinimize("MobaXterm Professional")