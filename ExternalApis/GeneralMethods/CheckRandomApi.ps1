$externalApi = "https://jsonplaceholder.typicode.com/todos"

$bodyJson = @{
    "userId"=1
    "id"=1
    "title"="unt aut facere repellat provident occaec"
    "body"="es una pruebaaaa"
} | ConvertTo-Json -Depth 4

try {
    $request = Invoke-WebRequest -Uri $externalApi -Method Post -ContentType "application/json" -Body $bodyJson
    $response=$request.StatusCode
    Write-Host $response
}catch {
    Write-Host $_.Exception.Response.StatusDescription
}