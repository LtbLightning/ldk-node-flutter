#!/usr/bin/env sh
# Run the MCP server with MCP Inspector or any MCP client
# Usage: ./mcp-inspector.sh
cd "$(dirname "$0")/.."  # go to mcp-server root
PYTHONPATH=./src python -m ldk_node_mcp.server
