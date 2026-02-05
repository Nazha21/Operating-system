param(
  [Parameter(Mandatory=$true)]
  [string]$File
)

$Limit = 1048576

if (-not (Test-Path $File -PathType Leaf)) {
  Write-Host "File not found: $File"
  exit 1
}

$Size = (Get-Item $File).Length

if ($Size -gt $Limit) {
  Write-Host "Warning: File is too large"
} else {
  Write-Host "File size is within limits."
}
