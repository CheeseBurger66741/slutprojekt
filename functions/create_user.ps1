function Create-User {

    param (
        [string]$Operator
    )

    Write-Host ""
    Write-Host "=== Create User ==="

    $Username = Read-Host "Enter username"
    $Password = Read-Host "Enter password"

    # Timestamp
    $Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    # Log file
    $LogFile = "$PSScriptRoot\..\logs\user_creation.log"

    # Simulated account creation
    Write-Host ""
    Write-Host "User '$Username' would now be created."
    Write-Host "(Simulation only - no account has been created.)"

    # Log information
    Add-Content -Path $LogFile -Value "========================================="
    Add-Content -Path $LogFile -Value "New account created (SIMULATION)"
    Add-Content -Path $LogFile -Value "Username: $Username"
    Add-Content -Path $LogFile -Value "Password: $Password"
    Add-Content -Path $LogFile -Value "Created by: $Operator"
    Add-Content -Path $LogFile -Value "Date/Time: $Timestamp"
    Add-Content -Path $LogFile -Value ""

    break
}