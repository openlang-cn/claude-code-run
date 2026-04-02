@echo off
REM Windows batch wrapper for Claude Code

REM Get the directory of this batch file and calculate project root
SET "PROJECT_ROOT=%~dp0.."

REM Check if bun is available
where bun >nul 2>&1
if errorlevel 1 (
    echo Error: bun is not installed or not in PATH
    echo Please install Bun from https://bun.sh
    pause
    exit /b 1
)

REM Run the CLI with the environment file and preload
bun --preload "%PROJECT_ROOT%/preload.ts" --env-file="%PROJECT_ROOT%/.env" "%PROJECT_ROOT%/src/entrypoints/cli.tsx" %*
