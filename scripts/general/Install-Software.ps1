param(
    [string[]]$Softwares = @("googlechrome","7zip","notepadplusplus")
)

$LogFile = "C:\Temp\SoftwareInstall_$(Get-Date -Format yyyyMMdd_HHmmss).txt"

foreach ($Software in $Softwares) {
    try {
        Write-Host "Instalando $Software ..."
        choco install $Software -y | Tee-Object -FilePath $LogFile -Append
        Write-Host "$Software instalado com sucesso"
    }
    catch {
        Write-Error "Erro ao instalar $Software: $_"
    }
}