param(
    [string]$OutputPath = "C:\Scripts\Relatorios\DiskUsage.csv"
)

$volumes = Get-PSDrive -PSProvider FileSystem | Select-Object Name, @{n="Used(GB)";e={[math]::Round(($_.Used/1GB),2)}}, @{n="Free(GB)";e={[math]::Round(($_.Free/1GB),2)}}, @{n="Total(GB)";e={[math]::Round(($_.Used + $_.Free)/1GB,2)}}

$volumes | ForEach-Object {
    $_ | Add-Member -NotePropertyName "Usage(%)" -NotePropertyValue ([math]::Round(($_."Used(GB)" / $_."Total(GB)") * 100,2))
}

$volumes | Export-Csv -Path $OutputPath -NoTypeInformation -Force

Write-Host "Relatório gerado em $OutputPath"

$critical = $volumes | Where-Object { $_."Usage(%)" -ge 85 }
if ($critical) {
    Write-Warning "Volumes críticos encontrados"
    $critical | Format-Table -AutoSize
}