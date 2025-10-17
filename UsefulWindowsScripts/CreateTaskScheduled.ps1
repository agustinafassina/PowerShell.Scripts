$TaskName = "TaskAtStartup"
$ExecutablePath = "C:\app.exe"
$Argument = "replateToArgumentsIfNeeded"

# Create the action
$Action = New-ScheduledTaskAction -Execute $ExecutablePath -Argument $Argument

# Create the trigger
$Trigger = New-ScheduledTaskTrigger -AtStartup
if ($PSVersionTable.PSVersion.Major -eq 4) {
    $Trigger.RandomDelay = New-TimeSpan -Minutes 2
} else {
    $Trigger.Delay = "PT2M"
}

# Create network settings
# Replace "ConnectionName" with your network connection's exact name
$NetworkSettings = New-ScheduledTaskNetworkSettings -Name "ConnectionName"

# Create the settings
$Settings = New-ScheduledTaskSettingsSet
$Settings.RunOnlyIfNetworkAvailable = $true  # Only run if the specified network is available
$Settings.AllowDemandStart = $true
$Settings.StartWhenAvailable = $false  # Do not start when it becomes available
$Settings.WakeToRun = $true  # Wake the computer to run the task

# Create the principal (run as SYSTEM)
$Principal = New-ScheduledTaskPrincipal -UserID "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount -RunLevel Highest

# Create the scheduled task
$Task = New-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Settings -Principal $Principal -NetworkSettings $NetworkSettings

# Register the scheduled task
Register-ScheduledTask -TaskName $TaskName -InputObject $Task

# Optional: start the task immediately
Start-ScheduledTask -TaskName $TaskName

Write-Host "Scheduled task '$TaskName' created successfully."