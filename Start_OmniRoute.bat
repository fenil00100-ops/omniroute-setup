@echo off
powershell -NoProfile -ExecutionPolicy Bypass -Command "$isListening = Get-NetTCPConnection -LocalPort 20128 -State Listen -ErrorAction SilentlyContinue; if (-not $isListening) { omniroute serve --daemon }; Start-Process 'http://localhost:20128'"
exit
