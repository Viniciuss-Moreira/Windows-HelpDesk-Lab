Import-Module ActiveDirectory

$OUName = "TesteOU"
$ParentOU = "OU=Departments,DC=empresa,DC=local"

if (-not (Get-ADOrganizationalUnit -Filter "Name -eq '$OUName'" -SearchBase $ParentOU)) {
    New-ADOrganizationalUnit -Name $OUName -Path $ParentOU
    Write-Host "OU $OUName criada em $ParentOU" -ForegroundColor Green
} else {
    Write-Host "OU $OUName já existe em $ParentOU" -ForegroundColor Yellow
}