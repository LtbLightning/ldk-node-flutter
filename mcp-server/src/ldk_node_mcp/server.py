#!/usr/bin/env python3
"""MCP server for ldk_node Flutter package assistance."""

import asyncio
import json
import logging
from pathlib import Path
from typing import Any

from mcp.server import Server
from mcp.server.stdio import stdio_server
from mcp.types import (
    Resource,
    Tool,
    TextContent,
    ImageContent,
    EmbeddedResource,
)

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Get the package root directory (go up from mcp-server/src/ldk_node_mcp/server.py)
PACKAGE_ROOT = Path(__file__).parent.parent.parent.parent


class LdkNodeMcpServer:
    """MCP server for ldk_node Flutter package."""

    def __init__(self):
        self.server = Server("ldk-node-flutter")
        self.setup_handlers()

    def setup_handlers(self):
        """Set up MCP request handlers."""

        @self.server.list_resources()
        async def list_resources() -> list[Resource]:
            """List available resources."""
            return [
                Resource(
                    uri="ldk_node://agents",
                    name="Agent Instructions",
                    mimeType="text/markdown",
                    description="Complete agent instructions and API patterns from AGENTS.md",
                ),
                Resource(
                    uri="ldk_node://api-reference",
                    name="API Reference",
                    mimeType="application/json",
                    description="Complete API reference with method signatures and examples",
                ),
                Resource(
                    uri="ldk_node://examples/basic_wallet",
                    name="Basic Wallet Prompt",
                    mimeType="text/markdown",
                    description="AI prompt for creating a basic Bitcoin wallet",
                ),
                Resource(
                    uri="ldk_node://examples/lightning_payments",
                    name="Lightning Payments Prompt",
                    mimeType="text/markdown",
                    description="AI prompt for BOLT11 Lightning payments",
                ),
                Resource(
                    uri="ldk_node://examples/bolt12_offers",
                    name="BOLT12 Offers Prompt",
                    mimeType="text/markdown",
                    description="AI prompt for BOLT12 offers",
                ),
                Resource(
                    uri="ldk_node://examples/open_channel",
                    name="Open Channel Prompt",
                    mimeType="text/markdown",
                    description="AI prompt for opening Lightning channels",
                ),
                Resource(
                    uri="ldk_node://examples/event_handling",
                    name="Event Handling Prompt",
                    mimeType="text/markdown",
                    description="AI prompt for handling Lightning events",
                ),
                Resource(
                    uri="ldk_node://examples/lsp_integration",
                    name="LSP Integration Prompt",
                    mimeType="text/markdown",
                    description="AI prompt for LSP/JIT channel integration",
                ),
            ]

        @self.server.read_resource()
        async def read_resource(uri: str) -> str:
            """Read a specific resource."""
            try:
                if uri == "ldk_node://agents":
                    agents_file = PACKAGE_ROOT / "AGENTS.md"
                    if not agents_file.exists():
                        raise FileNotFoundError(f"AGENTS.md not found at {agents_file}")
                    return agents_file.read_text(encoding="utf-8")

                elif uri == "ldk_node://api-reference":
                    return json.dumps(self._generate_api_reference(), indent=2)

                elif uri.startswith("ldk_node://examples/"):
                    example_name = uri.replace("ldk_node://examples/", "")
                    example_map = {
                        "basic_wallet": "01_basic_wallet",
                        "onchain": "02_send_receive_onchain",
                        "lightning_payments": "03_lightning_payments",
                        "open_channel": "04_open_channel",
                        "bolt12_offers": "05_bolt12_offers",
                        "unified_qr": "06_unified_qr",
                        "keysend": "07_spontaneous_payments",
                        "event_handling": "08_event_handling",
                        "wallet_restore": "09_wallet_restore",
                        "lsp_integration": "10_lsp_integration",
                    }

                    if example_name in example_map:
                        prompt_file = (
                            PACKAGE_ROOT
                            / "examples"
                            / "ai-ready"
                            / example_map[example_name]
                            / "PROMPT.md"
                        )
                        if not prompt_file.exists():
                            raise FileNotFoundError(f"Prompt file not found at {prompt_file}")
                        return prompt_file.read_text(encoding="utf-8")

                raise ValueError(f"Unknown resource: {uri}")
            except Exception as e:
                logger.error(f"Error reading resource {uri}: {e}")
                raise

        @self.server.list_tools()
        async def list_tools() -> list[Tool]:
            """List available tools."""
            return [
                Tool(
                    name="search_api_docs",
                    description="Search the ldk_node API documentation by keyword or topic. Returns relevant API methods, patterns, and usage examples.",
                    inputSchema={
                        "type": "object",
                        "properties": {
                            "query": {
                                "type": "string",
                                "description": "Search query for API methods, concepts, or features (e.g., 'create invoice', 'open channel', 'payment events')",
                            }
                        },
                        "required": ["query"],
                    },
                ),
                Tool(
                    name="get_code_example",
                    description="Get a working code example for a specific ldk_node operation with proper error handling and best practices.",
                    inputSchema={
                        "type": "object",
                        "properties": {
                            "operation": {
                                "type": "string",
                                "description": "The operation to get an example for",
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
                                    "send_onchain",
                                ],
                            },
                            "include_error_handling": {
                                "type": "boolean",
                                "description": "Whether to include comprehensive error handling",
                                "default": True,
                            },
                        },
                        "required": ["operation"],
                    },
                ),
                Tool(
                    name="get_setup_guide",
                    description="Get the complete setup guide for initializing an ldk_node with proper configuration.",
                    inputSchema={
                        "type": "object",
                        "properties": {
                            "network": {
                                "type": "string",
                                "description": "Network to configure",
                                "enum": ["testnet", "mutinynet", "mainnet"],
                                "default": "testnet",
                            }
                        },
                    },
                ),
                Tool(
                    name="get_error_solution",
                    description="Get solutions and explanations for common ldk_node errors and issues.",
                    inputSchema={
                        "type": "object",
                        "properties": {
                            "error_message": {
                                "type": "string",
                                "description": "The error message or description of the issue",
                            }
                        },
                        "required": ["error_message"],
                    },
                ),
                Tool(
                    name="get_example_prompt",
                    description="Retrieve a complete AI-ready prompt template for a specific ldk_node feature.",
                    inputSchema={
                        "type": "object",
                        "properties": {
                            "feature": {
                                "type": "string",
                                "description": "Feature to get prompt for",
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
                                    "lsp_integration",
                                ],
                            }
                        },
                        "required": ["feature"],
                    },
                ),
                Tool(
                    name="validate_code",
                    description="Validate ldk_node code against best practices and common pitfalls.",
                    inputSchema={
                        "type": "object",
                        "properties": {
                            "code": {
                                "type": "string",
                                "description": "The Dart code to validate",
                            }
                        },
                        "required": ["code"],
                    },
                ),
            ]

        @self.server.call_tool()
        async def call_tool(name: str, arguments: Any) -> list[TextContent]:
            """Handle tool calls."""
            try:
                if name == "search_api_docs":
                    return await self._search_api_docs(arguments["query"])

                elif name == "get_code_example":
                    operation = arguments["operation"]
                    include_errors = arguments.get("include_error_handling", True)
                    return await self._get_code_example(operation, include_errors)

                elif name == "get_setup_guide":
                    network = arguments.get("network", "testnet")
                    return await self._get_setup_guide(network)

                elif name == "get_error_solution":
                    return await self._get_error_solution(arguments["error_message"])

                elif name == "get_example_prompt":
                    return await self._get_example_prompt(arguments["feature"])

                elif name == "validate_code":
                    return await self._validate_code(arguments["code"])

                raise ValueError(f"Unknown tool: {name}")
            except Exception as e:
                logger.error(f"Error in tool {name}: {e}")
                return [
                    TextContent(
                        type="text",
                        text=f"Error executing tool '{name}': {str(e)}\n\nPlease check the logs for details.",
                    )
                ]

    async def _search_api_docs(self, query: str) -> list[TextContent]:
        """Search API documentation."""
        query_lower = query.lower()
        results = []

        # Load AGENTS.md for context
        try:
            agents_file = PACKAGE_ROOT / "AGENTS.md"
            if not agents_file.exists():
                logger.warning(f"AGENTS.md not found at {agents_file}")
                agents_content = ""
            else:
                agents_content = agents_file.read_text(encoding="utf-8")
        except Exception as e:
            logger.error(f"Error reading AGENTS.md: {e}")
            agents_content = ""

        # Search patterns
        patterns = {
            "invoice": ["BOLT11", "receiveUnsafe", "invoice creation"],
            "payment": ["send payment", "bolt11Payment", "sendUnsafe"],
            "channel": ["openChannel", "closeChannel", "listChannels"],
            "balance": ["listBalances", "spendableOnchainBalanceSats"],
            "address": ["newAddress", "onChainPayment"],
            "event": ["nextEventAsync", "eventHandled", "Event_"],
            "offer": ["BOLT12", "receiveUnsafe", "bolt12Payment"],
            "keysend": ["spontaneousPayment", "sendUnsafe"],
            "mnemonic": ["Mnemonic.generate", "setEntropyBip39Mnemonic"],
        }

        matched_topics = []
        for topic, keywords in patterns.items():
            if topic in query_lower or any(k.lower() in query_lower for k in keywords):
                matched_topics.append(topic)

        if not matched_topics:
            # General search
            response = f"# API Documentation Search Results\n\nQuery: '{query}'\n\n"
            response += "## Suggested Topics\n\n"
            response += "- **BOLT11 Invoices**: Create and pay Lightning invoices\n"
            response += "- **BOLT12 Offers**: Create reusable payment offers\n"
            response += "- **Channels**: Open and manage Lightning channels\n"
            response += "- **Events**: Handle Lightning network events\n"
            response += "- **On-chain**: Bitcoin on-chain operations\n\n"
            response += "Try searching for specific operations like 'create invoice' or 'open channel'."
        else:
            response = self._generate_topic_docs(matched_topics, agents_content)

        return [TextContent(type="text", text=response)]

    async def _get_code_example(
        self, operation: str, include_error_handling: bool
    ) -> list[TextContent]:
        """Get code example for an operation."""
        examples = {
            "initialize_node": """
```dart
import 'package:ldk_node/ldk_node.dart';
import 'package:path_provider/path_provider.dart';

Future<Node> initializeNode() async {
  // Step 1: Get storage directory
  final dir = await getApplicationDocumentsDirectory();
  final storagePath = '\\${dir.path}/ldk_node';
  
  // Step 2: Generate or load mnemonic
  final mnemonic = await Mnemonic.generate();
  
  // Step 3: Build node
  final builder = Builder.testnet()
    ..setStorageDirPath(storagePath)
    ..setEntropyBip39Mnemonic(mnemonic: mnemonic);
  
  final node = await builder.build();
  
  // Step 4: Start node
  await node.start();
  
  // Step 5: Sync wallets
  await node.syncWallets();
  
  return node;
}
```""",
            "create_invoice": """
```dart
Future<String> createInvoice(Node node, int amountSats, String description) async {
  final bolt11 = await node.bolt11Payment();
  final invoice = await bolt11.receiveUnsafe(
    amountMsat: BigInt.from(amountSats * 1000),
    description: description,
    expirySecs: 3600,
  );
  return invoice.signedRawInvoice;
}
```""",
            "pay_invoice": """
```dart
Future<void> payInvoice(Node node, String invoiceString) async {
  final bolt11 = await node.bolt11Payment();
  await bolt11.sendUnsafe(
    invoice: Bolt11Invoice(signedRawInvoice: invoiceString),
  );
}
```""",
            "get_balance": """
```dart
Future<Map<String, BigInt>> getBalances(Node node) async {
  final balances = await node.listBalances();
  return {
    'onchain_sats': balances.spendableOnchainBalanceSats,
    'lightning_sats': balances.totalLightningBalanceSats,
  };
}
```""",
            "open_channel": """
```dart
Future<UserChannelId> openChannel(
  Node node,
  String nodeIdHex,
  String host,
  int port,
  int amountSats,
) async {
  final nodeId = PublicKey(hex: nodeIdHex);
  final address = SocketAddress.hostname(addr: host, port: port);
  
  return await node.openChannel(
    nodeId: nodeId,
    socketAddress: address,
    channelAmountSats: BigInt.from(amountSats),
    pushToCounterpartyMsat: null,
  );
}
```""",
            "handle_events": """
```dart
Future<void> handleEvents(Node node) async {
  while (true) {
    final event = await node.nextEventAsync();
    
    switch (event) {
      case Event_PaymentReceived(:final amountMsat):
        print('Received \\${amountMsat ~/ 1000} sats');
      case Event_PaymentSuccessful(:final paymentId):
        print('Payment successful');
      case Event_PaymentFailed(:final reason):
        print('Payment failed: \\$reason');
    }
    
    await node.eventHandled();
  }
}
```""",
        }

        if operation not in examples:
            return [TextContent(type="text", text=f"No example found for: {operation}")]

        example = examples[operation]

        if include_error_handling:
            example = f"""{example}

### With Error Handling:

```dart
try {{
  // ... operation code ...
}} on NodeException catch (e) {{
  print('Node error: \\${{e.code}} - \\${{e.errorMessage}}');
}} on PaymentException catch (e) {{
  print('Payment error: \\${{e.code}} - \\${{e.errorMessage}}');
}} on LdkFfiException catch (e) {{
  print('LDK error: \\${{e.code}} - \\${{e.errorMessage}}');
}}
```"""

        return [TextContent(type="text", text=f"# {operation}\n\n{example}")]

    async def _get_setup_guide(self, network: str) -> list[TextContent]:
        """Get setup guide for network."""
        guides = {
            "testnet": """
# Testnet Setup Guide

```dart
import 'package:ldk_node/ldk_node.dart';
import 'package:path_provider/path_provider.dart';

class LightningService {
  late Node _node;
  
  Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    final storagePath = '\\${dir.path}/ldk_node';
    
    final mnemonic = await Mnemonic.generate();
    
    _node = await Builder.testnet()
        .setStorageDirPath(storagePath)
        .setEntropyBip39Mnemonic(mnemonic: mnemonic)
        .build();
    
    await _node.start();
    await _node.syncWallets();
  }
  
  Future<void> dispose() async {
    await _node.stop();
  }
}
```

**Get testnet coins**: https://bitcoinfaucet.uo1.net/
""",
            "mutinynet": """
# Mutinynet Setup (with LSP)

```dart
import 'package:ldk_node/ldk_node.dart';
import 'package:path_provider/path_provider.dart';

class LightningService {
  late Node _node;
  
  Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    final storagePath = '\\${dir.path}/ldk_node';
    
    final mnemonic = await Mnemonic.generate();
    
    _node = await Builder.mutinynet()  // Pre-configured with LSP!
        .setStorageDirPath(storagePath)
        .setEntropyBip39Mnemonic(mnemonic: mnemonic)
        .build();
    
    await _node.start();
    await _node.syncWallets();
  }
}
```

**Benefits**: JIT channels, can receive payments without opening channels manually

**Faucet**: https://faucet.mutinynet.com/
""",
            "mainnet": """
# Mainnet Setup (⚠️ REAL MONEY)

```dart
import 'package:ldk_node/ldk_node.dart';
import 'package:path_provider/path_provider.dart';

class LightningService {
  late Node _node;
  
  Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    final storagePath = '\\${dir.path}/ldk_node';
    
    final mnemonic = await Mnemonic.generate();
    // CRITICAL: Save mnemonic securely!
    
    _node = await Builder()
        .setNetwork(Network.bitcoin)
        .setStorageDirPath(storagePath)
        .setEntropyBip39Mnemonic(mnemonic: mnemonic)
        .setChainSourceEsplora(
          esploraServerUrl: 'https://blockstream.info/api'
        )
        .setGossipSourceRgs(
          'https://rapidsync.lightningdevkit.org/snapshot'
        )
        .build();
    
    await _node.start();
    await _node.syncWallets();
  }
}
```

**⚠️ Security Requirements**:
- Use flutter_secure_storage for mnemonic
- Test thoroughly on testnet first
- Implement proper backup/recovery
""",
        }

        return [TextContent(type="text", text=guides.get(network, guides["testnet"]))]

    async def _get_error_solution(self, error_message: str) -> list[TextContent]:
        """Get solution for common errors."""
        error_lower = error_message.lower()

        solutions = {
            "node is null": """
**Error**: Node is null

**Cause**: Trying to use node before it's initialized or started.

**Solution**:
```dart
// Always ensure:
1. await builder.build()
2. await node.start()
3. Then use node operations
```
""",
            "balance shows 0": """
**Error**: Balance shows 0

**Cause**: Wallets not synced with blockchain.

**Solution**:
```dart
await node.syncWallets();
final balances = await node.listBalances();
```

Call `syncWallets()` after starting node and before checking balance.
""",
            "no route found": """
**Error**: No route found / Payment failed with route not found

**Cause**: No Lightning channel available or insufficient capacity.

**Solutions**:
1. Open a channel first: `await node.openChannel(...)`
2. Ensure channel is funded and confirmed
3. Check channel capacity: `await node.listChannels()`
4. Or use LSP (mutinynet) for automatic channels
""",
            "insufficient funds": """
**Error**: Insufficient funds

**Solutions**:
1. Check balance: `await node.listBalances()`
2. For on-chain: Ensure `spendableOnchainBalanceSats` covers amount + fees
3. For Lightning: Check `totalLightningBalanceSats` or channel outbound capacity
4. Sync wallets: `await node.syncWallets()`
""",
            "unsafe": """
**Info**: Methods with "Unsafe" suffix

The `Unsafe` suffix indicates the method can fail if prerequisites aren't met:
- `receiveUnsafe`: May fail if node isn't started
- `sendUnsafe`: May fail if no route or insufficient balance

Always wrap in try-catch:
```dart
try {
  await bolt11.sendUnsafe(invoice: inv);
} on PaymentException catch (e) {
  print('Payment failed: \\${e.errorMessage}');
}
```
""",
        }

        for key, solution in solutions.items():
            if key in error_lower:
                return [TextContent(type="text", text=solution)]

        # Generic response
        return [
            TextContent(
                type="text",
                text=f"""
# Error Solution

Could not find specific solution for: "{error_message}"

## Common Troubleshooting Steps:

1. **Ensure node is started**: `await node.start()`
2. **Sync wallets**: `await node.syncWallets()`
3. **Check balance**: `await node.listBalances()`
4. **Verify channel status**: `await node.listChannels()`
5. **Check error handling**: Wrap in try-catch with specific exception types

## Get More Help:
- Check AGENTS.md for common patterns
- Review example prompts in examples/ai-ready/
- Search API docs with the `search_api_docs` tool
""",
            )
        ]

    async def _get_example_prompt(self, feature: str) -> list[TextContent]:
        """Get example prompt for a feature."""
        example_map = {
            "basic_wallet": "01_basic_wallet",
            "onchain": "02_send_receive_onchain",
            "lightning_payments": "03_lightning_payments",
            "open_channel": "04_open_channel",
            "bolt12_offers": "05_bolt12_offers",
            "unified_qr": "06_unified_qr",
            "keysend": "07_spontaneous_payments",
            "event_handling": "08_event_handling",
            "wallet_restore": "09_wallet_restore",
            "lsp_integration": "10_lsp_integration",
        }

        if feature in example_map:
            prompt_file = (
                PACKAGE_ROOT / "examples" / "ai-ready" / example_map[feature] / "PROMPT.md"
            )
            if prompt_file.exists():
                content = prompt_file.read_text()
                return [TextContent(type="text", text=content)]

        return [TextContent(type="text", text=f"No prompt found for feature: {feature}")]

    async def _validate_code(self, code: str) -> list[TextContent]:
        """Validate code against best practices."""
        issues = []
        warnings = []

        # Check for missing awaits
        async_methods = [
            "node.start()",
            "node.stop()",
            "node.syncWallets()",
            "node.build()",
            "Mnemonic.generate()",
            "bolt11Payment()",
            "bolt12Payment()",
            "onChainPayment()",
            "spontaneousPayment()",
            "unifiedQrPayment()",
        ]
        
        for method in async_methods:
            if method in code:
                # Check if await is on the same line before the method
                lines = code.split("\n")
                for i, line in enumerate(lines):
                    if method in line and "await" not in line.split(method)[0]:
                        issues.append(f"❌ Missing `await` before `{method}`")
                        break

        # Check for incorrect property access
        if ".s" in code and "Bolt11Invoice" in code:
            issues.append(
                "❌ Bolt11Invoice uses `.signedRawInvoice` property, not `.s`"
            )

        # Check for old API usage (non-Unsafe methods)
        old_api_patterns = [
            ("bolt11.receive(", "bolt11.receiveUnsafe("),
            ("bolt11.send(", "bolt11.sendUnsafe("),
            ("bolt12.receive(", "bolt12.receiveUnsafe("),
            ("bolt12.send(", "bolt12.sendUnsafe("),
            ("unifiedQr.receive(", "unifiedQr.receiveUnsafe("),
            ("spontaneous.send(", "spontaneous.sendUnsafe("),
        ]
        
        for old, new in old_api_patterns:
            if old in code and new not in code:
                issues.append(f"❌ Use `{new.split('.')[-1]}` instead of `{old.split('.')[-1]}` (API v0.7.0+)")

        # Security checks
        if "SharedPreferences" in code and "mnemonic" in code.lower():
            issues.append("❌ CRITICAL: NEVER store mnemonic in SharedPreferences - use flutter_secure_storage")
        
        if "print(mnemonic" in code or "print(seedPhrase" in code:
            warnings.append("⚠️  Avoid printing mnemonic/seed phrase in production code")

        # Check for proper initialization pattern
        if "Builder" in code:
            if "setStorageDirPath" not in code:
                issues.append("❌ Missing `setStorageDirPath()` - required for node initialization")
            if "setEntropyBip39Mnemonic" not in code:
                warnings.append("⚠️  Consider setting mnemonic with `setEntropyBip39Mnemonic()`")

        # Check event handling pattern
        if "nextEventAsync" in code and "eventHandled" not in code:
            issues.append("❌ Missing `await node.eventHandled()` after processing event")

        # Amount unit checks
        if "amountMsat" in code:
            warnings.append("⚠️  Remember: Lightning uses millisatoshis (1 sat = 1000 msat)")

        # Build result
        result = "# Code Validation\n\n"
        
        if issues:
            result += "## ❌ Issues Found\n\n" + "\n".join(issues) + "\n\n"
        
        if warnings:
            result += "## ⚠️  Warnings\n\n" + "\n".join(warnings) + "\n\n"
        
        if not issues and not warnings:
            result += "✅ **No issues found!**\n\nCode follows ldk_node v0.7.0 best practices."
        elif not issues:
            result += "✅ **No critical issues.** Address warnings for production code."
        else:
            result += "🔧 **Fix these issues for correct ldk_node usage.**"

        return [TextContent(type="text", text=result)]

    def _generate_api_reference(self) -> dict:
        """Generate API reference."""
        return {
            "version": "0.7.0",
            "package": "ldk_node",
            "dependencies": {
                "ldk_node": "^0.7.0",
                "path_provider": "^2.1.5",
            },
            "core_apis": {
                "Node": {
                    "start": {
                        "description": "Start the node (REQUIRED before any operations)",
                        "returns": "Future<void>",
                        "throws": ["NodeException"],
                    },
                    "stop": {
                        "description": "Stop the node gracefully",
                        "returns": "Future<void>",
                    },
                    "syncWallets": {
                        "description": "Sync with blockchain (REQUIRED for accurate balances)",
                        "returns": "Future<void>",
                    },
                    "listBalances": {
                        "description": "Get on-chain and Lightning balances",
                        "returns": "Future<Balances>",
                    },
                    "listChannels": {
                        "description": "Get all Lightning channels",
                        "returns": "Future<List<ChannelDetails>>",
                    },
                    "listPayments": {
                        "description": "Get payment history",
                        "returns": "Future<List<PaymentDetails>>",
                    },
                    "nextEventAsync": {
                        "description": "Wait for next Lightning event (blocking)",
                        "returns": "Future<Event>",
                    },
                    "nextEvent": {
                        "description": "Check for event without blocking",
                        "returns": "Future<Event?>",
                    },
                    "eventHandled": {
                        "description": "Confirm event was processed (REQUIRED after nextEventAsync/nextEvent)",
                        "returns": "Future<void>",
                    },
                    "openChannel": {
                        "description": "Open a private Lightning channel",
                        "returns": "Future<UserChannelId>",
                        "throws": ["ChannelException"],
                    },
                    "closeChannel": {
                        "description": "Close a channel cooperatively",
                        "returns": "Future<void>",
                    },
                },
                "Builder": {
                    "testnet": {
                        "description": "Create builder for Bitcoin testnet",
                        "returns": "Builder",
                    },
                    "mutinynet": {
                        "description": "Create builder for Mutinynet (signet with LSP pre-configured)",
                        "returns": "Builder",
                    },
                    "setStorageDirPath": {
                        "description": "Set storage directory (REQUIRED)",
                        "parameters": [{"name": "path", "type": "String"}],
                        "returns": "Builder",
                    },
                    "setEntropyBip39Mnemonic": {
                        "description": "Set BIP39 mnemonic (REQUIRED for wallet determinism)",
                        "parameters": [{"name": "mnemonic", "type": "Mnemonic"}],
                        "returns": "Builder",
                    },
                    "setNetwork": {
                        "description": "Set Bitcoin network",
                        "parameters": [{"name": "network", "type": "Network"}],
                        "returns": "Builder",
                    },
                    "build": {
                        "description": "Build the node",
                        "returns": "Future<Node>",
                    },
                },
                "Bolt11Payment": {
                    "receiveUnsafe": {
                        "description": "Create BOLT11 invoice",
                        "parameters": [
                            {"name": "amountMsat", "type": "BigInt"},
                            {"name": "description", "type": "String"},
                            {"name": "expirySecs", "type": "int"},
                        ],
                        "returns": "Future<Bolt11Invoice>",
                    },
                    "receiveVariableAmountUnsafe": {
                        "description": "Create variable amount invoice",
                        "returns": "Future<Bolt11Invoice>",
                    },
                    "sendUnsafe": {
                        "description": "Pay BOLT11 invoice",
                        "parameters": [{"name": "invoice", "type": "Bolt11Invoice"}],
                        "returns": "Future<PaymentId>",
                        "throws": ["PaymentException"],
                    },
                    "sendUsingAmountUnsafe": {
                        "description": "Pay invoice with custom amount (for variable invoices)",
                        "returns": "Future<PaymentId>",
                    },
                },
                "Bolt12Payment": {
                    "receiveUnsafe": {
                        "description": "Create BOLT12 offer (reusable)",
                        "returns": "Future<Offer>",
                    },
                    "receiveVariableAmountUnsafe": {
                        "description": "Create variable amount offer",
                        "returns": "Future<Offer>",
                    },
                    "sendUnsafe": {
                        "description": "Pay BOLT12 offer",
                        "returns": "Future<PaymentId>",
                    },
                    "sendUsingAmountUnsafe": {
                        "description": "Pay offer with custom amount",
                        "returns": "Future<PaymentId>",
                    },
                },
                "OnChainPayment": {
                    "newAddress": {
                        "description": "Generate new Bitcoin address",
                        "returns": "Future<Address>",
                    },
                    "sendToAddress": {
                        "description": "Send to Bitcoin address",
                        "parameters": [
                            {"name": "address", "type": "Address"},
                            {"name": "amountSats", "type": "BigInt"},
                        ],
                        "returns": "Future<Txid>",
                    },
                    "sendAllToAddress": {
                        "description": "Send all funds to address (sweep)",
                        "returns": "Future<Txid>",
                    },
                },
                "SpontaneousPayment": {
                    "sendUnsafe": {
                        "description": "Send keysend payment (no invoice needed)",
                        "returns": "Future<PaymentId>",
                    },
                    "sendWithCustomTlvsUnsafe": {
                        "description": "Send keysend with custom TLV data",
                        "parameters": [{"name": "customTlvs", "type": "List<CustomTlvRecord>"}],
                        "returns": "Future<PaymentId>",
                    },
                },
                "UnifiedQrPayment": {
                    "receiveUnsafe": {
                        "description": "Generate BIP21 unified QR (on-chain + Lightning)",
                        "returns": "Future<String>",
                    },
                    "sendUnsafe": {
                        "description": "Pay unified BIP21 URI",
                        "returns": "Future<QrPaymentResult>",
                    },
                },
            },
            "common_patterns": {
                "initialization": "Builder.testnet() -> setStorageDirPath() -> setEntropyBip39Mnemonic() -> build() -> start() -> syncWallets()",
                "payment_handler": "await node.bolt11Payment()",
                "event_loop": "while (true) { event = await node.nextEventAsync(); handle(event); await node.eventHandled(); }",
            },
            "critical_notes": [
                "Always call node.start() before any operations",
                "Always call node.syncWallets() for accurate balances",
                "Always call node.eventHandled() after processing events",
                "All payment methods use Unsafe suffix in v0.7.0+",
                "Bolt11Invoice uses .signedRawInvoice property",
                "Lightning amounts are in millisatoshis (msat)",
                "Never store mnemonic in SharedPreferences",
            ],
        }

    def _generate_topic_docs(self, topics: list[str], agents_content: str) -> str:
        """Generate documentation for matched topics."""
        result = "# API Documentation\n\n"

        topic_sections = {
            "invoice": """
## BOLT11 Invoices

```dart
// Create invoice
final bolt11 = await node.bolt11Payment();
final invoice = await bolt11.receiveUnsafe(
  amountMsat: BigInt.from(10000), // 10 sats
  description: 'Coffee payment',
  expirySecs: 3600,
);
print(invoice.signedRawInvoice);

// Pay invoice
await bolt11.sendUnsafe(
  invoice: Bolt11Invoice(signedRawInvoice: invoiceString),
);
```
""",
            "payment": """
## Payments

**Check payment status:**
```dart
final payment = await node.payment(paymentId: paymentId);
switch (payment?.status) {
  case PaymentStatus.pending:
    print('In progress');
  case PaymentStatus.succeeded:
    print('Success!');
  case PaymentStatus.failed:
    print('Failed');
}
```
""",
            "channel": """
## Lightning Channels

```dart
// Open channel
final userChannelId = await node.openChannel(
  nodeId: PublicKey(hex: '02abc...'),
  socketAddress: SocketAddress.hostname(addr: 'host', port: 9735),
  channelAmountSats: BigInt.from(100000),
);

// List channels
final channels = await node.listChannels();
for (final channel in channels) {
  print('Capacity: \\${channel.channelValueSats} sats');
  print('Can send: \\${channel.outboundCapacityMsat ~/ 1000} sats');
}
```
""",
            "balance": """
## Balances

```dart
final balances = await node.listBalances();
print('On-chain: \\${balances.spendableOnchainBalanceSats} sats');
print('Lightning: \\${balances.totalLightningBalanceSats} sats');
```
""",
            "event": """
## Event Handling

```dart
while (true) {
  final event = await node.nextEventAsync();
  
  switch (event) {
    case Event_PaymentReceived(:final amountMsat):
      print('Received \\${amountMsat ~/ 1000} sats');
    case Event_PaymentSuccessful(:final paymentId):
      print('Payment sent');
    case Event_ChannelReady(:final channelId):
      print('Channel ready');
  }
  
  await node.eventHandled(); // REQUIRED
}
```
""",
        }

        for topic in topics:
            if topic in topic_sections:
                result += topic_sections[topic] + "\n"

        return result

    async def run(self):
        """Run the MCP server."""
        async with stdio_server() as (read_stream, write_stream):
            await self.server.run(read_stream, write_stream, self.server.create_initialization_options())


def main():
    """Main entry point."""
    server = LdkNodeMcpServer()
    asyncio.run(server.run())


if __name__ == "__main__":
    main()
