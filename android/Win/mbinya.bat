@echo off

set loopcount=5

:loop
REM Check if a device is connected using adb devices
adb devices | find "device" > nul

REM If a device is connected, run scrcpy
if %errorlevel% equ 0 (
    echo Device is connected. Starting scrcpy...
    scrcpy
) else (
    echo No device connected. Waiting for connection (%loopcount% attempts left)...
    set /a loopcount=loopcount-1
    if %loopcount% gtr 0 (
        timeout /t 5 /nobreak > nul
        goto loop
    ) else (
        echo No device connected. Exiting...
    )
)

pause
