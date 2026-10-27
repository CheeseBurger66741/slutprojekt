function Install-Software {

    param (
        [string]$Operator
    )

    $SoftwareFile = "$PSScriptRoot\..\data\software_list.json"
    $LogFile = "$PSScriptRoot\..\logs\software_installation.log"

    Write-Host ""
    Write-Host "===== SOFTWARE INSTALLATION ====="
    Write-Host "1. Install Individual Software"
    Write-Host "2. Exit"

    $Choice = Read-Host "Select an option"

    switch ($Choice) {

        "1" {
            $Software = Get-Content $SoftwareFile | ConvertFrom-Json

            Write-Host ""
            Write-Host "Available Software"

            for ($i = 0; $i -lt $Software.Count; $i++) {
                Write-Host "$($i + 1). $($Software[$i])"
            }

            $Selection = Read-Host "Select software"

            $SelectedProgram = $Software[$Selection - 1]

            Write-Host ""
            Write-Host "Installing $SelectedProgram..."
            Write-Host "(Simulation only - no software installed)"

            $Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

            Add-Content $LogFile "============================================"
            Add-Content $LogFile "INDIVIDUAL INSTALLATION"
            Add-Content $LogFile "Date/Time: $Timestamp"
            Add-Content $LogFile "Operator: $Operator"
            Add-Content $LogFile "Software: $SelectedProgram"
            Add-Content $LogFile ""
            
        }

        "2" {

           break
        }

        default {
            Write-Host "Invalid selection."
        }
    }
}