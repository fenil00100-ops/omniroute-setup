# OmniRoute Automation & Setup

Automated startup and configuration repository for **OmniRoute** local AI gateway server with Claude Code integration.

---

## 🔥 One-Click Install (Dost ke PC par)

### Step 1: Clone this repo
Open CMD or PowerShell and run:
```bash
git clone https://github.com/fenil00100-ops/omniroute-setup.git
cd omniroute-setup
```

### Step 2: Run the installer
```bash
install.bat
```
**Bas! Sab kuch automatically install ho jayega** — Node.js, Git, OmniRoute, Claude settings sab!

> **Note:** Agar PC mein Git nahi hai, toh seedha ZIP download karein:
> [Download ZIP](https://github.com/fenil00100-ops/omniroute-setup/archive/refs/heads/main.zip) → Extract → Run `install.bat`

---

## 🚀 Features

- **One-Click Installer:** `install.bat` runs full automated setup (Node.js, Git, OmniRoute, Claude Code config)
- **One-Click Startup:** `Start_OmniRoute.bat` to check port `20128`, auto-start the server daemon, and open dashboard
- **Claude Code Integration:** Pre-configured settings to route Claude Code requests through OmniRoute
- **Failover Combo Support:** Configured for multi-model failover routing (Claude Sonnet 4.6, Gemini 3.8 Flash, Groq, etc.)

---

## 📁 Repository Structure

```text
omniroute-setup/
├── install.bat                     # 🔥 One-click full auto-installer
├── Start_OmniRoute.bat             # Desktop one-click launcher
├── scripts/
│   └── start_omniroute.ps1         # PowerShell background supervisor script
├── config/
│   └── claude_settings_sample.json # Sample Claude Code config for port 20128
├── .gitignore                      # Protects secret keys & database
└── README.md                       # Project documentation
```

---

## ⚙️ Manual Usage

### Start Server
Run `Start_OmniRoute.bat` or launch from terminal:
```bash
omniroute serve --daemon
```

### Dashboard
Access the Web UI at: [http://localhost:20128](http://localhost:20128)

### Claude Code Settings
`~/.claude/settings.json`:
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
