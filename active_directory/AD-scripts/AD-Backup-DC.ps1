$BackupPath = "D:\AD-Backup"
if (!(Test-Path $BackupPath)) { New-Item -ItemType Directory -Path $BackupPath }
wbadmin start systemstatebackup -backupTarget:$BackupPath -quiet
Write-Host "Backup concluído em $BackupPath" -ForegroundColor Green