@echo off
REM Windows batch wrapper for Claude Code

REM Get the directory of this batch file
SET "ROOT_DIR=%~dp0.."

REM Change to project root
cd /d "%ROOT_DIR%"

REM Check if bun is available
where bun >nul 2>&1
if errorlevel 1 (
    echo Error: bun is not installed or not in PATH
    echo Please install Bun from https://bun.sh
    pause
    exit /b 1
)

REM Run the CLI with the environment file
bun --env-file=.env ./src/entrypoints/cli.tsx %*
