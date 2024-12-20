# Define Variables
$DomainName = "lab.lukelecain.com"
$NetBIOSName = "lab"
$SafeModeAdminPassword = (ConvertTo-SecureString "Simspace1!" -AsPlainText -Force)
$InstallDNS = $true
$ForestMode = "WinThreshold"

# Install the Active Directory Domain Services role
Write-Host "Installing Active Directory Domain Services role..." -ForegroundColor Green
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools -Verbose

# Import the ADDSDeployment module
Import-Module ADDSDeployment

# Promote the server to a Domain Controller
Write-Host "Promoting the server to a Domain Controller..." -ForegroundColor Green
Install-ADDSForest `
    -DomainName $DomainName `
    -DomainNetBIOSName $NetBIOSName `
    -SafeModeAdministratorPassword $SafeModeAdminPassword `
    -InstallDNS:$InstallDNS `
    -ForestMode $ForestMode `
    -Force

Write-Host "Active Directory Domain Controller setup is complete!" -ForegroundColor Green
