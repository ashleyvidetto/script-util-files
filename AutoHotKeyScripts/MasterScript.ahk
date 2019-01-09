; Create shortcuts to bring windows into focus, uses this toggle win minize method

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
!o::ToggleWinMinimize("Inbox")
!s::ToggleWinMinimize("Slack - American Airlines")
!i::ToggleWinMinimize("IPS_LKA2.0-Release [C:\LookAhead\Git\IPS_LKA2.0-Release] - IntelliJ IDEA")

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

; Map CapsLock to Escape
Capslock::Esc

; Maximize current window with Alt + M
#SingleInstance force
!m::WinMaximize, A ; Assign a hotkey to maximize the active window
return