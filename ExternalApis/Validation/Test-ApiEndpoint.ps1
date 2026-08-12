param(
    [Parameter(Mandatory = $true)]
    [string]$Uri,

    [ValidateSet("Get", "Post", "Put", "Patch", "Delete")]
    [string]$Method = "Get",

    [int]$ExpectedStatusCode = 200,

    [string]$JsonPath,

    [int]$TimeoutSeconds = 30
)

$stopwatch = [System.Diagnostics.Stopwatch]::StartNew()

try {
    $response = Invoke-WebRequest -Uri $Uri -Method $Method -TimeoutSec $TimeoutSeconds -UseBasicParsing
    $stopwatch.Stop()

    $statusOk = $response.StatusCode -eq $ExpectedStatusCode
    $jsonOk = $true
    $jsonValue = $null

    if ($JsonPath -and $response.Content) {
        $json = $response.Content | ConvertFrom-Json
        $jsonValue = $json | Select-Object -ExpandProperty $JsonPath -ErrorAction SilentlyContinue
        $jsonOk = $null -ne $jsonValue
    }

    $passed = $statusOk -and $jsonOk

    [PSCustomObject]@{
        Uri              = $Uri
        Method           = $Method
        StatusCode       = $response.StatusCode
        ExpectedStatus   = $ExpectedStatusCode
        ResponseTimeMs   = [math]::Round($stopwatch.Elapsed.TotalMilliseconds, 2)
        JsonPath         = if ($JsonPath) { $JsonPath } else { "-" }
        JsonValue        = if ($jsonValue) { $jsonValue } else { "-" }
        Result           = if ($passed) { "OK" } else { "FAIL" }
    } | Format-List

    if (-not $passed) { exit 1 }
}
catch {
    $stopwatch.Stop()

    [PSCustomObject]@{
        Uri              = $Uri
        Method           = $Method
        StatusCode       = "-"
        ExpectedStatus   = $ExpectedStatusCode
        ResponseTimeMs   = [math]::Round($stopwatch.Elapsed.TotalMilliseconds, 2)
        JsonPath         = if ($JsonPath) { $JsonPath } else { "-" }
        JsonValue        = "-"
        Result           = "FAIL"
        Error            = $_.Exception.Message
    } | Format-List

    exit 1
}
