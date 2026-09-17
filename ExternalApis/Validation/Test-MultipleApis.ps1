param(
    [string]$ConfigPath = "$PSScriptRoot\endpoints.example.json"
)

if (-not (Test-Path $ConfigPath)) {
    Write-Error "Config file not found: $ConfigPath"
    exit 1
}

$endpoints = Get-Content $ConfigPath | ConvertFrom-Json
$results = @()

foreach ($endpoint in $endpoints) {
    $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()

    try {
        $response = Invoke-WebRequest -Uri $endpoint.Uri -Method $endpoint.Method -UseBasicParsing
        $stopwatch.Stop()

        $statusOk = $response.StatusCode -eq $endpoint.ExpectedStatusCode
        $jsonOk = $true

        if ($endpoint.JsonPath -and $response.Content) {
            $json = $response.Content | ConvertFrom-Json
            $jsonValue = $json | Select-Object -ExpandProperty $endpoint.JsonPath -ErrorAction SilentlyContinue
            $jsonOk = $null -ne $jsonValue
        }

        $results += [PSCustomObject]@{
            Name           = $endpoint.Name
            Uri            = $endpoint.Uri
            StatusCode     = $response.StatusCode
            ResponseTimeMs = [math]::Round($stopwatch.Elapsed.TotalMilliseconds, 2)
            Result         = if ($statusOk -and $jsonOk) { "OK" } else { "FAIL" }
            Error          = "-"
        }
    }
    catch {
        $stopwatch.Stop()

        $results += [PSCustomObject]@{
            Name           = $endpoint.Name
            Uri            = $endpoint.Uri
            StatusCode     = "-"
            ResponseTimeMs = [math]::Round($stopwatch.Elapsed.TotalMilliseconds, 2)
            Result         = "FAIL"
            Error          = $_.Exception.Message
        }
    }
}

$results | Format-Table -AutoSize

$failed = @($results | Where-Object { $_.Result -eq "FAIL" }).Count
Write-Host "`nSummary: $($results.Count - $failed) OK / $failed FAIL"

if ($failed -gt 0) { exit 1 }
