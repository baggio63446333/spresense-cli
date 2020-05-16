@echo off
setlocal enabledelayedexpansion
cd %~dp0

set BAUDRATE=500000

set TARGET=%1

if "!TARGET!" == "" (
 set /P TARGET=Enter sketch folder or spk file : 
 if "!TARGET!" == "" (
   exit /b 1
 )
)

if "!TARGET:~-3!" == "spk" (
  if EXIST "!TARGET!" (
    set SPK=!TARGET!
    goto UPLOAD
  ) else (
    echo Not exist spk file : !TARGET!
    exit /b 1
  )
)

if NOT EXIST "!TARGET!\" (
  echo Not exist sketch folder : !TARGET!
  exit /b 1
)

echo Building... : !TARGET!
call arduino-cli.exe compile --warnings default --fqbn SPRESENSE:spresense:spresense:Core=Sub5,Debug=Disabled !TARGET!
if not !ERRORLEVEL! == 0 (
  exit /b 1
)

FOR /F "usebackq" %%t IN (`dir /B !TARGET!\*.spk`) DO set SPK=!TARGET!\%%t

:UPLOAD

echo Uploading... : !SPK!

FOR /F "usebackq" %%t IN (`get_comport.exe`) DO set COM=%%t

call flash_writer.exe -c !COM! -d -n -b !BAUDRATE! !SPK!

