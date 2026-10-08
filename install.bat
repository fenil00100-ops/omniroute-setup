@echo off
echo ============================================
echo   OmniRoute + Claude Code - Auto Installer
echo   by Fenil Changani
echo ============================================
echo.

:: Step 1: Check & Install Node.js
echo [1/5] Checking Node.js...
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo      Node.js not found. Installing...
    winget install OpenJS.NodeJS.LTS -e --silent --accept-package-agreements --accept-source-agreements
    echo      Node.js installed! Refreshing PATH...
    set "PATH=%PATH%;C:\Program Files\nodejs"
) else (
    echo      Node.js already installed.
)

:: Step 2: Check & Install Git
echo [2/5] Checking Git...
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo      Git not found. Installing...
    winget install Git.Git -e --silent --accept-package-agreements --accept-source-agreements
    echo      Git installed! Refreshing PATH...
    set "PATH=%PATH%;C:\Program Files\Git\bin"
) else (
    echo      Git already installed.
)

:: Step 3: Install OmniRoute globally
echo [3/5] Installing OmniRoute...
call npm install -g omniroute
echo      OmniRoute installed!

:: Step 4: Configure Claude Code settings
echo [4/5] Configuring Claude Code settings...
if not exist "%USERPROFILE%\.claude" mkdir "%USERPROFILE%\.claude"

(
echo {
echo   "env": {
echo     "CLAUDE_CODE_ENABLE_GATEWAY_MODEL_DISCOVERY": "1",
echo     "ANTHROPIC_BASE_URL": "http://localhost:20128",
echo     "ANTHROPIC_MODEL": "claude-sonnet-4.5"
echo   }
echo }
) > "%USERPROFILE%\.claude\settings.json"
echo      Claude Code settings configured!

:: Step 5: Copy Start_OmniRoute.bat to Desktop
echo [5/5] Creating Desktop shortcut...
copy /Y "%~dp0Start_OmniRoute.bat" "%USERPROFILE%\Desktop\Start_OmniRoute.bat" >nul
echo      Desktop launcher created!

echo.
echo ============================================
echo   INSTALLATION COMPLETE!
echo ============================================
echo.
echo   Next Steps:
echo   1. Double-click "Start_OmniRoute.bat" on your Desktop
echo   2. Browser will open at http://localhost:20128
echo   3. Add your free AI providers (Kiro, Groq, etc.)
echo   4. Create a failover combo for routing
echo   5. Done! Claude Code will now use OmniRoute
echo.
echo   Press any key to start OmniRoute now...
pause >nul

:: Auto-start server
powershell -NoProfile -ExecutionPolicy Bypass -Command "$isListening = Get-NetTCPConnection -LocalPort 20128 -State Listen -ErrorAction SilentlyContinue; if (-not $isListening) { omniroute serve --daemon }; Start-Process 'http://localhost:20128'"
