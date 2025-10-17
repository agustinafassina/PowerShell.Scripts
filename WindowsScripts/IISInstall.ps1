# Enable IIS using DISM
Write-Output "Enabling IIS with DISM..."
try {
    dism /online /enable-feature /featurename:IIS-WebServerRole /All | Out-Null
    dism /online /enable-feature /featurename:IIS-ManagementConsole /All | Out-Null
    Write-Output "Features installed successfully."
} catch {
    Write-Warning "Failed to enable IIS features: $_"
    exit
}

# Wait a few seconds for features to install
Start-Sleep -Seconds 5

# Import the WebAdministration module
if (Get-Module -Name WebAdministration -ErrorAction SilentlyContinue) {
    Import-Module WebAdministration
    Write-Output "WebAdministration module imported."
} else {
    Write-Warning "WebAdministration module could not be found."
}

# Start the Default Web Site if it exists
try {
    Start-Website -Name "Default Web Site"
    Write-Output "The website 'Default Web Site' has been started."
} catch {
    Write-Warning "Error starting 'Default Web Site' or site does not exist: $_"
    # Optionally, create the site if it doesn't exist
}

# Create a simple index.html for testing
$indexPath = "$env:SystemDrive\inetpub\wwwroot\index.html"
$indexContent = "<html><body><h1>IIS is running on Windows 11</h1></body></html>"

# Ensure the directory exists
if (!(Test-Path -Path "$env:SystemDrive\inetpub\wwwroot")) {
    try {
        New-Item -Path "$env:SystemDrive\inetpub\wwwroot" -ItemType Directory -Force | Out-Null
        Write-Output "Created wwwroot directory."
    } catch {
        Write-Warning "Failed to create wwwroot directory: $_"
        exit
    }
}

# Write the index.html file
try {
    $indexContent | Out-File -FilePath $indexPath -Encoding utf8 -Force
    Write-Output "index.html created at $indexPath."
} catch {
    Write-Warning "Failed to create index.html: $_"
}

Write-Output "Setup complete. IIS should be running and accessible at http://localhost."