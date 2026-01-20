# Quick Start Guide

Get the ldk_node Flutter MCP Server up and running in 5 minutes.

## 30-Second Setup

### 1. Install
```bash
cd ldk_node_flutter/mcp-server
pip install -e .
```

### 2. Configure Claude Desktop
Add to `~/Library/Application Support/Claude/claude_desktop_config.json`:
```json
{
  "mcpServers": {
    "ldk-node-flutter": {
      "command": "python",
      "args": ["-m", "ldk_node_mcp.server"]
    }
  }
}
```

### 3. Restart Claude and Ask!
```
Show me how to create a Bitcoin wallet in Flutter with ldk_node
```

Done! ✅

---

## Step-by-Step (5 minutes)

### Step 1: Install Python Package (1 min)

```bash
# Navigate to mcp-server directory
cd ~/development/programming/nucode/development/ldk_node_flutter/mcp-server

# Install
pip install -e .

# Verify
python -c "from ldk_node_mcp.server import LdkNodeMcpServer; print('✅')"
```

### Step 2: Locate Claude Config (1 min)

**macOS:**
```bash
open ~/Library/Application\ Support/Claude/
```

**Windows:**
```
Open: %APPDATA%\Claude\
```

**Linux:**
```bash
open ~/.config/Claude/
```

You should see `claude_desktop_config.json`

### Step 3: Add MCP Server (1 min)

Open `claude_desktop_config.json` with a text editor and ensure it has:

```json
{
  "mcpServers": {
    "ldk-node-flutter": {
      "command": "python",
      "args": ["-m", "ldk_node_mcp.server"]
    }
  }
}
```

**Note:** If this is your first MCP server, create the structure above. If you already have servers, just add the `ldk-node-flutter` entry.

### Step 4: Restart Claude Desktop (1 min)

- Close Claude Desktop completely
- Reopen it
- Wait for startup to complete

### Step 5: Test It! (1 min)

In Claude, ask:

```
Can you search the ldk_node API docs for "invoice"?
```

If you see API documentation results → **Success! ✅**

---

## Common First Questions

### Q: "How do I create a wallet?"

**Ask Claude:**
```
I want to create a basic Bitcoin wallet app with Flutter. 
Can you give me the complete setup and code example?
```

Claude will:
1. Search the API docs
2. Get the setup guide for testnet
3. Provide working code examples
4. Validate the code

### Q: "What's the difference between testnet and mutinynet?"

**Ask Claude:**
```
Show me the setup guide for both testnet and mutinynet. 
What are the differences?
```

### Q: "How do I receive Lightning payments?"

**Ask Claude:**
```
Show me a complete code example for creating and receiving a BOLT11 invoice
```

### Q: "My code isn't working - help!"

**Ask Claude:**
```
I'm getting this error: [paste error message]
Can you help me fix it?
```

Or:
```
Review this code for me:
[paste your code]
```

---

## Available Commands (Copy & Paste)

### Search the API
```
Search the ldk_node API for "[topic]"
```

### Get Code Examples
```
Show me a code example for [operation]

Options:
- initialize_node
- create_invoice
- pay_invoice
- get_balance
- open_channel
- send_onchain
- create_offer
- handle_events
```

### Get Setup Guide
```
Show me the setup guide for [network]

Options:
- testnet
- mutinynet
- mainnet
```

### Solve an Error
```
I'm getting this error: [error message]
Can you help me fix it?
```

### Get Complete Feature Template
```
I want to build [feature]. Give me the complete prompt.

Options:
- basic wallet
- on-chain payments
- lightning payments
- open channel
- BOLT12 offers
- keysend payments
- event handling
- wallet restore
- LSP integration
```

### Validate Your Code
```
Validate this code:
[paste your Dart code]
```

---

## Troubleshooting

### Claude doesn't recognize the MCP server

**Solution:**
1. Check config file exists: `~/Library/Application Support/Claude/claude_desktop_config.json`
2. Verify JSON syntax (no trailing commas)
3. Restart Claude completely
4. Check server status: Look for "ldk-node-flutter" in Claude's MCP settings

### Get detailed status:
```bash
python -c "from ldk_node_mcp.server import LdkNodeMcpServer; s = LdkNodeMcpServer(); print('Server ready')"
```

### Python not found

Use full path:
```bash
which python3
# Copy the output path
# Use it in config as "command": "[path]/python3"
```

### Need help?

See [INSTALLATION.md](INSTALLATION.md) for detailed troubleshooting.

---

## Next Steps

### After Setup Works

1. **Read the README** for full documentation
2. **Check API.md** for complete tool reference
3. **Review AGENTS.md** for advanced patterns
4. **Start with examples** - ask for basic wallet first

### Popular Starting Features

**New to ldk_node?**
→ Start with: "Build a basic Bitcoin wallet"

**Know Bitcoin?**
→ Try: "Add Lightning payments to my app"

**Advanced developer?**
→ Explore: "BOLT12 offers and LSP integration"

---

## Tips & Tricks

### Save Prompts for Later
Ask Claude to "Save this prompt" for features you'll build later.

### Get Multiple Options
```
Show me different ways to [operation]
```

### Ask for Best Practices
```
What are the best practices for [topic]?
```

### Combine Features
```
How do I combine [feature1] with [feature2]?
```

### Debug Step-by-Step
Instead of one big question:
```
1. Show me how to initialize the node
2. Show me how to create a wallet address
3. Show me how to check the balance
```

---

## Supported Networks

### Testnet (Bitcoin Testnet)
- Use for development/testing
- Free test Bitcoin from faucets
- Standard Bitcoin network rules
- **Recommended for learning**

### Mutinynet (Bitcoin Signet + LSP)
- Use for Lightning development
- LSP integration pre-configured
- Easier automatic channel setup
- **Recommended for Lightning**

### Mainnet (Real Bitcoin)
- ⚠️ Uses REAL Bitcoin
- Only for production
- Requires security hardening
- **Ask Claude about production setup**

---

## File Locations

```
ldk_node_flutter/
├── mcp-server/                    ← You are here
│   ├── src/ldk_node_mcp/
│   │   └── server.py             ← Main server
│   ├── pyproject.toml
│   ├── README.md                 ← Full documentation
│   ├── INSTALLATION.md           ← Detailed setup
│   ├── CONTRIBUTING.md           ← Development guide
│   ├── CHANGELOG.md              ← Version history
│   └── docs/
│       └── API.md                ← API reference
├── AGENTS.md                      ← Agent patterns
├── examples/
│   └── ai-ready/                 ← Example prompts
└── ...rest of ldk_node package
```

---

## Sample Session

Here's what a typical first session looks like:

**You:** "I want to build a Lightning wallet in Flutter. Where do I start?"

**Claude:** "Great! Let me show you the complete setup and a basic example..."

**You:** "Can you validate this code I wrote?"

**Claude:** "I found a few issues... here's the fixed version..."

**You:** "Show me how to handle payment events"

**Claude:** "Here's the event handling pattern..."

**You:** "I'm getting 'no route found' error. Help!"

**Claude:** "This happens when... Here's how to fix it..."

---

## Need More Help?

- **Full Setup:** See [INSTALLATION.md](INSTALLATION.md)
- **Tool Reference:** See [docs/API.md](docs/API.md)
- **API Patterns:** See [../AGENTS.md](../AGENTS.md)
- **Troubleshooting:** See [INSTALLATION.md#troubleshooting](INSTALLATION.md#troubleshooting)

---

## Success Checklist

- [ ] Python 3.10+ installed
- [ ] MCP server installed: `pip install -e .`
- [ ] Config file updated
- [ ] Claude Desktop restarted
- [ ] First command works

**If all checked → You're ready to build!** 🚀
