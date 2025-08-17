param(
    [int]$LastHours = 24,
    [string]$OutputPath = ".\EventLogs_Report.csv"
)

Write-Host "Coletando eventos dos últimos $LastHours horas..."

$Levels = @{
    1 = "Critical"
    2 = "Error"
    3 = "Warning"
}

$Events = Get-WinEvent -LogName Application, System -MaxEvents 2000 |
    Where-Object { $_.TimeCreated -gt (Get-Date).AddHours(-$LastHours) } |
    Select-Object TimeCreated, LogName, Id, LevelDisplayName, Message

$Events | Export-Csv -Path $OutputPath -NoTypeInformation -Encoding UTF8

Write-Host "Relatório gerado em $OutputPath"
Write-Host "Eventos críticos/encontrados: " ($Events | Where-Object { $_.LevelDisplayName -in $Levels.Values }).Count