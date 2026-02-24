# API Documentation

Complete API reference for the ldk_node MCP Server.

## Table of Contents

1. [Tools](#tools)
2. [Resources](#resources)
3. [Type Definitions](#type-definitions)
4. [Error Handling](#error-handling)
5. [Examples](#examples)

## Tools

### Tool: search_api_docs

Search the ldk_node Flutter package documentation.

**Method**: async

**Input Schema**:
```typescript
{
  "type": "object",
  "properties": {
    "query": {
      "type": "string",
      "description": "Search query for API methods, concepts, or features"
    }
  },
  "required": ["query"]
}
```

**Returns**: `List[TextContent]`

**Example**:
```json
{
  "query": "how to create BOLT11 invoice"
}
```

**Response Example**:
```markdown
# API Documentation

## BOLT11 Invoices

- receiveUnsafe() - Create BOLT11 invoice
- sendUnsafe() - Pay BOLT11 invoice
```

---

### Tool: get_code_example

Get working code examples for specific operations.

**Method**: async

**Input Schema**:
```typescript
{
  "type": "object",
  "properties": {
    "operation": {
      "type": "string",
      "enum": [
        "initialize_node",
        "create_invoice",
        "pay_invoice",
        "get_balance",
        "open_channel",
        "close_channel",
        "create_offer",
        "pay_offer",
        "send_keysend",
        "handle_events",
        "generate_address",
        "send_onchain"
      ],
      "description": "The operation to get an example for"
    },
    "include_error_handling": {
      "type": "boolean",
      "description": "Whether to include comprehensive error handling",
      "default": true
    }
  },
  "required": ["operation"]
}
```

**Returns**: `List[TextContent]`

**Example**:
```json
{
  "operation": "initialize_node",
  "include_error_handling": true
}
```

**Response Example**:
```dart
// Full working example with error handling
Future<Node> initializeNode() async {
  // ...
}
```

---

### Tool: get_setup_guide

Get network-specific setup guides.

**Method**: async

**Input Schema**:
```typescript
{
  "type": "object",
  "properties": {
    "network": {
      "type": "string",
      "enum": ["testnet", "mutinynet", "mainnet"],
      "description": "Network to configure",
      "default": "testnet"
    }
  }
}
```

**Returns**: `List[TextContent]`

**Example**:
```json
{
  "network": "mutinynet"
}
```

---

### Tool: get_error_solution

Get solutions for common errors and issues.

**Method**: async

**Input Schema**:
```typescript
{
  "type": "object",
  "properties": {
    "error_message": {
      "type": "string",
      "description": "The error message or description of the issue"
    }
  },
  "required": ["error_message"]
}
```

**Returns**: `List[TextContent]`

**Example**:
```json
{
  "error_message": "no route found"
}
```

**Response Example**:
```markdown
**Error**: No route found

**Cause**: No Lightning channel available or insufficient capacity.

**Solutions**:
1. Open a channel first
2. Ensure channel is funded and confirmed
3. Or use LSP for automatic channels
```

---

### Tool: get_example_prompt

Get complete AI-ready prompts for features.

**Method**: async

**Input Schema**:
```typescript
{
  "type": "object",
  "properties": {
    "feature": {
      "type": "string",
      "enum": [
        "basic_wallet",
        "onchain",
        "lightning_payments",
        "open_channel",
        "bolt12_offers",
        "unified_qr",
        "keysend",
        "event_handling",
        "wallet_restore",
        "lsp_integration"
      ],
      "description": "Feature to get prompt for"
    }
  },
  "required": ["feature"]
}
```

**Returns**: `List[TextContent]`

**Example**:
```json
{
  "feature": "basic_wallet"
}
```

**Response**: Complete markdown prompt with "Say This to Your AI Assistant" section and detailed steps.

---

### Tool: validate_code

Validate Dart code against best practices.

**Method**: async

**Input Schema**:
```typescript
{
  "type": "object",
  "properties": {
    "code": {
      "type": "string",
      "description": "The Dart code to validate"
    }
  },
  "required": ["code"]
}
```

**Returns**: `List[TextContent]`

**Validation Checks**:
- ✅ Missing `await` keywords on async methods
- ✅ Old API usage (non-Unsafe methods)
- ✅ Incorrect property access
- ✅ Security issues (mnemonic storage)
- ✅ Initialization patterns
- ✅ Event handling completeness
- ✅ Unit correctness (sats vs msats)

**Example**:
```json
{
  "code": "final node = await builder.build();\nnode.start();  // Missing await!"
}
```

**Response Example**:
```markdown
# Code Validation

## ❌ Issues Found

- Missing `await` before `node.start()`

## ✅ Fix these issues for correct ldk_node usage.
```

---

## Resources

Resources are read-only content that provide context and information.

### Resource: `ldk_node://agents`

**Type**: `text/markdown`

**Description**: Complete agent instructions and API patterns from AGENTS.md

**Content**: Full AGENTS.md file with all patterns, setup requirements, and examples

---

### Resource: `ldk_node://api-reference`

**Type**: `application/json`

**Description**: Complete API reference with method signatures

**Content Structure**:
```json
{
  "version": "0.7.0",
  "package": "ldk_node",
  "dependencies": {
    "ldk_node": "^0.7.0",
    "path_provider": "^2.1.5"
  },
  "core_apis": {
    "Node": { /* methods */ },
    "Builder": { /* methods */ },
    "Bolt11Payment": { /* methods */ },
    "Bolt12Payment": { /* methods */ },
    "OnChainPayment": { /* methods */ },
    "SpontaneousPayment": { /* methods */ },
    "UnifiedQrPayment": { /* methods */ }
  },
  "common_patterns": { /* patterns */ },
  "critical_notes": [ /* notes */ ]
}
```

---

### Resources: Example Prompts

Access complete feature prompts:

- `ldk_node://examples/basic_wallet` - Create a minimal Bitcoin wallet
- `ldk_node://examples/onchain` - Send/receive on-chain Bitcoin
- `ldk_node://examples/lightning_payments` - BOLT11 Lightning payments
- `ldk_node://examples/open_channel` - Open Lightning channels
- `ldk_node://examples/bolt12_offers` - BOLT12 reusable offers
- `ldk_node://examples/unified_qr` - Multi-method QR codes
- `ldk_node://examples/keysend` - Spontaneous keysend payments
- `ldk_node://examples/event_handling` - Handle Lightning events
- `ldk_node://examples/wallet_restore` - Wallet backup/restore
- `ldk_node://examples/lsp_integration` - LSP/JIT channel setup

**Type**: `text/markdown`

**Content**: Complete markdown prompt template with "Say This to Your AI Assistant" section

---

## Type Definitions

### TextContent

```typescript
interface TextContent {
  type: "text";
  text: string;
}
```

### Tool

```typescript
interface Tool {
  name: string;
  description: string;
  inputSchema: JSONSchema;
}
```

### Resource

```typescript
interface Resource {
  uri: string;
  name: string;
  mimeType: string;
  description: string;
}
```

---

## Error Handling

### Server Errors

The server returns error information as `TextContent`:

```json
{
  "type": "text",
  "text": "Error executing tool 'tool_name': [error description]\n\nPlease check the logs for details."
}
```

### Common Errors

| Error | Cause | Solution |
|-------|-------|----------|
| `Unknown tool: {name}` | Invalid tool name | Check tool name in available tools list |
| `Unknown resource: {uri}` | Invalid resource URI | Check resource URI format |
| `FileNotFoundError` | Missing source file (AGENTS.md) | Ensure project root is correctly configured |
| `Module not found: mcp` | MCP library not installed | Run `pip install -e .` |

---

## Examples

### Example 1: Create an Invoice

**Step 1**: Search documentation
```json
{
  "tool": "search_api_docs",
  "args": {
    "query": "create BOLT11 invoice"
  }
}
```

**Step 2**: Get code example
```json
{
  "tool": "get_code_example",
  "args": {
    "operation": "create_invoice",
    "include_error_handling": true
  }
}
```

**Step 3**: Validate your code
```json
{
  "tool": "validate_code",
  "args": {
    "code": "final invoice = await bolt11.receiveUnsafe(...)"
  }
}
```

---

### Example 2: Debug Initialization

**Step 1**: Get setup guide
```json
{
  "tool": "get_setup_guide",
  "args": {
    "network": "testnet"
  }
}
```

**Step 2**: Get error solution (if stuck)
```json
{
  "tool": "get_error_solution",
  "args": {
    "error_message": "node is null"
  }
}
```

**Step 3**: Validate your initialization code
```json
{
  "tool": "validate_code",
  "args": {
    "code": "await builder.build(); await node.start();"
  }
}
```

---

### Example 3: Build Complete Feature

**Step 1**: Get complete prompt
```json
{
  "tool": "get_example_prompt",
  "args": {
    "feature": "lightning_payments"
  }
}
```

**Step 2**: Follow the prompt steps, getting examples as needed
```json
{
  "tool": "get_code_example",
  "args": {
    "operation": "pay_invoice"
  }
}
```

**Step 3**: Validate each code section
```json
{
  "tool": "validate_code",
  "args": {
    "code": "[your implementation]"
  }
}
```

---

## Rate Limiting

No rate limiting is currently implemented. However, be respectful of:
- File I/O operations (searching large files)
- Large code validations (complex files)

---

## Changelog

### v0.1.0 (Initial Release)

- ✅ 6 core tools
- ✅ 8+ resources
- ✅ Code validation
- ✅ API reference generation
- ✅ Complete documentation

---

## Support

For issues, questions, or suggestions:
1. Check the README.md "For AI Assistants" section
2. Review existing issues
3. Create a new issue with detailed information
