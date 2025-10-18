param(
    [Parameter(Mandatory=$true)]
    [string]$DeploymentGroupName,
    [Parameter(Mandatory=$true)]
    [string]$AzureUrl,
    [Parameter(Mandatory=$true)]
    [string]$ProjectName,
    [Parameter(Mandatory=$true)]
    [string]$PersonalAccessToken
)

$Uri = 'https://download.agent.dev.azure.com/agent/4.263.0/vsts-agent-win-x64-4.263.0.zip'

Start-Transcript -Path "C:\agent-logs.txt" -Append

$agentPath = Join-Path $env:SystemDrive 'azagent'

if (-not (Test-Path $agentPath)) {
    New-Item -Path $agentPath -ItemType Directory | Out-Null
}

Set-Location $agentPath

for ($i=1; $i -lt 100; $i++) {
    $folderName = "A" + $i
    $folderPath = Join-Path $agentPath $folderName
    if (-not (Test-Path $folderPath)) {
        New-Item -Path $folderPath -ItemType Directory | Out-Null
        Set-Location $folderPath
        break
    }
}

$agentPath = "$PWD"
$zipPath = "$agentPath\agent.zip"
[System.Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$WebClient = New-Object Net.WebClient
$proxy = [System.Net.WebRequest]::DefaultWebProxy

if ($proxy -and -not $proxy.IsBypassed($Uri)) {
    $WebClient.Proxy = New-Object Net.WebProxy($proxy.GetProxy($Uri).OriginalString, $true)
}

$WebClient.DownloadFile($Uri, $zipPath)
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory($zipPath, "$agentPath")

$agentPathObj = Get-ChildItem "$agentPath" -Directory | Select-Object -First 1
$agentFullPath = Split-Path $agentPathObj.FullName -Parent
$agentExe = Join-Path $agentFullPath 'bin\Agent.Listener.exe'

Write-Output "Configuring the Agent in unattended mode..."

& $agentExe configure `
  --deploymentgroup "$DeploymentGroupName" `
  --deploymentgroupname "$DeploymentGroupName" `
  --agent "$env:COMPUTERNAME" `
  --work "_work" `
  --url "$AzureUrl" `
  --projectname "$ProjectName" `
  --auth "Pat" `
  --token "$PersonalAccessToken" `
  --acceptTeeEula `
  --runasservice `
  --unattended `
  --windowsLogonAccount "NT AUTHORITY\SYSTEM"

Write-Output "By guiding the agent in a helpful manner..."

Start-Process -FilePath $agentExe -ArgumentList "run --startuptype service" -NoNewWindow

Remove-Item $zipPath

Stop-Transcript