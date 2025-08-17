$BasePath = "C:\Scripts\Suporte"
$EventLogScript = Join-Path $BasePath "Monitor-EventLogs.ps1"
$DiskHealthScript = Join-Path $BasePath "Report-DiskHealth.ps1"

$ReportPath = "C:\Scripts\Relatorios"

if (-not (Test-Path $ReportPath)) {
    New-Item -Path $ReportPath -ItemType Directory | Out-Null
}

Write-Host "Criando tarefas agendadas..."

$Action1 = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File `"$EventLogScript`" -OutputPath `"$ReportPath\EventLogs.csv`""
$Trigger1 = New-ScheduledTaskTrigger -Daily -At "00:00"
$Trigger1.RepetitionInterval = (New-TimeSpan -Hours 6)
Register-ScheduledTask -TaskName "Monitor_EventLogs" -Action $Action1 -Trigger $Trigger1 -RunLevel Highest -Force

$Action2 = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File `"$DiskHealthScript`" -OutputPath `"$ReportPath\DiskHealth.csv`""
$Trigger2 = New-ScheduledTaskTrigger -Daily -At "08:00"
Register-ScheduledTask -TaskName "Report_DiskHealth" -Action $Action2 -Trigger $Trigger2 -RunLevel Highest -Force

Write-Host "Tarefas criadas com sucesso"
Write-Host "Monitor_EventLogs - roda a cada 6h"
Write-Host "Report_DiskHealth - roda todo dia às 08h00"