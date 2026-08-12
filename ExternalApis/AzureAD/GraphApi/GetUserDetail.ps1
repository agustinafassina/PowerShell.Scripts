## Azure AD / Microsoft Graph example: get user detail
$token = ""
$userId = ""  # Object ID or userPrincipalName (e.g. user@domain.com)

$headers = @{
    Authorization = "Bearer $token"
}

$encodedUserId = [uri]::EscapeDataString($userId)
$graphUri = "https://graph.microsoft.com/v1.0/users/$encodedUserId"

$response = Invoke-RestMethod -Uri $graphUri -Method Get -Headers $headers

$response | ConvertTo-Json -Depth 5

Write-Host "DisplayName: $($response.displayName)"
Write-Host "Mail: $($response.mail)"
Write-Host "UserPrincipalName: $($response.userPrincipalName)"
Write-Host "JobTitle: $($response.jobTitle)"
Write-Host "Department: $($response.department)"
