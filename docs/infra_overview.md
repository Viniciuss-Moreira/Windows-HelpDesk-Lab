# INFRA-OVERVIEW\.md

## Visão Geral da Infraestrutura do Lab

Este documento descreve a infraestrutura simulada do laboratório de **Windows / Windows Server / Active Directory / Help Desk**, incluindo servidores, estações de trabalho, rede e papéis de cada máquina

---

## 1. Arquitetura de Rede

```
                     ┌───────────────┐
                     │ Router / FW   │
                     │ DHCP + NAT    │
                     └───────┬───────┘
                             │
                     192.168.1.0/24
                             │
          ┌──────────────────┴──────────────────┐
          │                                     │
     ┌─────────┐                           ┌─────────┐
     │  DC01   │                           │  WS01   │
     │ WinSrv  │                           │ Win10   │
     │ AD/DNS  │                           │ Usuário │
     └─────────┘                           └─────────┘
          │
    ┌─────┴─────┐
    │           │
 ┌─────────┐ ┌─────────┐
 │  FS01   │ │ Print   │
 │ WinSrv  │ │ Server  │
 │ File    │ │ WinSrv  │
 └─────────┘ └─────────┘
```

- **DC01**: Domain Controller, DNS, DHCP (FSMO roles emulado).
- **FS01**: File Server com compartilhamentos mapeados para usuários.
- **Print Server**: Gerencia impressoras da rede.
- **WS01/WS02**: Estações de trabalho Windows 10/11, clientes de Active Directory.

---

## 2. Serviços e Funções

| Servidor | Função Principal                 | Observações                                         |
| -------- | -------------------------------- | --------------------------------------------------- |
| DC01     | Active Directory, DNS, DHCP, GPO | Usuários e OUs configurados                         |
| FS01     | File Server                      | Compartilhamentos: \FS01\DeptoX                     |
| PrintSrv | Print Server                     | Impressoras mapeadas via GPO                        |
| WS01/02  | Workstations                     | Login via AD, scripts de mapeamento e monitoramento |

---

## 3. Estrutura de Active Directory

```
OU=Empresa,DC=dominio,DC=local
│
├─ OU=Users
│   ├─ OU=IT
│   └─ OU=HR
├─ OU=Groups
├─ OU=Computers
└─ OU=Servers
```

- Usuários organizados por departamento.
- GPOs aplicadas para políticas de senha, mapeamento de drives, bloqueio de USB, configuração de impressoras.

---

## 4. Fluxo de Automação e Monitoramento

- **Scripts gerais**: Coleta de informações, instalação de softwares, mapeamento de drives.
- **Troubleshooting**: Reset de rede, limpeza de filas de impressão, verificação de disco.
- **Monitoramento**: Event Logs e saúde de discos geram relatórios automáticos.
- **Agendamento**: Scheduled Tasks para rodar scripts de monitoramento automaticamente.

---

## 5. Base de Conhecimento (KB)

- **Networking**: Solução de problemas de conectividade, DNS, IPs.
- **Printing**: Impressoras travadas, filas bloqueadas, drivers.
- **Accounts**: Reset de senha, desbloqueio de usuários, criação de novos usuários.