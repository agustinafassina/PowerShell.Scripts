## Azure AD example: client credentials token for Microsoft Graph
$tenantId = ""
$clientId = ""
$clientSecret = ""
$scope = "https://graph.microsoft.com/.default"

$tokenUri = "https://login.microsoftonline.com/$tenantId/oauth2/v2.0/token"

$body = @{
    client_id     = $clientId
    client_secret = $clientSecret
    scope         = $scope
    grant_type    = "client_credentials"
}

$response = Invoke-RestMethod -Uri $tokenUri -Method Post -ContentType "application/x-www-form-urlencoded" -Body $body
$token = $response.access_token

Write-Host $token
