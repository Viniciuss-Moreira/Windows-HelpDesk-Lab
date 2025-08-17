# PC-NAO-CONECTA.md

## Diagnóstico de PC que Não Conecta à Rede

Este documento descreve um passo a passo para diagnosticar e resolver problemas de computadores que não conseguem se conectar à rede em um ambiente Windows/AD

---

## 1. Verificar Conectividade Física

1. Conferir cabos de rede ou conexão Wi-Fi.
2. Confirmar se a placa de rede está habilitada.
3. Testar outro cabo ou porta de switch para descartar falha de hardware.

---

## 2. Verificar Configurações de IP

1. Abrir Prompt de Comando e executar:
   ```powershell
   ipconfig /all
   ```
2. Confirmar se o computador recebeu IP válido do DHCP.
3. Testar ping no gateway:
   ```powershell
   ping 192.168.1.1
   ```
4. Testar ping em outro host da rede.

---

## 3. Verificar DNS e Active Directory

1. Conferir se o PC está apontando para o DNS correto (normalmente o DC).
2. Testar resolução de nomes:
   ```powershell
   nslookup dominio.local
   ```
3. Verificar se o PC está no domínio:
   ```powershell
   systeminfo | findstr /B /C:"Domain"
   ```

---

## 4. Verificar Firewalls e Políticas

- Conferir se firewall do Windows ou antivírus não estão bloqueando a conexão.
- Verificar se existem políticas de grupo que limitam acesso à rede.

---

## 5. Logs e Monitoramento

- Checar logs do cliente:
  ```powershell
  Get-EventLog -LogName System -Newest 50
  ```
- Observar erros relacionados à rede, DHCP, DNS ou autenticação.

---

## 6. Solução de Problemas Avançada

1. Reiniciar adaptador de rede:
   ```powershell
   Restart-NetAdapter -Name "Ethernet"
   ```
2. Liberar e renovar IP:
   ```powershell
   ipconfig /release
   ipconfig /renew
   ```
3. Reingressar o PC no domínio se houver problemas de autenticação.
4. Atualizar drivers de rede se necessário.