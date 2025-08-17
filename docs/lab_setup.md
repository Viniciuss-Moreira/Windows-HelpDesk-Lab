# LAB-SETUP.md

## Visão Geral do Lab

Este documento detalha o passo a passo para configurar o laboratório de **Windows / Windows Server / Active Directory / Help Desk**, incluindo VMs, rede, snapshots e ferramentas necessárias

---

## 1. Pré-requisitos

- Hypervisor: VMware Workstation / VirtualBox / Hyper-V.
- Sistemas Operacionais:
  - Windows Server 2019/2022 (DC, FS, Print Server)
  - Windows 10/11 (estações de trabalho)
- Ferramentas adicionais:
  - RSAT (Remote Server Administration Tools)
  - PowerShell 7.x
  - Notepad++ ou VS Code para edição de scripts

---

## 2. Estrutura de VMs

| VM       | Sistema Operacional | Função                         | RAM | HDD  | Observações                        |
|----------|------------------|--------------------------------|-----|------|-----------------------------------|
| DC01     | WinSrv 2022       | Domain Controller / DNS / DHCP | 4GB | 60GB | FSMO roles, Active Directory      |
| FS01     | WinSrv 2022       | File Server                    | 2GB | 40GB | Compartilhamentos mapeados        |
| PrintSrv | WinSrv 2019       | Print Server                   | 2GB | 40GB | Impressoras configuradas          |
| WS01     | Win10 22H2        | Workstation                    | 2GB | 40GB | Cliente AD                        |
| WS02     | Win10 22H2        | Workstation                    | 2GB | 40GB | Cliente AD                        |

---

## 3. Rede

- Rede interna (NAT ou Host-only) 192.168.1.0/24.
- Gateway: Router/FW VM ou Hypervisor NAT.
- DC01 como servidor DNS primário.
- DHCP configurado no DC01 ou Router.

---

## 4. Snapshots e Backups

- Criar snapshot inicial após instalação limpa do SO.
- Criar snapshot após configuração do AD e usuários.
- Backup regular dos scripts e exportações CSV.

---

## 5. Configuração do Active Directory

1. Promover DC01 a Domain Controller.
2. Configurar DNS e DHCP se necessário.
3. Criar OUs conforme `OU-structure.txt`.
4. Criar grupos e usuários de teste.
5. Aplicar GPOs de segurança e mapeamento de drives.

---

## 6. Ferramentas e Scripts

- Colocar scripts PowerShell em pasta `scripts/`:
  - Coleta de informações (`Collect-SystemInfo.ps1`)
  - Mapeamento de drives (`Map-NetworkDrives.ps1`)
  - Instalação de software (`Install-Software.ps1`)
  - Reset de senhas (`Reset-UserPasswords.ps1`)
  - Criação de usuários (`Create-NewUser.ps1`)
  - Monitoramento (`Monitor-EventLogs.ps1`, `Report-DiskHealth.ps1`)
  - Troubleshooting (`Reset-NetworkAdapter.ps1`, `Clear-PrintQueue.ps1`, `Check-DiskUsage.ps1`)

---

## 7. Execução do Lab

1. Ligar todas as VMs e garantir conectividade.
2. Testar login das workstations no domínio.
3. Executar scripts de coleta de inventário.
4. Testar criação e reset de usuários via AD.
5. Simular tickets de suporte e documentar em `tickets/`.
6. Verificar logs e relatórios gerados pelos scripts.