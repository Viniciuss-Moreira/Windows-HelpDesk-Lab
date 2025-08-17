Import-Module ActiveDirectory

$FirstName = "John"
$LastName = "Doe"
$UserName = "jdoe"
$OU = "OU=IT,OU=Departments,DC=empresa,DC=local"
$Password = ConvertTo-SecureString "Senha123!" -AsPlainText -Force

if (-not (Get-ADUser -Identity $UserName -ErrorAction SilentlyContinue)) {
    New-ADUser -Name "$FirstName $LastName" -GivenName $FirstName -Surname $LastName `
    -SamAccountName $UserName -UserPrincipalName "$UserName@empresa.local" `
    -Path $OU -AccountPassword $Password -Enabled $true -PasswordNeverExpires $false
    Write-Host "Usuário $UserName criado em $OU" -ForegroundColor Green
} else {
    Write-Host "Usuário $UserName já existe" -ForegroundColor Yellow
}