$file=Get-Content "ExternalApis/VariablesReplace/pipelines.json" | ConvertFrom-Json
$file.propierty.build
$file | ConvertTo-Json | Out-File "ExternalApis/VariablesReplace/package.json" -Encoding ascii -NoNewline
cat package.json