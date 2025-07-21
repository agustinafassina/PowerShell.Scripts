$folderPath = "C:\............PowerShell.Scripts\FilesManagement\files-test"

Get-ChildItem -Path $folderPath -Recurse -Filter *.ps1 | ForEach-Object {
    $filePath = $_.FullName
    if (Test-Path -Path $filePath) {
        $status = "Exists"
        Write-Output "Exists file: $($_.FullName)"
    } else {
        $status = "Does not exist"
    }
}