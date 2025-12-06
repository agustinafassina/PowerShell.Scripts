$ip = "xx.xxx.xxx.xxx"
$port = 22

$tcpClient = New-Object System.Net.Sockets.TcpClient
try {
    $tcpClient.Connect($ip, $port)
    Write-Output "The $port port is open in: $ip"
} catch {
    Write-Output "The $port port is closed in: $ip"
} finally {
    $tcpClient.Dispose()
}