# Client Config Samples

Use these sample configs to connect the MCP server.

## Claude Desktop
File: `~/Library/Application Support/Claude/claude_desktop_config.json`
```json
{
  "mcpServers": {
    "ldk-node-flutter": {
      "command": "python",
      "args": ["-m", "ldk_node_mcp.server"],
      "env": {
        "PYTHONPATH": "/absolute/path/to/ldk_node_flutter/mcp-server/src"
      }
    }
  }
}
```

## Cursor / VS Code MCP
```json
{
  "servers": {
    "ldk-node-flutter": {
      "command": "python",
      "args": ["-m", "ldk_node_mcp.server"],
      "env": {
        "PYTHONPATH": "/absolute/path/to/ldk_node_flutter/mcp-server/src"
      }
    }
  }
}
```

## MCP Inspector (CLI)
```sh
cd /absolute/path/to/ldk_node_flutter/mcp-server
PYTHONPATH=./src python -m ldk_node_mcp.server
```

Replace `/absolute/path/to/ldk_node_flutter` with your local path.
