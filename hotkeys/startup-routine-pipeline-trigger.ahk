; AutoHotkey v2
#Requires AutoHotkey v2.0

; Triggers the existing startup automation pipeline:
; trigger-pipeline.ahk (hotkey) -> silent-start.vbs (hidden) -> startup.bat -> window-arranger.exe

; Uncommon hotkey: Ctrl + Alt + Shift + F12
^!+F12::
{
    ; Go up one level from hotkeys/ to find the startup-routine-automation subfolder
    vbsPath := A_ScriptDir "\..\startup-routine-automation\silent-start.vbs"

    if !FileExist(vbsPath)
    {
        MsgBox "Could not find: " vbsPath, "Startup Routine", 0x10
        return
    }

    ; Use wscript.exe to run the VBS (which runs the .bat hidden)
    Run 'wscript.exe "' vbsPath '"'
}
