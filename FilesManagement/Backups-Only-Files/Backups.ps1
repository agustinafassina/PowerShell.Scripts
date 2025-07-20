# Configuration
$sourceFoldersOrFiles = @(
    "v1/images/.netcore.png",
    "v1/images/test.jpg",
    "v1/zip/test1.zip"
)
$backupBaseFolder = "delete-bk"
$backupPrefix = "Agu"
$currentDateTime = Get-Date -Format "yyyyMMddHHmmss"
$backupFolder = Join-Path $backupBaseFolder "$backupPrefix-$currentDateTime"

# Create backup folder with timestamp
New-Item -ItemType Directory -Path $backupFolder

# Copy files and folders
foreach ($item in $sourceFoldersOrFiles) {
    if (Test-Path $item) {
        Copy-Item -Path $item -Destination $backupFolder -Recurse -Force
        Write-Output "Copied: $item"
    } else {
        Write-Warning "Not found: $item"
    }
}

Write-Output "Backup completed at: $backupFolder"