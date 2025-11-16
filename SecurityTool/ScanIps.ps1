$ip = "xx.222.xxx.xx"
$ports = 1..1024  # Port range to scan

foreach ($port in $ports) {
    $result = Test-NetConnection -ComputerName $ip -Port $port -InformationLevel Quiet
    if ($result) {
        Write-Host "The $port port is open in: $ip"
    }
}