# Script to generate system and hardware reports

# Get information about the operating system
$osInfo = Get-CimInstance -ClassName Win32_OperatingSystem

# Get information about the CPU
$cpuInfo = Get-CimInstance -ClassName Win32_Processor

# Get information about physical memory (RAM)
$ramInfo = Get-CimInstance -ClassName Win32_PhysicalMemory

# Get information about disk drives
$diskInfo = Get-CimInstance -ClassName Win32_DiskDrive

# Get information about the video controller (graphics card)
$videoInfo = Get-CimInstance -ClassName Win32_VideoController

# Create a report with the collected information
$report = @"
System and Hardware - Report
Date: $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")

Operating System:
------------------
Name: $($osInfo.Caption)
Version: $($osInfo.Version)
Architecture: $($osInfo.OSArchitecture)
Serial Number: $($osInfo.SerialNumber)

CPU:
----
Model: $($cpuInfo.Name)
Cores: $($cpuInfo.NumberOfCores)
Speed: $($cpuInfo.MaxClockSpeed) MHz

RAM:
----
Total: $([math]::Round(($ramInfo | Measure-Object -Property Capacity -Sum).Sum / 1GB, 2)) GB

Disks:
------
Models: 
$($diskInfo | ForEach-Object { "- $($_.Model)" })

Graphics Card:
--------------
$($videoInfo | ForEach-Object { "- $($_.Name)" })

"@

# Save the report to a file
$reportPath = "System_Hardware_Report_$(Get-Date -Format 'yyyyMMddHHmmss').txt"
$report | Out-File -FilePath $reportPath -Encoding UTF8

# Output the location of the generated report
Write-Output "Report generated at: $reportPath"