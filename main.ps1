. "$PSScriptRoot\functions\create_user.ps1"
. "$PSScriptRoot\functions\install_software.ps1"
. "$PSScriptRoot\functions\log_base_info.ps1"
# dvs lägg till flera rader hit liknande den ovan

Write-Host "================================="
Write-Host "      ADMIN TOOLS"
Write-Host "================================="
Write-Host ""

$CurrentOperator = Read-Host "Enter your name"

do {

    Write-Host ""
    Write-Host "========== MENU =========="
    Write-Host "1. Create User"
    Write-Host "2. Install software"
    Write-Host "3. Log Base Info"
    Write-Host "4. Exit"
    Write-Host "=========================="

    $Choice = Read-Host "Select an option"

    switch ($Choice) {

        "1" {
            Create-User -Operator $CurrentOperator 
        }

        "2" {
            Install-Software -Operator $CurrentOperator 
        }

        "3" {
            Log-Base-Info -Operator $CurrentOperator 
        }
        "4" {
            Write-Host "Exiting program..."
        }

        default {
            Write-Host "Invalid selection."
        }
    }

} while ($Choice -ne "3") #Behöver ändra denna om du lägger till mera alternativ