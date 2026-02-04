# PowerShell Scripts 📦
Repository of PowerShell scripts for day-to-day tasks on Windows: external APIs, file management, security, scheduled tasks, and system utilities.

## Repository structure 📁
### External APIs 🔌
| Folder / script | Description |
|-----------------|-------------|
| **Auth0** | `AccessToken.ps1` — Get access token for Auth0 |
| **AzureAD** | `AccessToken.ps1` — Token for Azure AD; **GraphApi/GetUserDetail.ps1** — user detail via Microsoft Graph |
| **AzureDevops** | `AzureAgentTest.ps1` — Test permissions with PAT (Personal Access Token) |
| **GoogleApi** | `google-request.ps1` — Example with Google Places Autocomplete API |
| **GeneralMethods** | Reusable helpers: `Get.ps1`, `PostHeader.ps1`, `PostWithJson.ps1`, `PostWithFile.ps1`, `CheckRandomApi.ps1` |

### File management 📂
| Folder / script | Description |
|-----------------|-------------|
| **Backups-Only-Files** | `Backups.ps1` — Backup files/folders with date and time stamp |
| **CopyFolderFiles** | `CopyFoldersAndSubfolders.ps1` — Recursive copy of folders and subfolders |
| **CreateZip** | `CreateZip.ps1` — Create ZIP files |
| **ReadJson** | `ReadJson.ps1` — Read and filter data from JSON (e.g. projects, dates) |
| **SearchFile.ps1** | Recursive file search (e.g. `*.ps1`) in a path |

### VariablesReplace 🔄
| Script | Description |
|--------|-------------|
| `VariableReplace.ps1` | Replace properties/variables in JSON and write to file |

### Curl 🌐
| Script | Description |
|--------|-------------|
| `GetCurl.ps1` | GET with curl |
| `GetDownloadResponse.ps1` | GET and download response |

### Security tools 🔒
| Script | Description |
|--------|-------------|
| `ScanIps.ps1` | Scan IPs with Test-Connection |
| `ScanIpsTcpClient.ps1` | Scan IPs with TcpClient (.NET) |
| **Nmap/** `ScanIp.ps1` | Scan IP with Nmap |

### Useful Windows scripts ⚙️
| Script | Description |
|--------|-------------|
| `AddAzureAgent.ps1` | Add Azure DevOps agent on Windows |
| `CreateEnvironmentVariable.ps1` | Create environment variable on the system |
| `CreateTaskScheduled.ps1` | Create scheduled task (e.g. daily run) |
| `IISInstall.ps1` | Install IIS |

## How to use 📖
1. Open PowerShell at the repo root or in the script folder.
2. Run the script, e.g. `.\ScriptName.ps1`
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
| **Network** | `Test-UrlAvailability.ps1` | Check if a URL responds (simple health check) |
| **Notifications** | `Send-ToastNotification.ps1` | Show toast notification on Windows |
| **Certificates** | `List-Certificates.ps1` | List certificates from store (LocalMachine/CurrentUser) |
| **Users** | `List-LocalUsers.ps1` | List local users or group members |
| **Git** | `Git-QuickStatus.ps1` | Summary status of multiple repos in subfolders |

You can add a new folder per category (e.g. `SystemInfo/`, `Logs/`, `Notifications/`) and put the scripts there.

## Requirements ✅
- Windows with PowerShell 5.1 or PowerShell 7+
- For **Nmap**: Nmap installed and in PATH
- For APIs: configure tokens/API keys per script (Auth0, Azure AD, Google, Azure DevOps, etc.)
---
# PowerShell Scripts 📦
Repositorio de scripts en PowerShell para tareas cotidianas en Windows: APIs externas, gestion de archivos, seguridad, tareas programadas y utilidades del sistema.

## Estructura del repositorio 📁
### Consumo de APIs externas 🔌

| Carpeta / script | Descripcion |
|------------------|-------------|
| **Auth0** | `AccessToken.ps1` — Obtencion de access token para Auth0 |
| **AzureAD** | `AccessToken.ps1` — Token para Azure AD; **GraphApi/GetUserDetail.ps1** — detalle de usuario via Microsoft Graph |
| **AzureDevops** | `AzureAgentTest.ps1` — Prueba de permisos con PAT (Personal Access Token) |
| **GoogleApi** | `google-request.ps1` — Ejemplo con Google Places Autocomplete API |
| **GeneralMethods** | Metodos genericos reutilizables: `Get.ps1`, `PostHeader.ps1`, `PostWithJson.ps1`, `PostWithFile.ps1`, `CheckRandomApi.ps1` |

### Gestion de archivos 📂
| Carpeta / script | Descripcion |
|------------------|-------------|
| **Backups-Only-Files** | `Backups.ps1` — Backup de archivos/carpetas con sello de fecha y hora |
| **CopyFolderFiles** | `CopyFoldersAndSubfolders.ps1` — Copia recursiva de carpetas y subcarpetas |
| **CreateZip** | `CreateZip.ps1` — Creacion de archivos ZIP |
| **ReadJson** | `ReadJson.ps1` — Lectura y filtrado de datos desde JSON (ej. proyectos, fechas) |
| **SearchFile.ps1** | Busqueda recursiva de archivos (ej. `*.ps1`) en una ruta |

### Reemplazo de variables 🔄
| Script | Descripcion |
|--------|-------------|
| `VariableReplace.ps1` | Reemplazo de propiedades/variables en JSON y salida a archivo |

### Requests con Curl 🌐
| Script | Descripcion |
|--------|-------------|
| `GetCurl.ps1` | GET con curl |
| `GetDownloadResponse.ps1` | GET y descarga de respuesta |

### Herramientas de seguridad / red 🔒
| Script | Descripcion |
|--------|-------------|
| `ScanIps.ps1` | Escaneo de IPs con Test-Connection |
| `ScanIpsTcpClient.ps1` | Escaneo de IPs con TcpClient (.NET) |
| **Nmap/** `ScanIp.ps1` | Escaneo de IP con Nmap |

### Utilidades en Windows ⚙️
| Script | Descripcion |
|--------|-------------|
| `AddAzureAgent.ps1` | Agregar Azure DevOps agent en Windows |
| `CreateEnvironmentVariable.ps1` | Crear variable de entorno en el sistema |
| `CreateTaskScheduled.ps1` | Crear tarea programada (ej. ejecucion diaria) |
| `IISInstall.ps1` | Instalacion de IIS |

## Como usar 📖
1. Abrir PowerShell en la raiz del repo o en la carpeta del script.
2. Ejecutar el script deseado, por ejemplo: `.\NombreDelScript.ps1`
3. Ajustar variables (rutas, URLs, tokens, etc.) dentro de cada script segun tu entorno.

En carpetas con **README.md** (p. ej. Backups-Only-Files, CopyFolderFiles, CreateZip) hay instrucciones especificas de uso.

## Scripts recomendados para sumar 💡
Ideas que encajan con lo que ya tenes y amplian el uso del repositorio:

| Categoria | Script sugerido | Para que sirve |
|-----------|-----------------|----------------|
| **Sistema** | `Get-SystemInfo.ps1` | Disco, RAM, OS, hostname en un reporte rapido |
| **Servicios** | `Manage-WindowsService.ps1` | Iniciar / detener / reiniciar servicios por nombre |
| **Tareas programadas** | `List-ScheduledTasks.ps1` | Listar (y opcionalmente habilitar/deshabilitar) tareas programadas |
| **Variables de entorno** | `List-EnvironmentVariables.ps1` | Listar o exportar variables de entorno (complementa Create) |
| **Archivos** | `Find-ReplaceInFiles.ps1` | Buscar y reemplazar texto en archivos (complementa VariablesReplace) |
| **Archivos** | `Get-DiskUsage.ps1` | Tamaño por carpeta (que carpetas ocupan mas espacio) |
| **Logs** | `Compress-OldLogs.ps1` | Comprimir o rotar logs antiguos por fecha |
| **Red** | `Test-UrlAvailability.ps1` | Comprobar si una URL responde (health check simple) |
| **Notificaciones** | `Send-ToastNotification.ps1` | Mostrar notificacion toast en Windows |
| **Certificados** | `List-Certificates.ps1` | Listar certificados del almacen (LocalMachine/CurrentUser) |
| **Usuarios** | `List-LocalUsers.ps1` | Listar usuarios locales o miembros de un grupo |
| **Git** | `Git-QuickStatus.ps1` | Status resumido de varios repos en carpetas hijas |

Podes crear una carpeta nueva por categoria (por ejemplo `SystemInfo/`, `Logs/`, `Notifications/`) y agregar ahi los scripts que vayas implementando.

## Requisitos ✅
- Windows con PowerShell 5.1 o PowerShell 7+
- Para **Nmap**: Nmap instalado y en el PATH
- Para APIs: configurar tokens/API keys segun cada script (Auth0, Azure AD, Google, Azure DevOps, etc.)
