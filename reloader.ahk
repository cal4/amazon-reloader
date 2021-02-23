#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

; Control F to activate the script.
^f::

InputBox, ReloadAmount, , How many reloads?

ErrorMessage := ""
if ReloadAmount is not integer
{
    ErrorMessage = Enter an integer
}
else if ReloadAmount <= 0
{
    ErrorMessage = Enter a positive number
}

if ErrorMessage {
    MsgBox, %ErrorMessage%, exiting
    ExitApp
}

; PageReloadWait := 5000
; PageReloadWait := 3500
; PageReloadWait := 2500
PageReloadWait := 2500
StepWait := 100

Loop, %ReloadAmount%
{
    ImageSearch(100, "enter-an-amount.jpg")
    MouseClick, Left
    Sleep StepWait
    Send 1
    Sleep StepWait
    Send {Enter}
    Sleep StepWait
    Send {Esc}
    Sleep StepWait
    Send {Space}
    Sleep StepWait
    ImageSearch(140, "reload-1.jpg")
    MouseClick, Left
    Sleep PageReloadWait
    ImageSearch(110, "reload-your-balance-again.jpg")
    MouseClick, Left
    Sleep PageReloadWait
}

ExitApp

ImageSearch(scale, ImageFile)
{
    ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *%scale% %ImageFile%
    if ErrorLevel = 2
    {
        MsgBox Could not conduct the search. $ImageFile
        ExitApp
    }
    if ErrorLevel = 1
    {
        MsgBox could not find %ImageFile% on the screen.
        ExitApp
    }
    if ErrorLevel = 0
    {
        MouseMove, %FoundX%, %FoundY%
    }
}