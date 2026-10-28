function Log-Base-Info {

    param (
        [string]$Operator
    )

    # Date and Time
    $Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    # System Information
    $ComputerName = $env:COMPUTERNAME
    $CurrentUser = $env:USERNAME
    $OS = (Get-CimInstance Win32_OperatingSystem).Caption
    $Architecture = (Get-CimInstance Win32_OperatingSystem).OSArchitecture

    # Hardware Information
    $CPU = (Get-CimInstance Win32_Processor).Name

    $TotalRAM = [math]::Round(
        (Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 2
    )

    $FreeRAM = [math]::Round(
        (Get-CimInstance Win32_OperatingSystem).FreePhysicalMemory / 1MB, 2
    )

    # Storage Information (C: Drive)
    $Drive = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"

    $TotalStorage = [math]::Round($Drive.Size / 1GB, 2)
    $FreeStorage = [math]::Round($Drive.FreeSpace / 1GB, 2)

    # Network Information
    $IPAddress = (
        Get-NetIPAddress -AddressFamily IPv4 |
        Where-Object {
            $_.IPAddress -notlike "127.*" -and
            $_.IPAddress -notlike "169.254.*"
        } |
        Select-Object -First 1 -ExpandProperty IPAddress
    )

    $MACAddress = (
        Get-NetAdapter |
        Where-Object {$_.Status -eq "Up"} |
        Select-Object -First 1 -ExpandProperty MacAddress
    )

    # Log File
    $LogFile = "$PSScriptRoot\..\logs\system_info.log"

    # Write log
    Add-Content -Path $LogFile -Value "=================================================="
    Add-Content -Path $LogFile -Value "SYSTEM INFORMATION REPORT"
    Add-Content -Path $LogFile -Value "=================================================="
    Add-Content -Path $LogFile -Value "Timestamp: $Timestamp"
    Add-Content -Path $LogFile -Value "Script Operator: $Operator"
    Add-Content -Path $LogFile -Value ""

    Add-Content -Path $LogFile -Value "[SYSTEM]"
    Add-Content -Path $LogFile -Value "Computer Name: $ComputerName"
    Add-Content -Path $LogFile -Value "Logged In User: $CurrentUser"
    Add-Content -Path $LogFile -Value "Operating System: $OS"
    Add-Content -Path $LogFile -Value "Architecture: $Architecture"
    Add-Content -Path $LogFile -Value ""

    Add-Content -Path $LogFile -Value "[HARDWARE]"
    Add-Content -Path $LogFile -Value "CPU: $CPU"
    Add-Content -Path $LogFile -Value "Total RAM: $TotalRAM GB"
    Add-Content -Path $LogFile -Value "Available RAM: $FreeRAM GB"
    Add-Content -Path $LogFile -Value "Total Storage: $TotalStorage GB"
    Add-Content -Path $LogFile -Value "Free Storage: $FreeStorage GB"
    Add-Content -Path $LogFile -Value ""

    Add-Content -Path $LogFile -Value "[NETWORK]"
    Add-Content -Path $LogFile -Value "IP Address: $IPAddress"
    Add-Content -Path $LogFile -Value "MAC Address: $MACAddress"
    Add-Content -Path $LogFile -Value ""

    Write-Host ""
    Write-Host "System information has been logged."
}