$!LButton::
	SendInput {Ctrl Down}{LButton}{Ctrl Up}

$!c::
	SendInput {Ctrl Down}{c}{Ctrl Up}
Return
$!x::
	SendInput {Ctrl Down}{x}{Ctrl Up}
Return
$!v::
	SendInput {Ctrl Down}{v}{Ctrl Up}
Return
$!a::
	SendInput {Ctrl Down}{a}{Ctrl Up}
Return
$!s::
	SendInput {Ctrl Down}{s}{Ctrl Up}
Return
$!w::
	SendInput {Ctrl Down}{w}{Ctrl Up}
Return
$!z::
	SendInput {Ctrl Down}{z}{Ctrl Up}
Return
$!r::
	SendInput {Ctrl Down}{r}{Ctrl Up}
Return
$!t::
	SendInput {Ctrl Down}{t}{Ctrl Up}
Return
$!q::
	SendInput {Alt Down}{F4}{Alt Up}
Return
$!f::
	SendInput {Ctrl Down}{f}{Ctrl Up}
Return
$!/::
	SendInput {Ctrl Down}{/}{Ctrl Up}
Return

!.::ToggleTerminal()

ShowAndPositionTerminal()
{
    WinShow ahk_class CASCADIA_HOSTING_WINDOW_CLASS
    WinActivate ahk_class CASCADIA_HOSTING_WINDOW_CLASS

    SysGet, WorkArea, MonitorWorkArea
    TerminalWidth := A_ScreenWidth * 0.9
    if (A_ScreenWidth / A_ScreenHeight) > 1.5 {
        TerminalWidth := A_ScreenWidth * 0.6
    }
    WinMove, ahk_class CASCADIA_HOSTING_WINDOW_CLASS,, (A_ScreenWidth - TerminalWidth) / 2, WorkAreaTop - 2, TerminalWidth, A_ScreenHeight * 0.5,
}

ToggleTerminal()
{
    WinMatcher := "ahk_class CASCADIA_HOSTING_WINDOW_CLASS"

    DetectHiddenWindows, On

    if WinExist(WinMatcher)
    ; Window Exists
    {
        DetectHiddenWindows, Off

        ; Check if its hidden
        if !WinExist(WinMatcher) || !WinActive(WinMatcher)
        {
            ShowAndPositionTerminal()
        }
        else if WinExist(WinMatcher)
        {
            ; Script sees it without detecting hidden windows, so..
            WinHide ahk_class CASCADIA_HOSTING_WINDOW_CLASS
            Send !{Esc}
        }
    }
    else
    {
        Run "C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_1.15.2874.0_x64__8wekyb3d8bbwe\wt.exe"
        Sleep, 1000
        ShowAndPositionTerminal()
    }
}

