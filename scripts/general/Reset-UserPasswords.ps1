param(
    [Parameter(Mandatory=$true)][string]$UserName,
    [Parameter(Mandatory=$true)][string]$NewPassword
)

Import-Module ActiveDirectory

try {
    $SecurePassword = ConvertTo-SecureString -AsPlainText $NewPassword -Force
    Set-ADAccountPassword -Identity $UserName -Reset -NewPassword $SecurePassword -ErrorAction Stop
    Unlock-ADAccount -Identity $UserName -ErrorAction Stop
    Write-Host "Senha do usuário $UserName resetada e conta desbloqueada com sucesso"
}
catch {
    Write-Error "Erro ao resetar senha do usuário $UserName: $_"
}