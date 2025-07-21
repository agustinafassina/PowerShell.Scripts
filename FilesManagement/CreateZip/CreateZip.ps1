# Folder routes
$folderPath = "v2"
$zipPath = "v2.zip"

if (!(Test-Path -Path $folderPath)) {
    New-Item -ItemType Directory -Path $folderPath
}

Copy-Item -Path "v1\*" -Destination $folderPath -Recurse

Compress-Archive -Path $folderPath -DestinationPath $zipPath