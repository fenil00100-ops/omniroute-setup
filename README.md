# OmniRoute Automation & Setup

Automated startup and configuration repository for **OmniRoute** local AI gateway server with Claude Code integration.

---

## 🚀 Features

- **One-Click Startup:** Desktop batch script (`Start_OmniRoute.bat`) to check port `20128`, auto-start the server daemon if not running, and open the web dashboard.
- **Claude Code Integration:** Pre-configured settings to route Claude Code requests through OmniRoute.
- **Failover Combo Support:** Configured for multi-model failover routing (Claude Sonnet 4.6, Gemini 3.8 Flash, Groq, etc.).

---

## 📁 Repository Structure

```text
omniroute-setup/
├── Start_OmniRoute.bat             # Desktop one-click launcher
├── scripts/
│   └── start_omniroute.ps1         # PowerShell background supervisor script
├── config/
│   └── claude_settings_sample.json # Sample Claude Code config for port 20128
├── .gitignore                      # Protects secret keys & database
└── README.md                       # Project documentation
```

---

## ⚙️ How to Use

### 1. Start Server
Run `Start_OmniRoute.bat` or launch from terminal:
```bash
omniroute serve --daemon
```

### 2. Dashboard
Access the Web UI at:
[http://localhost:20128](http://localhost:20128)

### 3. Claude Code Settings
Ensure `~/.claude/settings.json` has:
```json
{
  "env": {
    "CLAUDE_CODE_ENABLE_GATEWAY_MODEL_DISCOVERY": "1",
    "ANTHROPIC_BASE_URL": "http://localhost:20128",
    "ANTHROPIC_MODEL": "claude-sonnet-4.5"
  }
}
```

---

## 🔒 Security Note
Private API keys, OAuth tokens, and database files (`storage.sqlite`, `.env`) are excluded via `.gitignore` to prevent secret exposure.
