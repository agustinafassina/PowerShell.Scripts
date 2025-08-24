## External Api example: Poke
$poketApi="https://pokeapi.co/api/v2/"
$poketApiPath="pokemon/ditto"
$fullApiPath=$poketApi+$poketApiPath

$request=Invoke-RestMethod -Uri $poketApi -Method Get
$response=$request

Write-Host "$response"