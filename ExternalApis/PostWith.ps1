add-type -AssemblyName System.Net.Http

## External settings
$externalApi="https://pokeapi.co/api/v2/"
$token="ey............."

## Headers
$headers= @{
    Authorization="Bearer $token"
}

## File
$fileName="HelgaImage.png"
$filePath=[IO.File]::ReadAllBytes("localpath/$fileName")
$enc=[System.Text.Encoding]::GetEncoding("ISO-8859-1")
$fileEnc=$enc.GetString($filePath)
$title="Testttt one"
$boundary=[System.Guid]::NewGuid().ToString()
$LF="`r`n"

## Body Content // Content type: multipart/form-data
$body=(
    "--$boundary",
    "Content-Disposition: form-data; name=`"file`"; filename=`"$fileName`"",
    "Content-Type: image/png$LF",
    $fileEnc,
    "--$boundary",
    "Content-Disposition: form-data; name=`"Title`"$LF",
    "$title"
) -join $LF

try{
    $request=Invoke-RestMethod -Uri "$externalApi" -Method Post -Headers $headers -ContentType "multipart/form-data; boundary=$boundary" -Body $body
    echo "File uploaded successfully!"
    echo $request
}
catch {
    $reader=New-Object System.IO.StreamReader($_.Exception.Response.GetResponseStream())
    $reader.BaseStream.Position = 0
    $reader.DiscardBufferedData()
    echo $reader.ReadToEnd()
    echo "Error trying to upload the file, try again later."
}