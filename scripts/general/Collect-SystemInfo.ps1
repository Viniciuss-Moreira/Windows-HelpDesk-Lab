$LogFile = "C:\Temp\SystemInfo_$(Get-Date -Format yyyyMMdd_HHmmss).txt"

try {
    $ComputerInfo = [PSCustomObject]@{
        ComputerName = $env:COMPUTERNAME
        UserName     = $env:USERNAME
        Domain       = (Get-WmiObject Win32_ComputerSystem).Domain
        OS           = (Get-CimInstance Win32_OperatingSystem).Caption
        OSVersion    = (Get-CimInstance Win32_OperatingSystem).Version
        LastBoot     = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
        CPU          = (Get-CimInstance Win32_Processor).Name
        RAM_GB       = [math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB,2)
        IPs          = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.InterfaceAlias -notlike "Loopback*"}).IPAddress -join ", "
        DiskUsage    = (Get-PSDrive -PSProvider FileSystem | ForEach-Object { "$($_.Name): $([math]::Round($_.Used/1GB,2))GB usados de $([math]::Round($_.Size/1GB,2))GB" }) -join "; "
    }

    $ComputerInfo | Tee-Object -FilePath $LogFile
    Write-Host "Informações coletadas e salvas em $LogFile"
}
catch {
    Write-Error "Erro ao coletar informações: $_"
}