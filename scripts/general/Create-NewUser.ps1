param(
    [Parameter(Mandatory=$true)][string]$UserName,
    [Parameter(Mandatory=$true)][string]$GivenName,
    [Parameter(Mandatory=$true)][string]$Surname,
    [Parameter(Mandatory=$true)][string]$OU,
    [string]$Password = "P@ssw0rd123",
    [string]$Department = "IT",
    [string]$Email = ""
)

Import-Module ActiveDirectory

try {
    $UserPrincipalName = "$UserName@dominio.local"

    New-ADUser `
        -Name "$GivenName $Surname" `
        -GivenName $GivenName `
        -Surname $Surname `
        -SamAccountName $UserName `
        -UserPrincipalName $UserPrincipalName `
        -Path $OU `
        -Department $Department `
        -EmailAddress $Email `
        -AccountPassword (ConvertTo-SecureString $Password -AsPlainText -Force) `
        -ChangePasswordAtLogon $true `
        -Enabled $true

    Write-Host "Usuário $UserName criado em $OU com sucesso"
}
catch {
    Write-Error "Erro ao criar usuário $UserName: $_"
}