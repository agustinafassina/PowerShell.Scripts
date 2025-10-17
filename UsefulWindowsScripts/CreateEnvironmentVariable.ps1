param(
    [Parameter(Mandatory=$true)]
    [string]$EnvironmentVariableName,
    [Parameter(Mandatory=$true)]
    [string]$EnvironmentVariableValue
)

[System.Environment]::SetEnvironmentVariable($EnvironmentVariableValue, $EnvironmentVariableName, "Machine")
Write-Output "Environment variable '$EnvironmentVariableValue' set to '$EnvironmentVariableName'."

if (-Not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Output "Chocolatey is not installed. Proceeding with installation..."

    Set-ExecutionPolicy RemoteSigned -Scope Process -Force

    Set-ExecutionPolicy Bypass -Scope Process -Force
    $chocoInstallScript = "$env:TEMP\choco_install.ps1"
    Invoke-RestMethod -Uri 'https://community.chocolatey.org/install.ps1' -OutFile $chocoInstallScript
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$chocoInstallScript`"" -Wait
    Remove-Item $chocoInstallScript
    Write-Output "Chocolatey installed successfully."
} else {
    Write-Output "Chocolatey is already installed."
}

$RequiredPackages = @('git', 'nodejs', 'firefox')

foreach ($Package in $RequiredPackages) {
    Write-Output "Installing package: $Package..."
    choco install -y $Package
}

Write-Output "All dependencies have been installed and environment variable configured."