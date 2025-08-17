# TICKET\_IMPRESSORA.md

## Ticket de Suporte: Impressora Não Funciona

Este documento registra a abertura e resolução de um ticket relacionado à falha de impressão em um ambiente Windows / Active Directory.

---

### Informações do Usuário

- **Nome do Usuário:**
- **Departamento:**
- **Telefone / Ramal:**
- **E-mail:**

---

### Detalhes do Problema

- **Data e Hora do Reporte:**
- **Tipo de Problema:** Impressora / Hardware / Rede
- **Descrição Detalhada:** Usuário relata que a impressora não está imprimindo documentos ou apresenta mensagens de erro na fila de impressão.
- **Urgência / Prioridade:** Alta

---

### Ações Realizadas

- **Data e Hora da Ação:**
- **Passos Executados:**
  1. Verificar se a impressora está ligada e conectada corretamente.
  2. Testar impressão a partir de outro computador.
  3. Limpar fila de impressão:
     ```powershell
     Get-Printer -Name "NomeDaImpressora" | Clear-PrintQueue
     ```
  4. Verificar drivers e reinstalar se necessário.
  5. Testar rede e conectividade da impressora.
  6. Reiniciar spooler de impressão:
     ```powershell
     Restart-Service -Name Spooler
     ```
- **Resultado / Status:** Resolvido / Pendente / Em Andamento
- **Observações / Follow-up:**

---

### Aprovação / Fechamento

- **Responsável pelo Atendimento:**
- **Data e Hora do Fechamento:**
- **Comentários Finais:**