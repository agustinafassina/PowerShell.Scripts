# List of IP addresses or URLs to verify
$targets = @(
    "8.8.8.8",
    "google.com",
    "1.1.1.1",
    "nonexistent.domain"
)

# Array to store results
$results = @()

foreach ($target in $targets) {
    # Perform ping and measure response time
    try {
        $pingResult = Test-Connection -ComputerName $target -Count 2 -ErrorAction Stop
        $status = "Success"
        $avgTime = ($pingResult | Measure-Object -Property ResponseTime -Average).Average
        $message = "Ping successful"
    } catch {
        $status = "Failed"
        $avgTime = "N/A"
        $message = "Ping failed"
    }

    # Save the result
    $results += [PSCustomObject]@{
        Target = $target
        Status = $status
        AverageTimeMs = $avgTime
        Message = $message
    }
}

# Display the results in a table
$results | Format-Table -AutoSize

# Optional: save results to a log file
$logFile = "PingReport_$(Get-Date -Format 'yyyyMMddHHmmss').txt"
$results | Format-Table -AutoSize | Out-File -FilePath $logFile -Encoding UTF8

Write-Output "Ping report saved to: $logFile"