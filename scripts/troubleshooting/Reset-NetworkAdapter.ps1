param(
    [string]$AdapterName = (Get-NetAdapter | Where-Object { $_.Status -eq "Up" } | Select-Object -First 1 -ExpandProperty Name)
)

if (-not $AdapterName) {
    Write-Error "Nenhum adaptador ativo encontrado"
    exit
}

Write-Host "Reiniciando adaptador de rede: $AdapterName..."

Disable-NetAdapter -Name $AdapterName -Confirm:$false
Start-Sleep -Seconds 3

Enable-NetAdapter -Name $AdapterName -Confirm:$false

ipconfig /flushdns | Out-Null

Write-Host "Adaptador $AdapterName reiniciado e cache DNS limpo"