!1:: Run, E:\GATE\gateCSE
!2:: Run, E:\ravi
!3:: Run, C:\Users\Rajat\Desktop\Github

SetCapsLockState, AlwaysOff
CapsLock::shift

!0:: Run, C:\Users\Rajat\Desktop\Github\Auto-Hot-Key\cpp.ahk
!9:: Run, C:\Users\Rajat\Desktop\Github\Auto-Hot-Key\toc.ahk

;************************************Google search********************************************************

^!g::

chrome := "- Google Chrome"
found := "false"
tabSearch := "Google Search"
curWinNum := 0

SetTitleMatchMode, 2

OldClipboard:= Clipboard
Clipboard:= ""
Send, ^c ;copies selected text
ClipWait

WinGet, numOfChrome, Count, %chrome% ; Get the number of chrome windows
if(numOfChrome = 0){
Run http://www.google.com/search?q=%Clipboard%
}
else{
WinActivateBottom, %chrome% ; Activate the least recent window

WinWaitActive %chrome% ; Wait until the window is active

ControlFocus, Chrome_RenderWidgetHostHWND1 ; Set the focus to tab control

; Loop until all windows are tried, or until we find it
while (curWinNum < numOfChrome and found = "false") { 
WinGetTitle, firstTabTitle, A ; The initial tab title
title := firstTabTitle
Loop
{
if(InStr(title, tabSearch)>0){
found := "true"
break
}
Send {Ctrl down}{Tab}{Ctrl up}
Sleep, 50
WinGetTitle, title, A ;get active window title
if(title = firstTabTitle){
break
}
}
if(found = "false"){
WinActivateBottom, %chrome%
curWinNum := curWinNum + 1
}
}
if(found = "true"){
Send, !d ;focuses on address bar
Send, %clipboard% ;pastes copied text
Send, {Enter}
}
if(found = "false"){
Run http://www.google.com/search?q=%Clipboard%
}
} 
Sleep 200
Clipboard:= OldClipboard
return

;***********************************Google search*********************************************************