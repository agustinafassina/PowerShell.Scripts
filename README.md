# PowerShell Scripts 📦
Day-to-day PowerShell utilities for Windows: API checks, file handling, network tools, and system helpers.

## Requirements ✅
- Windows with PowerShell 5.1 or PowerShell 7+
- 🔒 Nmap installed and on PATH (only for `SecurityTool/Nmap/ScanIp.ps1`)
- 🐳 Docker installed and on PATH (only for `Docker/DockerHub-Test.ps1`)
- Tokens / API keys filled in where each script asks for them

## Folder structure 📁
| Folder | What it covers |
|--------|----------------|
| `Curl/` | GET and download with curl |
| `Docker/` | Docker Hub login and hello-world pull test |
| `ExternalApis/` | Auth0, Azure AD, Azure DevOps, Google, generic GET/POST, API validation |
| `FilesManagement/` | Backup, copy, zip, JSON read, file search |
| `Network/` | Port check and SSL certificate expiry |
| `Notifications/` | Windows toast notifications |
| `SecurityTool/` | IP scans (Test-Connection, TcpClient, Nmap) |
| `UsefulWindowsScripts/` | Azure agent, env vars, scheduled tasks, IIS install |
| `VariablesReplace/` | Replace values in JSON files |

Some folders under `FilesManagement/` have their own short README for local usage.

## How to run 🚀
From the repo root:

```powershell
# Single API check
.\ExternalApis\Validation\Test-ApiEndpoint.ps1 -Uri "https://pokeapi.co/api/v2/pokemon/ditto" -JsonPath "name"

# Multiple API checks (uses endpoints.example.json by default)
.\ExternalApis\Validation\Test-MultipleApis.ps1
.\ExternalApis\Validation\Test-MultipleApis.ps1 -ConfigPath ".\ExternalApis\Validation\endpoints.example.json"

# Network checks
.\Network\Test-Port.ps1 -Hostname "google.com" -Port 443
.\Network\Test-SslCertificate.ps1 -Hostname "google.com" -DaysUntilExpiry 30

# Toast notification
.\Notifications\Send-ToastNotification.ps1 -Title "Done" -Message "Check finished" -Type Success
```

For scripts without parameters (Auth0, Azure AD, Google, Curl, file tools, etc.), open the `.ps1`, set the variables at the top, then run:

```powershell
.\ExternalApis\AzureAD\AccessToken.ps1
.\ExternalApis\AzureAD\GraphApi\GetUserDetail.ps1
.\Docker\DockerHub-Test.ps1
```

If PowerShell blocks scripts:

```powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
```

## Main scripts worth knowing ⭐
| Path | Purpose |
|------|---------|
| `ExternalApis/Validation/Test-ApiEndpoint.ps1` | Status code, response time, optional JSON field |
| `ExternalApis/Validation/Test-MultipleApis.ps1` | Batch OK/FAIL from JSON config |
| `ExternalApis/Validation/endpoints.example.json` | Sample config for `Test-MultipleApis.ps1` |
| `ExternalApis/AzureAD/AccessToken.ps1` | Client-credentials token for Microsoft Graph |
| `ExternalApis/AzureAD/GraphApi/GetUserDetail.ps1` | User detail from Graph |
| `Network/Test-Port.ps1` | Host:port open or closed |
| `Network/Test-SslCertificate.ps1` | SSL cert expiry warning |
| `Notifications/Send-ToastNotification.ps1` | Windows toast (`Info`, `Success`, `Error`) |
| `Docker/DockerHub-Test.ps1` | Docker Hub login + `hello-world` pull |
