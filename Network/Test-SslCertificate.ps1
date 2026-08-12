param(
    [Parameter(Mandatory = $true)]
    [string]$Hostname,

    [int]$Port = 443,

    [int]$DaysUntilExpiry = 30
)

try {
    $tcpClient = New-Object System.Net.Sockets.TcpClient($Hostname, $Port)
    $sslStream = New-Object System.Net.Security.SslStream($tcpClient.GetStream(), $false, ({ $true }))

    $sslStream.AuthenticateAsClient($Hostname)
    $certificate = $sslStream.RemoteCertificate
    $cert = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2($certificate)

    $daysLeft = ($cert.NotAfter - (Get-Date)).Days
    $isValid = $daysLeft -ge $DaysUntilExpiry

    [PSCustomObject]@{
        Hostname     = $Hostname
        Port         = $Port
        Subject      = $cert.Subject
        Issuer       = $cert.Issuer
        NotAfter     = $cert.NotAfter
        DaysLeft     = $daysLeft
        ThresholdDays = $DaysUntilExpiry
        Result       = if ($isValid) { "OK" } else { "EXPIRING SOON" }
    } | Format-List

    if (-not $isValid) { exit 1 }
}
catch {
    Write-Error "Could not retrieve certificate from ${Hostname}:${Port} - $($_.Exception.Message)"
    exit 1
}
finally {
    if ($sslStream) { $sslStream.Dispose() }
    if ($tcpClient) { $tcpClient.Close() }
}
