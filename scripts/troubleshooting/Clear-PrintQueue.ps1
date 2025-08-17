param(
    [string]$PrinterName = "*"
)

Write-Host "Limpando fila de impressão..."

Stop-Service -Name Spooler -Force -ErrorAction SilentlyContinue

$spoolPath = "C:\Windows\System32\spool\PRINTERS"
if (Test-Path $spoolPath) {
    Remove-Item "$spoolPath\*" -Recurse -Force -ErrorAction SilentlyContinue
}

Start-Service -Name Spooler

if ($PrinterName -ne "*") {
    Get-Printer -Name $PrinterName -ErrorAction SilentlyContinue | ForEach-Object {
        Write-Host "Fila da impressora $($_.Name) limpa"
    }
} else {
    Write-Host "Todas as filas de impressão foram limpas"
}