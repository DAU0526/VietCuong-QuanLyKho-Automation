@echo off
cd /d "%~dp0"

python run.py %*

if %errorlevel% equ 0 (
    echo.
    echo All tests passed!
) else (
    echo.
    echo Some tests failed. Check results/report.html for details.
)

pause
