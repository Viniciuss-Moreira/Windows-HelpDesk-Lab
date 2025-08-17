# Active Directory Lab

🔧 **Laboratório prático de Active Directory e Windows Server para Suporte Técnico**

Este repositório contém uma coleção de scripts, documentos e templates para criar, gerenciar e automatizar tarefas em um ambiente Active Directory. Ideal para aprender administração de Windows Server, suporte técnico corporativo, automação e boas práticas de segurança.

---

## 🚀 Objetivo

- Criar um ambiente de laboratório funcional com Active Directory.
- Automatizar tarefas comuns de administração e help desk.
- Simular cenários reais de suporte técnico (PC lento, impressora não imprime, senha expirada, conta bloqueada, DNS falhando).
- Aplicar políticas de segurança e GPOs em estações de trabalho e servidores.
- Documentar procedimentos, tickets e padrões para portfólio ou estudo.
- 
---

## 🛠️ Scripts Principais

- **AD-Backup-DC.ps1**: Realiza backup do Active Directory.
- **AD-CreateOU.ps1**: Cria Unidades Organizacionais (OUs) estruturadas por departamento.
- **AD-CreateUser.ps1**: Cria usuários com padrão de senha seguro.
- **AD-DisableUser.ps1**: Desativa usuários quando necessário.
- **AD-Query-Logons.ps1**: Consulta últimos logons para auditoria.
- **AD-ResetUserPassword.ps1**: Redefine senhas e força alteração no próximo logon.

---

## 📄 Documentação e GPOs

- **GPO-DisableUSB.md**: Bloqueio de dispositivos USB para proteger dados corporativos.
- **GPO-MapDrives.md**: Mapeamento automático de drives de rede por departamento.
- **GPO-PasswordPolicy.md**: Política de senhas robusta com complexidade e expiração.
- **LAB-AD-SETUP.md**: Guia completo para configurar o laboratório de AD, OUs e usuários de teste.

---

## 📝 Templates de Tickets e Casos Reais

| Tipo de Ticket             | Descrição                                                                    |
| -------------------------- | ---------------------------------------------------------------------------- |
| **Senha Expirada / Reset** | Redefinição de senha de usuário, desbloqueio de conta.                       |
| **PC Lento**               | Diagnóstico de consumo de CPU/RAM, limpeza de arquivos e otimização.         |
| **Impressora Não Imprime** | Limpeza da fila de impressão, reinstalação de drivers e verificação de rede. |
| **DNS Falhando**           | Teste de resolução de nomes, configuração de servidores DNS.                 |
| **Conta Bloqueada**        | Desbloqueio de conta e investigação de tentativas de login inválidas.        |

> Cada ticket contém histórico, ações realizadas, logs e follow-up, permitindo rastreabilidade e padronização do suporte.

---

## 🔒 Padrões de Segurança Aplicados

- Senhas complexas e expiração periódica via GPO.
- Bloqueio de dispositivos USB para reduzir riscos de vazamento.
- Mapeamento de drives restrito por departamento.
- Logging e auditoria de logons para monitoramento.
- Estrutura de OUs organizada para aplicação de políticas granulares.

---

## 🧪 Como Usar

1. Clone este repositório:

```bash
git clone https://github.com/Viniciuss-Moreira/active-directory-lab.git
cd active-directory-lab
```

2. Configure o laboratório conforme **LAB-AD-SETUP.md**.

3. Execute scripts conforme necessidade:

```powershell
.\scripts\AD-CreateUser.ps1
.\scripts\AD-Backup-DC.ps1
```

4. Abra e preencha tickets nos templates para registrar ações.

---

## 📌 Contribuições

- Pull requests são bem-vindos.
- Sugestões de scripts adicionais, novos templates ou melhorias de GPOs podem ser adicionadas.
