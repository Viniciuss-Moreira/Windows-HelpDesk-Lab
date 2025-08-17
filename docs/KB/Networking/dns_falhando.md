# DNS-FALHANDO.md

## Diagnóstico de Problemas de DNS

Este documento descreve um passo a passo para diagnosticar e resolver problemas de DNS em um ambiente Windows/Active Directory

---

## 1. Verificar Conectividade de Rede

1. Testar ping no servidor DNS:
   ```powershell
   ping 192.168.1.X
   ```
2. Garantir que o computador tem IP válido e gateway correto.
3. Conferir se outros serviços de rede estão funcionando (internet, compartilhamentos).

---

## 2. Testar Resolução de Nomes

1. Testar resolução de nomes internos:
   ```powershell
   nslookup servidor.dominio.local
   ```
2. Testar resolução de nomes externos:
   ```powershell
   nslookup google.com
   ```
3. Se a resolução falhar, verificar configurações de DNS no adaptador de rede.

---

## 3. Conferir Configurações de DNS

- Confirmar que o PC ou servidor aponta para o(s) DNS correto(s).
- Em ambientes AD, o DNS geralmente deve ser o Domain Controller.
- Verificar se há entradas corretas no Forward Lookup e Reverse Lookup.

---

## 4. Reiniciar Serviços DNS

1. No servidor DNS, reiniciar serviço DNS:
   ```powershell
   Restart-Service -Name DNS
   ```
2. Limpar cache DNS no cliente:
   ```powershell
   ipconfig /flushdns
   ```
3. Testar novamente resolução de nomes.

---

## 5. Logs e Monitoramento

- Conferir logs do servidor DNS:
   ```powershell
   Get-EventLog -LogName "DNS Server" -Newest 50
   ```
- Identificar erros de replicação, zonas, ou falhas de resolução.

---

## 6. Solução de Problemas Avançada

1. Testar replicação de zonas entre DCs.
2. Conferir configurações de Forwarders.
3. Validar registros SRV para Active Directory:
   ```powershell
   nslookup -type=SRV _ldap._tcp.dominio.local
   ```
4. Recriar zonas ou registros problemáticos, se necessário.