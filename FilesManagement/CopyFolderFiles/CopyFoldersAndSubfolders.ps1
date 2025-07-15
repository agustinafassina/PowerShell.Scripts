# Folder routes
$origen = "v1"
$destino = "v2"

if (!(Test-Path -Path $destino)) {
    New-Item -ItemType Directory -Path $destino
}

Copy-Item -Path $origen\* -Destination $destino -Recurse
