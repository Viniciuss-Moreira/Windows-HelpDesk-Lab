# LAB-AD-SETUP.md

## Laboratório de Active Directory

Este documento detalha a configuração de um laboratório de Active Directory para fins de estudo, testes de help desk e administração de Windows Server.

---

## 1. Pré-requisitos

- Hypervisor: VMware Workstation / VirtualBox / Hyper-V.
- Sistemas Operacionais:
  - Windows Server 2019/2022 (Domain Controller)
  - Windows 10/11 (Workstations clientes)
- Ferramentas adicionais:
  - RSAT (Remote Server Administration Tools)
  - PowerShell 7.x
  - Notepad++ ou VS Code

---

## 2. Estrutura de VMs

| VM       | Sistema Operacional | Função                   | RAM | HDD  | Observações                       |
|----------|------------------|------------------------|-----|------|----------------------------------|
| DC01     | WinSrv 2022       | Domain Controller       | 4GB | 60GB | FSMO roles, DNS, DHCP            |
| WS01     | Win10 22H2        | Workstation            | 2GB | 40GB | Cliente AD                        |
| WS02     | Win10 22H2        | Workstation            | 2GB | 40GB | Cliente AD                        |

---

## 3. Configuração do Active Directory

1. Promover DC01 a Domain Controller.
2. Configurar DNS e DHCP se necessário.
3. Criar OUs conforme `OU-structure.txt`.
4. Criar grupos e usuários de teste.
5. Aplicar GPOs de segurança e mapeamento de drives.

---

## 4. Execução de Testes

1. Conectar workstations ao domínio.
2. Testar login de usuários criados.
3. Executar scripts de inventário e monitoramento (`Collect-SystemInfo.ps1`, `Monitor-EventLogs.ps1`).
4. Criar e resetar senhas de usuários.
5. Simular problemas de suporte, como impressoras e PCs lentos.

---

## 5. Objetivos do Lab

- Aprender administração de AD e Windows Server.
- Criar ambiente para testes de help desk e automação.
- Gerar documentação, relatórios e KB para portfólio no GitHub.
- Simular cenários reais de suporte técnico corporativo.