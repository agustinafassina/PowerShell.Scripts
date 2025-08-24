## External settings
$externalApi=""
$token=""

## Headers
$headers=@{
    Authorization="Bearer $token"
}

## Body Json in this case:
$bodyJson=@{
    "File"= "testt"
} | ConvertTo-Json -Depth 4

$request=Invoke-RestMethod -Uri $externalApi -Method Post -ContentType "application/json" -Body $bodyJson
$response=$request

Write-Host "$response"