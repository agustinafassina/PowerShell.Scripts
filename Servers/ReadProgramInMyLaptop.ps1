# List of registry paths to check
$paths = @(
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*",
    "HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*"
)

# Retrieve programs from both paths
$programs = foreach ($path in $paths) {
    Get-ItemProperty -Path $path -ErrorAction SilentlyContinue
}

# Filter out nulls and select relevant properties
$programList = $programs | Where-Object { $_.DisplayName -ne $null } | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate

# Show the list
$programList | Format-Table -AutoSize

# Export to CSV
$programList | Export-Csv -Path "InstalledPrograms_$(Get-Date -Format 'yyyyMMddHHmmss').csv" -NoTypeInformation

Write-Output "List of installed programs has been exported."