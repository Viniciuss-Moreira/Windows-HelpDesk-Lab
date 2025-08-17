Import-Module ActiveDirectory

$UserName = "jdoe"
$user = Get-ADUser -Identity $UserName -ErrorAction SilentlyContinue

if ($user) {
    Disable-ADAccount -Identity $UserName
    Write-Host "Usuário $UserName desativado." -ForegroundColor Green
} else {
    Write-Host "Usuário $UserName não encontrado." -ForegroundColor Red
}