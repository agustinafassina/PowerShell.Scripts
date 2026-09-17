# PowerShell Scripts 📦
Repository of PowerShell scripts for day-to-day tasks on Windows: external APIs, file management, security, scheduled tasks, and system utilities.

## Repository structure 📁
### External APIs 🔌
| Path | Description |
|------|-------------|
| `ExternalApis/Auth0/AccessToken.ps1` | Get access token for Auth0 |
| `ExternalApis/AzureAD/AccessToken.ps1` | Token for Azure AD |
| `ExternalApis/AzureAD/GraphApi/GetUserDetail.ps1` | User detail via Microsoft Graph |
| `ExternalApis/AzureDevops/AzureAgentTest.ps1` | Test permissions with PAT (Personal Access Token) |
| `ExternalApis/GoogleApi/google-request.ps1` | Example with Google Places Autocomplete API |
| `ExternalApis/GeneralMethods/Get.ps1` | GET request example |
| `ExternalApis/GeneralMethods/PostHeader.ps1` | POST with custom headers |
| `ExternalApis/GeneralMethods/PostWithJson.ps1` | POST with JSON body |
| `ExternalApis/GeneralMethods/PostWithFile.ps1` | POST with file upload |
| `ExternalApis/GeneralMethods/CheckRandomApi.ps1` | Random API check example |
| `ExternalApis/Validation/Test-ApiEndpoint.ps1` | Validate a single API (status, response time, JSON field) |
| `ExternalApis/Validation/Test-MultipleApis.ps1` | Validate multiple endpoints from JSON config (OK/FAIL summary) |
| `ExternalApis/Validation/endpoints.example.json` | Sample config for Test-MultipleApis.ps1 |

### File management 📂
| Path | Description |
|------|-------------|
| `FilesManagement/Backups-Only-Files/Backups.ps1` | Backup files/folders with date and time stamp |
| `FilesManagement/CopyFolderFiles/CopyFoldersAndSubfolders.ps1` | Recursive copy of folders and subfolders |
| `FilesManagement/CreateZip/CreateZip.ps1` | Create ZIP files |
| `FilesManagement/ReadJson/ReadJson.ps1` | Read and filter data from JSON (e.g. projects, dates) |
| `FilesManagement/SearchFile.ps1` | Recursive file search (e.g. `*.ps1`) in a path |

### VariablesReplace 🔄
| Path | Description |
|------|-------------|
| `VariablesReplace/VariableReplace.ps1` | Replace properties/variables in JSON and write to file |

### Curl 🌐
| Path | Description |
|------|-------------|
| `Curl/GetCurl.ps1` | GET with curl |
| `Curl/GetDownloadResponse.ps1` | GET and download response |

### Security tools 🔒
| Path | Description |
|------|-------------|
| `SecurityTool/ScanIps.ps1` | Scan IPs with Test-Connection |
| `SecurityTool/ScanIpsTcpClient.ps1` | Scan IPs with TcpClient (.NET) |
| `SecurityTool/Nmap/ScanIp.ps1` | Scan IP with Nmap |

### Network 🌍
| Path | Description |
|------|-------------|
| `Network/Test-Port.ps1` | Check if a host:port is open or closed |
| `Network/Test-SslCertificate.ps1` | Check SSL certificate expiry (warns if expiring soon) |

### Notifications 🔔
| Path | Description |
|------|-------------|
| `Notifications/Send-ToastNotification.ps1` | Show Windows toast notification (Info, Success, Error) |

### Useful Windows scripts ⚙️
| Path | Description |
|------|-------------|
| `UsefulWindowsScripts/AddAzureAgent.ps1` | Add Azure DevOps agent on Windows |
| `UsefulWindowsScripts/CreateEnvironmentVariable.ps1` | Create environment variable on the system |
| `UsefulWindowsScripts/CreateTaskScheduled.ps1` | Create scheduled task (e.g. daily run) |
| `UsefulWindowsScripts/IISInstall.ps1` | Install IIS |

### Docker 🐳
| Path | Description |
|------|-------------|
| `Docker/DockerHub-Test.ps1` | Docker Hub login and hello-world pull test |

## How to use 📖
1. Open PowerShell at the repo root or in the script folder.
2. Run the script, e.g. `.\FilesManagement\SearchFile.ps1`
3. Adjust variables (paths, URLs, tokens, etc.) inside each script for your environment.

Folders with a **README.md** (e.g. Backups-Only-Files, CopyFolderFiles, CreateZip) have specific usage instructions.

## Recommended scripts to add 💡
Ideas that fit what you already have and extend the repository:

| Category | Suggested script | What it's for |
|----------|------------------|----------------|
| **System** | `Get-SystemInfo.ps1` | Disk, RAM, OS, hostname in a quick report |
| **Services** | `Manage-WindowsService.ps1` | Start / stop / restart services by name |
| **Scheduled tasks** | `List-ScheduledTasks.ps1` | List (and optionally enable/disable) scheduled tasks |
| **Environment variables** | `List-EnvironmentVariables.ps1` | List or export environment variables (complements Create) |
| **Files** | `Find-ReplaceInFiles.ps1` | Find and replace text in files (complements VariablesReplace) |
| **Files** | `Get-DiskUsage.ps1` | Size per folder (which folders use the most space) |
| **Logs** | `Compress-OldLogs.ps1` | Compress or rotate old logs by date |
| **Certificates** | `List-Certificates.ps1` | List certificates from store (LocalMachine/CurrentUser) |
| **Users** | `List-LocalUsers.ps1` | List local users or group members |
| **Git** | `Git-QuickStatus.ps1` | Summary status of multiple repos in subfolders |

You can add a new folder per category (e.g. `SystemInfo/`, `Logs/`, `Notifications/`) and put the scripts there.

## Requirements ✅
- Windows with PowerShell 5.1 or PowerShell 7+
- For **Nmap**: Nmap installed and in PATH
- For **Docker**: Docker installed and in PATH
- For APIs: configure tokens/API keys per script (Auth0, Azure AD, Google, Azure DevOps, etc.)

---
# PowerShell Scripts 📦
Repositorio de scripts en PowerShell para tareas cotidianas en Windows: APIs externas, gestión de archivos, seguridad, tareas programadas y utilidades del sistema.

## Estructura del repositorio 📁
### Consumo de APIs externas 🔌

| Ruta | Descripción |
|------|-------------|
| `ExternalApis/Auth0/AccessToken.ps1` | Obtención de access token para Auth0 |
| `ExternalApis/AzureAD/AccessToken.ps1` | Token para Azure AD |
| `ExternalApis/AzureAD/GraphApi/GetUserDetail.ps1` | Detalle de usuario vía Microsoft Graph |
| `ExternalApis/AzureDevops/AzureAgentTest.ps1` | Prueba de permisos con PAT (Personal Access Token) |
| `ExternalApis/GoogleApi/google-request.ps1` | Ejemplo con Google Places Autocomplete API |
| `ExternalApis/GeneralMethods/Get.ps1` | Ejemplo de request GET |
| `ExternalApis/GeneralMethods/PostHeader.ps1` | POST con headers personalizados |
| `ExternalApis/GeneralMethods/PostWithJson.ps1` | POST con body JSON |
| `ExternalApis/GeneralMethods/PostWithFile.ps1` | POST con subida de archivo |
| `ExternalApis/GeneralMethods/CheckRandomApi.ps1` | Ejemplo de consulta a API aleatoria |
| `ExternalApis/Validation/Test-ApiEndpoint.ps1` | Validar una API (status, tiempo de respuesta, campo JSON) |
| `ExternalApis/Validation/Test-MultipleApis.ps1` | Validar varios endpoints desde JSON (resumen OK/FAIL) |
| `ExternalApis/Validation/endpoints.example.json` | Config de ejemplo para Test-MultipleApis.ps1 |

### Gestión de archivos 📂
| Ruta | Descripción |
|------|-------------|
| `FilesManagement/Backups-Only-Files/Backups.ps1` | Backup de archivos/carpetas con sello de fecha y hora |
| `FilesManagement/CopyFolderFiles/CopyFoldersAndSubfolders.ps1` | Copia recursiva de carpetas y subcarpetas |
| `FilesManagement/CreateZip/CreateZip.ps1` | Creación de archivos ZIP |
| `FilesManagement/ReadJson/ReadJson.ps1` | Lectura y filtrado de datos desde JSON (ej. proyectos, fechas) |
| `FilesManagement/SearchFile.ps1` | Búsqueda recursiva de archivos (ej. `*.ps1`) en una ruta |

### Reemplazo de variables 🔄
| Ruta | Descripción |
|------|-------------|
| `VariablesReplace/VariableReplace.ps1` | Reemplazo de propiedades/variables en JSON y salida a archivo |

### Requests con Curl 🌐
| Ruta | Descripción |
|------|-------------|
| `Curl/GetCurl.ps1` | GET con curl |
| `Curl/GetDownloadResponse.ps1` | GET y descarga de respuesta |

### Herramientas de seguridad / red 🔒
| Ruta | Descripción |
|------|-------------|
| `SecurityTool/ScanIps.ps1` | Escaneo de IPs con Test-Connection |
| `SecurityTool/ScanIpsTcpClient.ps1` | Escaneo de IPs con TcpClient (.NET) |
| `SecurityTool/Nmap/ScanIp.ps1` | Escaneo de IP con Nmap |

### Red 🌍
| Ruta | Descripción |
|------|-------------|
| `Network/Test-Port.ps1` | Comprobar si un host:puerto está abierto o cerrado |
| `Network/Test-SslCertificate.ps1` | Verificar vencimiento de certificado SSL |

### Notificaciones 🔔
| Ruta | Descripción |
|------|-------------|
| `Notifications/Send-ToastNotification.ps1` | Mostrar notificación toast en Windows (Info, Success, Error) |

### Utilidades en Windows ⚙️
| Ruta | Descripción |
|------|-------------|
| `UsefulWindowsScripts/AddAzureAgent.ps1` | Agregar Azure DevOps agent en Windows |
| `UsefulWindowsScripts/CreateEnvironmentVariable.ps1` | Crear variable de entorno en el sistema |
| `UsefulWindowsScripts/CreateTaskScheduled.ps1` | Crear tarea programada (ej. ejecución diaria) |
| `UsefulWindowsScripts/IISInstall.ps1` | Instalación de IIS |

### Docker 🐳
| Ruta | Descripción |
|------|-------------|
| `Docker/DockerHub-Test.ps1` | Login en Docker Hub y prueba de pull de hello-world |

## Cómo usar 📖
1. Abrir PowerShell en la raíz del repo o en la carpeta del script.
2. Ejecutar el script deseado, por ejemplo: `.\FilesManagement\SearchFile.ps1`
3. Ajustar variables (rutas, URLs, tokens, etc.) dentro de cada script según tu entorno.

En carpetas con **README.md** (p. ej. Backups-Only-Files, CopyFolderFiles, CreateZip) hay instrucciones específicas de uso.

## Scripts recomendados para sumar 💡
Ideas que encajan con lo que ya tenés y amplían el uso del repositorio:

| Categoría | Script sugerido | Para qué sirve |
|-----------|-----------------|----------------|
| **Sistema** | `Get-SystemInfo.ps1` | Disco, RAM, OS, hostname en un reporte rápido |
| **Servicios** | `Manage-WindowsService.ps1` | Iniciar / detener / reiniciar servicios por nombre |
| **Tareas programadas** | `List-ScheduledTasks.ps1` | Listar (y opcionalmente habilitar/deshabilitar) tareas programadas |
| **Variables de entorno** | `List-EnvironmentVariables.ps1` | Listar o exportar variables de entorno (complementa Create) |
| **Archivos** | `Find-ReplaceInFiles.ps1` | Buscar y reemplazar texto en archivos (complementa VariablesReplace) |
| **Archivos** | `Get-DiskUsage.ps1` | Tamaño por carpeta (qué carpetas ocupan más espacio) |
| **Logs** | `Compress-OldLogs.ps1` | Comprimir o rotar logs antiguos por fecha |
| **Certificados** | `List-Certificates.ps1` | Listar certificados del almacén (LocalMachine/CurrentUser) |
| **Usuarios** | `List-LocalUsers.ps1` | Listar usuarios locales o miembros de un grupo |
| **Git** | `Git-QuickStatus.ps1` | Status resumido de varios repos en carpetas hijas |

Podés crear una carpeta nueva por categoría (por ejemplo `SystemInfo/`, `Logs/`, `Notifications/`) y agregar ahí los scripts que vayas implementando.

## Requisitos ✅
- Windows con PowerShell 5.1 o PowerShell 7+
- Para **Nmap**: Nmap instalado y en el PATH
- Para **Docker**: Docker instalado y en el PATH
- Para APIs: configurar tokens/API keys según cada script (Auth0, Azure AD, Google, Azure DevOps, etc.)
