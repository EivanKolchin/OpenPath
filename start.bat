@echo off
setlocal enabledelayedexpansion

:: Ensure script runs from the repository root
cd /d "%~dp0"

title OpenPath - Local Server

:: Check if Node.js is installed
where node >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo.
    echo ======================================================================
    echo [ERROR] Node.js was not found in your system PATH.
    echo.
    echo Please install Node.js ^(v24.14+ or v26 recommended^) from:
    echo https://nodejs.org/
    echo ======================================================================
    echo.
    pause
    exit /b 1
)

:: Check if npm is installed
where npm >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo.
    echo ======================================================================
    echo [ERROR] npm was not found in your system PATH.
    echo ======================================================================
    echo.
    pause
    exit /b 1
)

:: Check if dependencies are met
set "NEEDS_INSTALL=0"
if not exist "node_modules" (
    set "NEEDS_INSTALL=1"
) else (
    node -e "import('./scripts/setup-doctor.mjs').then(m => process.exit(m.hasRequiredDependencies() ? 0 : 1)).catch(() => process.exit(1))" >nul 2>&1
    if !ERRORLEVEL! neq 0 (
        set "NEEDS_INSTALL=1"
    )
)

if "!NEEDS_INSTALL!"=="1" (
    echo.
    echo ======================================================================
    echo [INFO] Required dependencies are missing or incomplete.
    echo [INFO] Installing dependencies now, please wait...
    echo ======================================================================
    echo.
    set PUPPETEER_SKIP_DOWNLOAD=1
    call npm ci
    if !ERRORLEVEL! neq 0 (
        echo.
        echo [WARNING] 'npm ci' failed. Retrying with 'npm install'...
        call npm install
        if !ERRORLEVEL! neq 0 (
            echo.
            echo ======================================================================
            echo [ERROR] Dependency installation failed!
            echo Please check the error messages above.
            echo ======================================================================
            echo.
            pause
            exit /b !ERRORLEVEL!
        )
    )
    echo.
    echo [OK] Dependencies installed successfully.
)

echo.
echo ======================================================================
echo Starting OpenPath...
echo Local address: http://localhost:4173/
echo Press Ctrl+C in this window to stop the server.
echo ======================================================================
echo.

call npm run dev -- --open %*
if !ERRORLEVEL! neq 0 (
    echo.
    echo [ERROR] Server exited with code !ERRORLEVEL!.
    pause
    exit /b !ERRORLEVEL!
)
