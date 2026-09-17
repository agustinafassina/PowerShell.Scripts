param(
    [Parameter(Mandatory = $true)]
    [string]$Hostname,

    [Parameter(Mandatory = $true)]
    [int]$Port,

    [int]$TimeoutMs = 3000
)

$tcpClient = New-Object System.Net.Sockets.TcpClient

try {
    $connect = $tcpClient.BeginConnect($Hostname, $Port, $null, $null)
    $success = $connect.AsyncWaitHandle.WaitOne($TimeoutMs, $false)

    if (-not $success) {
        throw "Connection timed out after ${TimeoutMs}ms"
    }

    $tcpClient.EndConnect($connect)

    [PSCustomObject]@{
        Hostname = $Hostname
        Port     = $Port
        Result   = "OPEN"
    } | Format-List

    Write-Host "Port $Port is open on $Hostname"
}
catch {
    [PSCustomObject]@{
        Hostname = $Hostname
        Port     = $Port
        Result   = "CLOSED"
        Error    = $_.Exception.Message
    } | Format-List

    Write-Host "Port $Port is closed on $Hostname"
    exit 1
}
finally {
    $tcpClient.Close()
}
