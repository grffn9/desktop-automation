; AutoHotkey v2
#Requires AutoHotkey v2.0

; Triggers the existing startup automation pipeline:
; trigger-pipeline.ahk (hotkey) -> silent-start.vbs (hidden) -> startup.bat -> window-arranger.exe

; Win + Alt + S (Startup)
#!s::
{
    ; A_ScriptDir is the master.ahk/master.exe location (desktop-automation\)
    ; startup-routine-automation is a sibling folder at the same level
    vbsPath := A_ScriptDir "\startup-routine-automation\silent-start.vbs"

    if !FileExist(vbsPath)
    {
        MsgBox "Could not find: " vbsPath, "Startup Routine", 0x10
        return
    }

    ; Use wscript.exe to run the VBS (which runs the .bat hidden)
    Run 'wscript.exe "' vbsPath '"'
}
