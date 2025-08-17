# GPO-DisableUSB.md

## Configuração de GPO para Desabilitar Dispositivos USB

Este documento descreve como criar e aplicar uma GPO para desabilitar portas USB em estações de trabalho no Active Directory, visando segurança corporativa

---

## 1. Pré-requisitos

- Domain Controller com Active Directory.
- Permissão de administrador de domínio.
- Workstations no domínio.
- RSAT (Group Policy Management Console).

---

## 2. Criar a GPO

1. Abrir **Group Policy Management**.
2. Navegar até a OU que contém os computadores alvo.
3. Clicar com o botão direito e selecionar **Create a GPO in this domain, and Link it here...**
4. Nomear a GPO, por exemplo: `Disable_USB_Access`.

---

## 3. Configuração da GPO

### Desabilitar Armazenamento Removível:

1. Editar a GPO criada.
2. Navegar até:
   ```
   Computer Configuration > Policies > Administrative Templates > System > Removable Storage Access
   ```
3. Configurar as seguintes políticas como **Enabled**:
   - All Removable Storage classes: Deny all access
   - Removable Disks: Deny read access
   - Removable Disks: Deny write access

### Desabilitar instalação de drivers USB:

1. Navegar até:
   ```
   Computer Configuration > Policies > Administrative Templates > System > Device Installation > Device Installation Restrictions
   ```
2. Configurar **Prevent installation of removable devices** como **Enabled**.

---

## 4. Aplicação da GPO

- Atualizar política nos computadores alvo:

```powershell
gpupdate /force
```

- Reiniciar máquinas se necessário.
- Testar conectando dispositivo USB para confirmar bloqueio.

---

## 5. Observações

- Aplicar GPO somente a OUs específicas para evitar impacto em administradores ou sistemas críticos.
- Documentar a GPO no repositório de políticas.
- Revisar periodicamente para atualizações de segurança.