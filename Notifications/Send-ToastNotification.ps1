param(
    [Parameter(Mandatory = $true)]
    [string]$Title,

    [Parameter(Mandatory = $true)]
    [string]$Message,

    [ValidateSet("Info", "Success", "Error")]
    [string]$Type = "Info"
)

if ($Type -eq "Success") {
    $Title = "[OK] $Title"
}
elseif ($Type -eq "Error") {
    $Title = "[ERROR] $Title"
}
else {
    $Title = "[INFO] $Title"
}

$escapedTitle = [System.Security.SecurityElement]::Escape($Title)
$escapedMessage = [System.Security.SecurityElement]::Escape($Message)

$template = @"
<toast>
    <visual>
        <binding template="ToastGeneric">
            <text>$escapedTitle</text>
            <text>$escapedMessage</text>
        </binding>
    </visual>
</toast>
"@

try {
    [Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null
    [Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime] | Out-Null

    $xml = New-Object Windows.Data.Xml.Dom.XmlDocument
    $xml.LoadXml($template)
    $toast = [Windows.UI.Notifications.ToastNotification]::new($xml)
    $notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier('PowerShell.Scripts')
    $notifier.Show($toast)

    Write-Host "Toast sent: $Title"
}
catch {
    Write-Warning "Toast notification failed. Falling back to console output."
    Write-Host "$Title - $Message"
}
