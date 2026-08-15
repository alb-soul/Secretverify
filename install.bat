@echo off
rem ─────────────────────────────────────────────────────────────
rem  secretverify installer — Windows (Command Prompt / PowerShell)
rem  Pasang ke C:\secretverify dan tambahkan ke PATH user.
rem ─────────────────────────────────────────────────────────────
setlocal EnableDelayedExpansion

set "REPO=alb-soul/Secretverify"
set "BRANCH=main"
set "URL=https://raw.githubusercontent.com/%REPO%/%BRANCH%/secretverify"
set "DEST=%USERPROFILE%\secretverify"

echo [i] Downloading secretverify dari %URL%

if not exist "%DEST%" mkdir "%DEST%" || goto :fail

where curl >nul 2>nul
if errorlevel 1 (
    echo [x] curl tidak ditemukan. Gunakan PowerShell:
    echo     Invoke-WebRequest "%URL%" -OutFile "%DEST%\secretverify"
    goto :fail
)

curl -fsSL "%URL%" -o "%DEST%\secretverify"
if errorlevel 1 goto :fail

rem ── Tambahkan ke PATH user jika belum ada ──
set "PATHKEY=HKCU\Environment"
for /f "skip=2 tokens=2,*" %%A in ('reg query "%PATHKEY%" /v Path 2^>nul') do set "CURPATH=%%B"
if not defined CURPATH set "CURPATH="

echo %CURPATH% | findstr /i /c:"%DEST%" >nul
if errorlevel 1 (
    if defined CURPATH (
        reg add "%PATHKEY%" /v Path /t REG_EXPAND_SZ /d "%CURPATH%;%DEST%" /f >nul
    ) else (
        reg add "%PATHKEY%" /v Path /t REG_EXPAND_SZ /d "%DEST%" /f >nul
    )
    echo [i] PATH diperbarui. Buka terminal BARU agar berlaku.
)

echo.
echo [✓] secretverify terpasang di %DEST%\secretverify
echo     Jalankan lewat Git Bash / WSL:   secretverify
echo     (Atau buka terminal baru lalu ketik secretverify)
exit /b 0

:fail
echo [x] Instalasi gagal.
exit /b 1
