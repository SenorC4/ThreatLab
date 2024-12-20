# Define Variables
$DomainName = "lab.lukelecain.com"   # Replace with your domain name
$DomainUser = "DomainAdmin"   # Replace with a domain account that has join rights
$DomainPassword = "Simspace1!"  # Replace with the domain account password
$OUPath = "OU=Workstations,DC=lab.lukelecain,DC=com"  # Replace with the target OU (optional)

# Convert the password to a secure string
$SecurePassword = ConvertTo-SecureString $DomainPassword -AsPlainText -Force

# Create a credential object
$DomainCredential = New-Object System.Management.Automation.PSCredential($DomainUser, $SecurePassword)

# Join the computer to the domain
Write-Host "Joining the computer to the domain '$DomainName'..." -ForegroundColor Green

try {
    Add-Computer `
        -DomainName $DomainName `
        -Credential $DomainCredential `
        -OUPath $OUPath `
        -Force `
        -Restart

    Write-Host "Successfully joined the computer to the domain. The computer will now restart." -ForegroundColor Green
} catch {
    Write-Host "Failed to join the computer to the domain. Error: $_" -ForegroundColor Red
}
