Import-Module ActiveDirectory

$UserName = "jdoe"
$NewPassword = ConvertTo-SecureString "NovaSenha123!" -AsPlainText -Force

Set-ADAccountPassword -Identity $UserName -Reset -NewPassword $NewPassword
Set-ADUser -Identity $UserName -ChangePasswordAtLogon $true

Write-Host "Senha do usuário $UserName redefinida e obrigatória alteração no próximo logon" -ForegroundColor Green