# LDK Node Flutter MCP Server

A Model Context Protocol (MCP) server that provides AI assistants with comprehensive knowledge, tools, and resources for working with the `ldk_node` Flutter package for building Lightning Network applications.

## Features

- **🤖 AI-Powered Tools**: 6 specialized tools for AI-assisted development
- **📚 Comprehensive Resources**: Access to AGENTS.md, API reference, and all example prompts
- **✅ Code Validation**: Checks for common pitfalls and best practices
- **🔍 API Search**: Intelligent documentation search with topic matching
- **📝 Code Examples**: Working examples for 12+ common operations
- **🌐 Multi-Network**: Testnet, Mutinynet (with LSP), and Mainnet support

## Installation

```bash
cd mcp-server
pip install -e .
```

### Verify Installation

```bash
# Test the server works
python -c "from ldk_node_mcp.server import LdkNodeMcpServer; s = LdkNodeMcpServer(); print('✅ Server initialized')"
```

## Quick Start

### Setup with Claude Desktop

1. **Find your config file**:
   - macOS: `~/Library/Application Support/Claude/claude_desktop_config.json`
   - Windows: `%APPDATA%\Claude\claude_desktop_config.json`
   - Linux: `~/.config/Claude/claude_desktop_config.json`

2. **Add the MCP server**:
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

3. **Restart Claude Desktop** and start using the tools!

### Using with Other MCP Clients

```bash
python -m ldk_node_mcp.server
```

## Available Tools

### 1. `search_api_docs`
Search the ldk_node API documentation by keyword or topic.

**Parameters:**
- `query` (string): Search query for API methods, concepts, or features

**Example:**
```json
{
  "query": "how to create BOLT11 invoice"
}
```

### `get_code_example`
Get a working code example for a specific operation.

**Parameters:**
- `operation` (string): The operation to get an example for (e.g., "send_payment", "open_channel", "create_invoice")
- `include_error_handling` (boolean, optional): Whether to include error handling code

**Example:**
```json
{
  "operation": "create_invoice",
  "include_error_handling": true
}
```

### `get_setup_guide`
Get the complete setup guide for initializing an ldk_node.

**Parameters:**
- `network` (string): Network type - "testnet", "mutinynet", or "mainnet"

### `get_error_solution`
Get solutions and explanations for common errors.

**Parameters:**
- `error_message` (string): The error message or description

### `get_example_prompt`
Retrieve an AI-ready prompt template for a specific feature.

**Parameters:**
- `feature` (string): Feature name (e.g., "basic_wallet", "lightning_payments", "bolt12_offers")

## Available Resources

### `ldk_node://agents`
Complete agent instructions and patterns from AGENTS.md

### `ldk_node://api-reference`
Full API reference documentation

### `ldk_node://examples/{feature}`
Access example prompts (e.g., `ldk_node://examples/basic_wallet`)

## Development

```bash
# Install dev dependencies
pip install -e ".[dev]"

# Run tests
pytest

# Format code
black src/
ruff check src/
```

## License

Same as ldk_node_flutter (MIT/Apache-2.0)
