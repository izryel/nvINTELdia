#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.




F7::
{
	run %a_scriptdir%\vga_nvidia.exe enable,,hide
	run %a_scriptdir%\vga_intel.exe disble,,hide
}
F6::
{
	run %a_scriptdir%\vga_nvidia.exe disable,,hide
	run %a_scriptdir%\vga_intel.exe enable,,hide
}



return