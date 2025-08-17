Import-Module ActiveDirectory

$OU = "OU=Departments,DC=empresa,DC=local"
Get-ADUser -Filter * -SearchBase $OU -Properties LastLogonDate | 
Select-Object Name,SamAccountName,LastLogonDate | 
Sort-Object LastLogonDate -Descending |
Format-Table -AutoSize