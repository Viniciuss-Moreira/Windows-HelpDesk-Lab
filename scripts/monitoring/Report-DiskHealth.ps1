param(
    [string]$OutputPath = ".\DiskHealth_Report.csv",
    [int]$Threshold = 15
)

Write-Host "Verificando discos do computador $env:COMPUTERNAME..."

$Disks = Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" |
    Select-Object DeviceID,
                  @{Name="SizeGB";Expression={[math]::Round($_.Size/1GB,2)}},
                  @{Name="FreeGB";Expression={[math]::Round($_.FreeSpace/1GB,2)}},
                  @{Name="FreePercent";Expression={[math]::Round(($_.FreeSpace/$_.Size)*100,2)}}

$SmartStatus = Get-CimInstance Win32_DiskDrive | Select-Object DeviceID, Status

$Report = foreach ($disk in $Disks) {
    $smart = $SmartStatus | Where-Object { $_.DeviceID -match $disk.DeviceID }
    [PSCustomObject]@{
        Computer   = $env:COMPUTERNAME
        Drive      = $disk.DeviceID
        SizeGB     = $disk.SizeGB
        FreeGB     = $disk.FreeGB
        FreePct    = $disk.FreePercent
        SMART      = if ($smart) { $smart.Status } else { "N/A" }
        Alert      = if ($disk.FreePercent -lt $Threshold) { "Pouco Espaço em Disco" } else { "OK" }
    }
}

$Report | Export-Csv -Path $OutputPath -NoTypeInformation -Encoding UTF8

Write-Host "Relatório gerado em $OutputPath"