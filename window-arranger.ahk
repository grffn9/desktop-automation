; AutoHotkey v2 Syntax
#Requires AutoHotkey v2.0
SetTitleMatchMode 2

; Give apps a moment to fully initialize their windows
Sleep 2000

; 1. Handle Main Notion App (Display 2 - Primary)
; Using ahk_exe is more reliable than ahk_class for Electron apps
notionExe := "ahk_exe Notion.exe"
if WinWait(notionExe, , 15) {
    Sleep 500  ; Let window fully render
    WinActivate notionExe
    Sleep 200
    WinRestore notionExe  ; Restore first in case it's already maximized (prevents move issues)
    Sleep 200
    WinMove 0, 0, 1920, 1080, notionExe
    Sleep 200
    WinMaximize notionExe
    
    ; Store the main window's ID so we can identify the new one later
    mainNotionHwnd := WinGetID(notionExe)
    
    ; 2. Create a NEW Notion window for Missing Semester
    ; The startup.bat opened Missing Semester as the LAST tab, so it's currently active
    ; Ctrl+Shift+N opens the current page in a new window
    Sleep 300
    Send "^+n"
    Sleep 1500  ; Wait for new window to spawn
    
    ; Find the NEW Notion window (not the main one)
    ; Loop through all Notion windows to find the one that isn't our main window
    newNotionHwnd := 0
    allNotionWindows := WinGetList(notionExe)
    for hwnd in allNotionWindows {
        if (hwnd != mainNotionHwnd) {
            newNotionHwnd := hwnd
            break
        }
    }
    
    if (newNotionHwnd != 0) {
        ; Position the new Notion window (Missing Semester) on portrait monitor
        WinRestore newNotionHwnd
        Sleep 200
        WinMove 1920, 0, 1080, 1920, newNotionHwnd
        Sleep 200
        WinMaximize newNotionHwnd
        
        ; Switch back to main window and go to a different tab
        WinActivate mainNotionHwnd
        Sleep 300
        ; Use Ctrl+Shift+Tab to go to previous tab (away from Missing Semester)
        Send "^+{Tab}"
        Sleep 200
    }
    
    ; Re-position main Notion window on primary monitor (it may have moved)
    WinActivate mainNotionHwnd
    Sleep 200
    WinRestore mainNotionHwnd
    Sleep 200
    WinMove 0, 0, 1920, 1080, mainNotionHwnd
    Sleep 200
    WinMaximize mainNotionHwnd
}

; 3. Handle Notion Calendar (Display 1 - Portrait, stacked with Missing Semester)
; Notion Calendar has a different executable name
calendarExe := "ahk_exe Notion Calendar.exe"
if WinWait(calendarExe, , 15) {
    Sleep 500  ; Let window fully render
    WinActivate calendarExe
    Sleep 200
    WinRestore calendarExe  ; Restore first in case it's already maximized
    Sleep 200
    ; COORDINATE CALCULATION:
    ; Portrait monitor to the LEFT of Main: use -1080
    ; Portrait monitor to the RIGHT of Main: use 1920
    WinMove 1920, 0, 1080, 1920, calendarExe
    Sleep 200
    WinMaximize calendarExe
}