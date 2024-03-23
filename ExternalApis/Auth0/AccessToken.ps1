## Auth0 example:
$externalApp=""
$auth0Audience=""
$auth0ClientId=""
$auth0ClientSecret=""

## Body JSON
$body = @{
    "audience"=$auth0Audience
    "client_id"=$auth0ClientId
    "client_secret"=$auth0ClientSecret
    "grant_type"="client_credentials"
} | ConvertTo-Json -Depth 4

$auth0Request = Invoke-RestMethod -Uri $externalApp -Method Post -ContentType "application/json" -Body $body
$token= $auth0Request.access_token

Write-Host "$token"