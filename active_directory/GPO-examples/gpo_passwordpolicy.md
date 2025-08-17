# GPO-PasswordPolicy.md

## Configuração de GPO para Política de Senhas

Este documento descreve como criar e aplicar uma GPO para definir políticas de senha em um ambiente Active Directory, garantindo segurança e conformidade

---

## 1. Pré-requisitos

- Domain Controller com Active Directory.
- Permissão de administrador de domínio.
- RSAT (Group Policy Management Console).

---

## 2. Criar a GPO

1. Abrir **Group Policy Management**.
2. Navegar até a OU ou domínio onde a política será aplicada.
3. Clicar com o botão direito e selecionar **Create a GPO in this domain, and Link it here...**
4. Nomear a GPO, por exemplo: `Password_Policy`.

---

## 3. Configuração da Política de Senha

### Caminho:

```
Computer Configuration > Policies > Windows Settings > Security Settings > Account Policies > Password Policy
```

### Configurações recomendadas:

- **Enforce password history:** 24 passwords remembered
- **Maximum password age:** 60 days
- **Minimum password age:** 1 day
- **Minimum password length:** 8 characters
- **Password must meet complexity requirements:** Enabled
- **Store passwords using reversible encryption:** Disabled

---

## 4. Aplicação da GPO

- Atualizar política nos computadores do domínio:

```powershell
gpupdate /force
```

- Testar alterações de senha com usuários de teste.
- Confirmar que as regras de complexidade e expiração estão sendo aplicadas.

---

## 5. Observações

- Aplicar GPO no nível de domínio para consistência.
- Documentar alterações e data de aplicação.
- Revisar políticas periodicamente para atender novas normas de segurança.