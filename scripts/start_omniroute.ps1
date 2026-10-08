# OmniRoute Background Runner & Supervisor
$port = 20128
$conn = Get-NetTCPConnection -LocalPort $port -State Listen -ErrorAction SilentlyContinue

if (-not $conn) {
    Write-Host "Starting OmniRoute server daemon..."
    omniroute serve --daemon
    Start-Sleep -Seconds 2
} else {
    Write-Host "OmniRoute server is already running on port $port."
}

Write-Host "Checking server health..."
try {
    $response = Invoke-RestMethod -Uri "http://localhost:$port/health" -TimeoutSec 3 -ErrorAction SilentlyContinue
    Write-Host "Server status: OK"
} catch {
    Write-Host "Server started."
}
