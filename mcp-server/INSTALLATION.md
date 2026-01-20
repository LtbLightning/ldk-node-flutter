# Installation Guide

Complete instructions for installing and setting up the ldk_node Flutter MCP Server.

## Table of Contents

1. [System Requirements](#system-requirements)
2. [Installation Methods](#installation-methods)
3. [Setup with Claude Desktop](#setup-with-claude-desktop)
4. [Setup with Other Clients](#setup-with-other-clients)
5. [Verification](#verification)
6. [Troubleshooting](#troubleshooting)

## System Requirements

- **Python**: 3.10 or higher
- **pip**: Python package manager
- **git**: For cloning the repository (optional, if installing from source)
- **OS**: macOS, Linux, or Windows

### Check Your Python Version

```bash
python --version
# Should output: Python 3.10.x or higher
```

If not installed or too old, install from [python.org](https://www.python.org/downloads/)

## Installation Methods

### Method 1: From Source (Recommended for Development)

```bash
# Clone the repository
git clone https://github.com/LtbLightning/ldk_node_flutter.git
cd ldk_node_flutter/mcp-server

# Install in editable mode
pip install -e .

# Verify
python -c "from ldk_node_mcp.server import LdkNodeMcpServer; print('✅ Installed')"
```

### Method 2: From PyPI (When Available)

```bash
pip install ldk-node-flutter-mcp

# Verify
python -c "from ldk_node_mcp.server import LdkNodeMcpServer; print('✅ Installed')"
```

### Method 3: With Development Dependencies

For development/contribution:

```bash
cd ldk_node_flutter/mcp-server
pip install -e ".[dev]"

# This installs additional tools:
# - pytest (testing)
# - pytest-asyncio (async testing)
# - black (code formatting)
# - ruff (linting)
```

## Setup with Claude Desktop

### Step 1: Locate Configuration File

**macOS:**
```bash
open ~/Library/Application\ Support/Claude/
# File: claude_desktop_config.json
```

**Windows:**
```
%APPDATA%\Claude\claude_desktop_config.json
```

**Linux:**
```bash
~/.config/Claude/claude_desktop_config.json
```

### Step 2: Edit Configuration

If the file doesn't exist, create it with proper JSON structure.

**For Installation from Source:**

Find your installation path:
```bash
python -c "import site; print(site.getsitepackages()[0])"
```

Then add to `claude_desktop_config.json`:

```json
{
  "mcpServers": {
    "ldk-node-flutter": {
      "command": "python",
      "args": ["-m", "ldk_node_mcp.server"],
      "env": {
        "PYTHONPATH": "/path/to/ldk_node_flutter/mcp-server/src"
      }
    }
  }
}
```

**For PyPI Installation:**

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

### Step 3: Restart Claude Desktop

Close and reopen Claude Desktop. You should see "ldk-node-flutter" in the MCP servers list.

### Step 4: Verify Connection

Ask Claude:
> "Can you search the ldk_node API docs for 'receive'?"

If it returns results, the MCP server is connected!

## Setup with Other Clients

### Generic MCP Client

```bash
# Start the server
python -m ldk_node_mcp.server

# Server will listen on stdio
```

### MCP Inspector (for Testing)

```bash
# Install inspector (optional)
npm install -g @modelcontextprotocol/inspector

# Run server with inspector
mcp run python -m ldk_node_mcp.server

# Opens interactive web UI at http://localhost:3000
```

### VS Code Extension

If using an MCP-compatible VS Code extension:

```json
{
  "servers": {
    "ldk-node-flutter": {
      "command": "python",
      "args": ["-m", "ldk_node_mcp.server"],
      "env": {
        "PYTHONPATH": "/path/to/mcp-server/src"
      }
    }
  }
}
```

## Verification

### Quick Verification

```bash
python -c "from ldk_node_mcp.server import LdkNodeMcpServer; s = LdkNodeMcpServer(); print('✅ Server initialized')"
```

### Detailed Verification

```bash
python << 'EOF'
import asyncio
from ldk_node_mcp.server import LdkNodeMcpServer

async def test():
    server = LdkNodeMcpServer()
    
    # Test tool availability
    tools = server.server._tools
    print(f"✅ {len(tools)} tools available:")
    for tool in tools:
        print(f"   - {tool.name}")
    
    # Test resource availability
    resources = server.server._resources
    print(f"\n✅ {len(resources)} resources available:")
    for res in resources:
        print(f"   - {res.uri}")
    
    # Test a tool
    result = await server._search_api_docs("invoice")
    print(f"\n✅ Tool execution works: {len(result)} results found")

asyncio.run(test())
EOF
```

### Test with Claude Desktop

In Claude:

1. **Test search tool:**
   ```
   Search for "BOLT11" in the API docs
   ```

2. **Test code example:**
   ```
   Show me a code example for getting the wallet balance
   ```

3. **Test validation:**
   ```
   Validate this code: "node.start()"
   ```

## Troubleshooting

### Issue: `ModuleNotFoundError: No module named 'ldk_node_mcp'`

**Solution:**
```bash
# Ensure you're in the right directory
cd /path/to/ldk_node_flutter/mcp-server

# Reinstall
pip install -e .
```

### Issue: `Python 3.10+ required`

**Solution:**
```bash
# Install newer Python
# macOS: brew install python@3.12
# or visit python.org

# Use specific Python version
python3.12 -m pip install -e .
```

### Issue: Claude Desktop doesn't see the MCP server

**Solution:**
1. Check config file path is correct
2. Verify JSON syntax (use jsonlint.com)
3. Check PYTHONPATH is correct: `echo $PYTHONPATH`
4. Restart Claude completely (not just reload)
5. Check Console.app for error logs (macOS)

**Test configuration file:**
```bash
python -m json.tool ~/Library/Application\ Support/Claude/claude_desktop_config.json
```

### Issue: `Command 'python' not found`

**Solution:**
Use full path to Python:
```bash
which python3
# Returns something like: /usr/local/bin/python3

# Use in config:
"command": "/usr/local/bin/python3"
```

### Issue: Permission denied on config file

**Solution:**
```bash
# Fix permissions
chmod 644 ~/Library/Application\ Support/Claude/claude_desktop_config.json

# Or create if missing
mkdir -p ~/Library/Application\ Support/Claude
cat > ~/Library/Application\ Support/Claude/claude_desktop_config.json << 'EOF'
{
  "mcpServers": {}
}
EOF
```

### Issue: Tests fail with `ModuleNotFoundError`

**Solution:**
```bash
# Install dev dependencies
pip install -e ".[dev]"

# Run from project root
cd /path/to/mcp-server
pytest
```

## Advanced Configuration

### Custom Python Path

```json
{
  "mcpServers": {
    "ldk-node-flutter": {
      "command": "/usr/local/bin/python3.12",
      "args": ["-m", "ldk_node_mcp.server"],
      "env": {
        "PYTHONPATH": "/Users/you/projects/ldk_node_flutter/mcp-server/src"
      }
    }
  }
}
```

### Environment Variables

```json
{
  "mcpServers": {
    "ldk-node-flutter": {
      "command": "python",
      "args": ["-m", "ldk_node_mcp.server"],
      "env": {
        "PYTHONPATH": "/path/to/mcp-server/src",
        "LOG_LEVEL": "DEBUG"
      }
    }
  }
}
```

### Virtual Environment

```bash
# Create venv
python -m venv venv

# Activate
source venv/bin/activate  # macOS/Linux
# or
venv\Scripts\activate  # Windows

# Install in venv
pip install -e .

# Use in config - use full path to venv Python
"command": "/full/path/to/venv/bin/python"
```

## Updating

### From Source

```bash
cd /path/to/ldk_node_flutter
git pull
cd mcp-server
pip install -e . --upgrade
```

### From PyPI

```bash
pip install --upgrade ldk-node-flutter-mcp
```

### Verify Update

```bash
python -c "from ldk_node_mcp.server import LdkNodeMcpServer; print(LdkNodeMcpServer.__doc__)"
```

## Uninstalling

```bash
pip uninstall ldk-node-flutter-mcp

# Or if installed from source
pip uninstall ldk-node-flutter-mcp
# And optionally remove the source directory
rm -rf /path/to/ldk_node_flutter
```

## Getting Help

If you encounter issues:

1. Check the [Troubleshooting](#troubleshooting) section
2. Review [Claude Desktop Docs](https://claude.ai/docs)
3. Open an issue on [GitHub](https://github.com/LtbLightning/ldk_node_flutter/issues)
4. Include:
   - Python version: `python --version`
   - Installation method
   - Error message (full traceback)
   - Config file (sanitized)
