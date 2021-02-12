#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

; Control F to activate the script.
^f::

Loop, PUT-NUMBER-OF-RELOADS-HERE
{
    ImageSearch(85, "enter-an-amount.jpg")
    MouseClick, Left
    Sleep 50
    Send 1
    Sleep 50
    Send {Enter}
    Sleep 750
    ImageSearch(140, "reload-1.jpg")
    MouseClick, Left
    Sleep 5000
    ImageSearch(110, "reload-your-balance-again.jpg")
    MouseClick, Left
    ; Random, rand, 10, 15
    Sleep 1000 * 10
}

Exit

ImageSearch(scale, ImageFile)
{
    ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *%scale% %ImageFile%
    ; ImageSearch, FoundX, FoundY, A_ScreenWidth / 2, 0, A_ScreenWidth, A_ScreenHeight, *%scale% %ImageFile%
    if ErrorLevel = 2
    {
        MsgBox Could not conduct the search. $ImageFile
        Exit
    }
    if ErrorLevel = 1
    {
        MsgBox could not find %ImageFile% on the screen.
        Exit
    }
    if ErrorLevel = 0
    {
        ; MsgBox,, Information, The image was found at %FoundX%x%FoundY%`n Don't touch mouse as app will move it, 5
        MouseMove, %FoundX%, %FoundY%
    }
}