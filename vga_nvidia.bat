@ECHO OFF
REM BFCPEOPTIONSTART
REM Advanced BAT to EXE Converter www.BatToExeConverter.com
REM BFCPEEXE=C:\Users\Izryel\Desktop\vga_nvidia.exe
REM BFCPEICON=
REM BFCPEICONINDEX=1
REM BFCPEEMBEDDISPLAY=0
REM BFCPEEMBEDDELETE=1
REM BFCPEADMINEXE=1
REM BFCPEINVISEXE=0
REM BFCPEVERINCLUDE=1
REM BFCPEVERVERSION=1.0.2.1
REM BFCPEVERPRODUCT=gpufix_vgaswitch_aw15r3
REM BFCPEVERDESC=broken internal edrp port, usable exhdmi
REM BFCPEVERCOMPANY=github.com/izryel
REM BFCPEVERCOPYRIGHT=open source
REM BFCPEOPTIONEND
@ECHO ON
@echo off
	if "%1" == "help" ( goto :usage ) else ( goto :check_a )
:check_a
	if "%1" == "enable" ( goto :enabler ) else ( goto :check_b )
:enabler
	pnputil /enable-device /instanceid "PCI\VEN_10DE&DEV_1BE1&SUBSYS_07C01028&REV_A1\4&20e8a44b&0&0008"
	goto :end
:check_b
	if "%1" == "disable" ( goto :disabler ) else ( goto :check_c )
:disabler
	pnputil /disable-device /instanceid "PCI\VEN_10DE&DEV_1BE1&SUBSYS_07C01028&REV_A1\4&20e8a44b&0&0008"
	call :query
:check_c
if "%1" == "status" ( goto :query ) else ( goto :usage )
:query
	for /f "delims=" %%i in ('pnputil /enum-devices /instanceid "PCI\VEN_10DE&DEV_1BE1&SUBSYS_07C01028&REV_A1\4&20e8a44b&0&0008" ^| findstr Status') do set vga_nvidia_status=%%i
	echo %vga_nvidia_status%
	goto :end
:usage
	echo.
	echo usage:
	echo 		%0 ^[ enable ^| disable ^| help ^| status ^]
	echo.
:end