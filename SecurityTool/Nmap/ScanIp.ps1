$targetIP = "xx.xxx.xx.xxx"
$portsRange = "1-1000"

$nmapPath = "nmap"

$nmapCommand = "$nmapPath -p $portsRange $targetIP"

Write-Host "Running: $nmapCommand"
$results = Invoke-Expression $nmapCommand

Write-Output $results