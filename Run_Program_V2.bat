@echo off
:: Author: Kapil Saraswat
::  
:: This batch file must be uses with the python codes. 
::
:: DO NOT CHANGE ANYTHING BELOW
color 0a
REM ------------------------------------------------
REM  Default values
REM ------------------------------------------------
set menu=0
set confirm=n
:OPTION
cls
@echo:
@echo ______________________________________________________________________
@echo ______________________________________________________________________
@echo:
@echo		Array Antenna Radiation Patten
@echo:
@echo						By: Kapil Saraswat
@echo ______________________________________________________________________
@echo ______________________________________________________________________
@echo:
@echo:
@echo The program prompt the setting file. Edit it or simply close it!!
@echo:
notepad LP_setting.xml
REM msg "%username%" Please check the settings in XML file!
echo [1.] Active Element Combined Process
echo [2.] Individual Port 
echo [3.] Clear all Result files
echo [4.] Exit (type 0 or 9)
echo.

REM ------------------------------------------------
REM  Make a choice
REM ------------------------------------------------

set /P menu=Selection: 

if '%menu%'=='0' goto EXIT
if '%menu%'=='1' python RP_Process.pyc
if '%menu%'=='2' python RP_Process_portwise.pyc
if '%menu%'=='3' goto CLEAR_ALL
if '%menu%'=='4' goto EXIT
set confirm=n
set /P confirm=Start another program (y/n)? 

if '%confirm%'=='y' goto OPTION
goto EXIT


:CLEAR_ALL
IF EXIST "AR_result" (rmdir "AR_result" /s /q)
IF EXIST "Radiation_Pattern_Result" (rmdir "Radiation_Pattern_Result" /s /q)
IF EXIST "Result" (rmdir "Result" /s /q)
goto OPTION

:EXIT
color 07