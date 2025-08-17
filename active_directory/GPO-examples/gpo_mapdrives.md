# GPO-MapDrives.md

## Configuração de GPO para Mapeamento de Drives de Rede

Este documento descreve como criar e aplicar uma GPO para mapear unidades de rede automaticamente para usuários do Active Directory

---

## 1. Pré-requisitos

- Domain Controller com Active Directory.
- Permissão de administrador de domínio.
- Workstations no domínio.
- RSAT (Group Policy Management Console).

---

## 2. Criar a GPO

1. Abrir **Group Policy Management**.
2. Navegar até a OU que contém os usuários alvo.
3. Clicar com o botão direito e selecionar **Create a GPO in this domain, and Link it here...**
4. Nomear a GPO, por exemplo: `Map_Network_Drives`.

---

## 3. Configuração da GPO

### Mapeamento de Drives via User Configuration:

1. Editar a GPO criada.
2. Navegar até:
   ```
   User Configuration > Preferences > Windows Settings > Drive Maps
   ```
3. Clicar com o botão direito e selecionar **New > Mapped Drive**.
4. Configurar os seguintes parâmetros:
   - **Location:** \Server\Share
   - **Drive Letter:** Escolher a letra disponível (ex: Z:)
   - **Label as:** Nome do compartilhamento
   - **Reconnect:** Checked
   - **Use:** Update / Replace conforme necessidade

### Configuração de múltiplos drives:

- Repetir o processo para cada compartilhamento necessário.
- Aplicar filtros de Item-Level Targeting se necessário (ex: por grupo ou departamento).

---

## 4. Aplicação da GPO

- Atualizar política nos usuários:

```powershell
gpupdate /force
```

- Reiniciar ou fazer logoff/logon nas estações de trabalho.
- Verificar se os drives foram mapeados corretamente.

---

## 5. Observações

- Aplicar a GPO somente a OUs de usuários, não a computadores.
- Testar primeiro em um grupo piloto antes da aplicação em massa.
- Documentar todos os compartilhamentos mapeados e suas respectivas permissões.