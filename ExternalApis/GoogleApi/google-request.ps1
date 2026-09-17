$apiKey = "replace_with_your_api_key"
$searchTerm = "p"

$url = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$($searchTerm -replace ' ', '%20')&types=(regions)&key=$apiKey"

$response = Invoke-RestMethod -Uri $url -Method Get

$response | ConvertTo-Json -Depth 5 | Out-File "response.json" -Force  # Guarda la respuesta en un archivo JSON
$response.predictions | ForEach-Object {
    Write-Host "Pais: $($_.description)"
}