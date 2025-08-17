# CONTA-BLOQUEADA.md

## Diagnóstico e Resolução de Conta de Usuário Bloqueada

Este documento descreve o passo a passo para diagnosticar e desbloquear contas de usuário em um ambiente Windows / Active Directory

---

## 1. Identificação do Problema

- Confirmar que o usuário não consegue fazer login.
- Verificar se há mensagens de erro:
  - "Conta desativada"
  - "Senha expirada"
  - "Conta bloqueada"
- Solicitar informações sobre tentativas recentes de login.

---

## 2. Verificar Status da Conta

No servidor com Active Directory, abrir o **Active Directory Users and Computers (ADUC)** e localizar o usuário:

- Conferir se a conta está marcada como **Conta desativada**.
- Conferir se a conta está bloqueada (ícone com seta para baixo).
- Verificar a data e hora do último logon.

Também é possível usar PowerShell:
```powershell
Get-ADUser -Identity UsuarioTeste -Properties LockedOut | Select-Object Name,LockedOut
```

---

## 3. Desbloquear a Conta

### Usando ADUC:
1. Clicar com o botão direito na conta.
2. Selecionar **Desbloquear Conta**.
3. Informar o usuário sobre a necessidade de tentar login novamente.

### Usando PowerShell:
```powershell
Unlock-ADAccount -Identity UsuarioTeste
```

---

## 4. Verificar Políticas de Bloqueio

- Conferir políticas de senha e bloqueio de conta (GPO) em **Default Domain Policy** ou política aplicada.
- Ajustar tempo de bloqueio e tentativas de login se necessário.
- Informar usuário sobre boas práticas de senha para evitar novos bloqueios.

---

## 5. Monitoramento e Logs

- Consultar logs de segurança para identificar a origem do bloqueio:
```powershell
Get-EventLog -LogName Security -Newest 50 | Where-Object {$_.EventID -eq 4740}
```
- Identificar se o bloqueio foi causado por tentativas de login incorretas ou script.