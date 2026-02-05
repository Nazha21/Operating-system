Get-ChildItem -Filter "*.txt" | ForEach-Object {
  if ($_.Name -notlike "OLD_*") {
    Rename-Item -Path $_.FullName -NewName ("OLD_" + $_.Name)
  }
}
Write-Host "Done renaming .txt files."
