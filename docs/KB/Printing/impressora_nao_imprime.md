# IMPRESSORA-NAO-IMPRIME.md

## Diagnóstico de Impressora que Não Imprime

Este documento descreve um passo a passo para diagnosticar e resolver problemas de impressoras que não imprimem em um ambiente Windows/AD.

---

## 1. Verificar Conectividade

1. Confirmar se a impressora está ligada e conectada à rede ou computador.
2. Testar ping no IP da impressora:
   ```powershell
   ping 192.168.1.X
   ```
3. Verificar se a impressora aparece na lista de dispositivos:
   - Painel de Controle > Dispositivos e Impressoras

---

## 2. Conferir Drivers e Filas de Impressão

1. Atualizar ou reinstalar drivers da impressora.
2. Abrir fila de impressão e verificar documentos travados.
3. Limpar fila de impressão, se necessário:
   ```powershell
   Get-Printer -Name "NomeDaImpressora" | Clear-PrintQueue
   ```

---

## 3. Testar Impressão Local e Remota

- Testar impressão a partir do próprio computador ou de outra estação de trabalho.
- Se funcionar em outro PC, o problema pode ser de configuração do usuário ou rede.

---

## 4. Verificar Configurações de GPO e Permissões

1. Confirmar se existe política de grupo que bloqueia impressoras.
2. Checar permissões de usuários para a impressora no servidor de impressão.
3. Garantir que o usuário está no grupo correto para acessar a impressora.

---

## 5. Logs e Monitoramento

- Conferir logs do servidor de impressão:
  ```powershell
  Get-EventLog -LogName "System" -Source "PrintService" -Newest 50
  ```
- Checar mensagens de erro, falhas ou alertas.

---

## 6. Solução de Problemas Avançada

1. Reiniciar spooler de impressão:
   ```powershell
   Restart-Service -Name Spooler
   ```
2. Reinstalar a impressora remotamente via PowerShell:
   ```powershell
   Remove-Printer -Name "NomeDaImpressora"
   Add-Printer -Name "NomeDaImpressora" -DriverName "DriverDaImpressora" -PortName "IPPorta"
   ```
3. Atualizar firmware da impressora se aplicável.