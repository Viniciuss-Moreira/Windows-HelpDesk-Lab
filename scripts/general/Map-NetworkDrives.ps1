param(
    [string]$DriveLetter = "Z:",
    [string]$NetworkPath = "\\SERVER\Compartilhamento",
    [switch]$Force
)

try {
    if (Get-PSDrive -Name $DriveLetter.TrimEnd(":") -ErrorAction SilentlyContinue) {
        if ($Force) {
            Remove-PSDrive -Name $DriveLetter.TrimEnd(":") -Force
            Write-Host "Unidade $DriveLetter existente removida"
        } else {
            throw "A unidade $DriveLetter já está mapeada"
        }
    }

    New-PSDrive -Name $DriveLetter.TrimEnd(":") -PSProvider FileSystem -Root $NetworkPath -Persist -ErrorAction Stop
    Write-Host "Unidade $DriveLetter mapeada para $NetworkPath com sucesso"
}
catch {
    Write-Error "Erro ao mapear unidade de rede: $_"
}