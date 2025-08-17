# TROCA-SENHA-EXPIRADA.md

## Diagnóstico e Resolução de Senha Expirada

Este documento descreve o passo a passo para usuários que não conseguem acessar suas contas devido à senha expirada em um ambiente Windows / Active Directory

---

## 1. Identificação do Problema

- Usuário recebe mensagem de erro: "Sua senha expirou e deve ser alterada antes de continuar".
- Verificar se o usuário tenta login em estação de trabalho ou RDP.
- Confirmar último dia de validade da senha.

---

## 2. Alterando Senha pelo Usuário

### Windows Workstation:

1. Pressionar **Ctrl + Alt + Del**.
2. Selecionar **Alterar uma senha...**.
3. Inserir senha antiga e nova senha seguindo a política de complexidade.

### PowerShell (usuário logado no PC):

```powershell
Set-LocalUser -Name "UsuarioTeste" -Password (Read-Host -AsSecureString "Digite a nova senha")
```

---

## 3. Alterando Senha pelo Administrador

### Usando ADUC:

1. Abrir **Active Directory Users and Computers**.
2. Localizar o usuário e clicar com botão direito.
3. Selecionar **Redefinir Senha...**.
4. Marcar opção **Usuário deve alterar senha no próximo logon** se aplicável.

### Usando PowerShell:

```powershell
Set-ADAccountPassword -Identity UsuarioTeste -Reset -NewPassword (ConvertTo-SecureString "NovaSenha123!" -AsPlainText -Force)
Set-ADUser -Identity UsuarioTeste -ChangePasswordAtLogon $true
```

---

## 4. Verificar Políticas de Senha

- Conferir política de expiração e complexidade de senha via **GPO**.
- Ajustar período de validade ou regras, se necessário.
- Informar usuários sobre novas regras de senha.

---

## 5. Logs e Monitoramento

- Verificar eventos de senha expirada:

```powershell
Get-EventLog -LogName Security -Newest 50 | Where-Object {$_.EventID -eq 4723 -or $_.EventID -eq 4724}
```

- Documentar casos de falha ou bloqueios devido a tentativas de alteração.