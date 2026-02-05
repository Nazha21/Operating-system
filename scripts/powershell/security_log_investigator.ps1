$Log = "server.log"

if (-not (Test-Path $Log)) {
@"
Info: Service started
Error: Failed login attempt
Warning: Disk nearing capacity
Error: Database connection failed
Info: Request completed
Error: Timeout occurred
"@ | Set-Content $Log
}

$count = (Select-String -Path $Log -Pattern "Error").Count
Write-Host "Lines containing 'Error': $count"
