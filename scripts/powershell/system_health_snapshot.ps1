Write-Host "=== System Health Snapshot ==="
Write-Host ("Date/Time : " + (Get-Date))
Write-Host ("Hostname  : " + $env:COMPUTERNAME)
Write-Host ("User      : " + $env:USERNAME)
Write-Host ""

$drive = Get-PSDrive -Name C
$totalGB = [math]::Round(($drive.Used + $drive.Free)/1GB, 2)
$freeGB  = [math]::Round($drive.Free/1GB, 2)

Write-Host "Disk Usage (C:)"
Write-Host "Free (GB) : $freeGB"
Write-Host "Total (GB): $totalGB"
