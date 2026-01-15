# ldk_node Flutter - Complete Documentation Index

Welcome to ldk_node, the production-ready Lightning Network library for Flutter!

## 📚 Documentation Map

### For New Users 👶

Start here if you're new to Bitcoin/Lightning or Flutter:

1. **[GETTING_STARTED.md](./GETTING_STARTED.md)** (10 min read)
   - 5-minute quick start
   - Step-by-step learning path
   - Common questions answered
   - Error troubleshooting
   
2. **[DOCUMENTATION.md](./DOCUMENTATION.md)** - Core Concepts section
   - What is Bitcoin?
   - What is Lightning Network?
   - Payment channels explained
   - Key terminology

### For Developers 👨‍💻

Once you've done the quick start:

1. **[DOCUMENTATION.md](./DOCUMENTATION.md)** (Complete Reference)
   - Full API documentation
   - Common operations (8 walkthroughs)
   - Advanced topics (LSP, fees, chain sources)
   - Security best practices
   - Error handling patterns
   - Testing guidance

2. **[examples/ai-ready/](./examples/ai-ready/)** (10 Complete Examples)
   - 01_basic_wallet - Create a wallet
   - 02_send_receive_onchain - Bitcoin transfers
   - 03_lightning_payments - BOLT11 invoices
   - 04_open_channel - Open Lightning channels
   - 05_bolt12_offers - Reusable offers
   - 06_unified_qr - Multi-method QR
   - 07_spontaneous_payments - Keysend
   - 08_event_handling - Lightning events
   - 09_wallet_restore - Backup/restore
   - 10_lsp_integration - Automatic channels

3. **[AGENTS.md](./AGENTS.md)** (Architecture Reference)
   - API patterns and examples
   - Critical do's and don'ts
   - Network selection guide
   - Error handling patterns
   - Initialization checklist

### For Publishing 📦

When publishing to pub.dev:

1. **[PUB_DEV_GUIDE.md](./PUB_DEV_GUIDE.md)** (Complete Checklist)
   - Pre-publication checklist
   - Publication steps
   - Maintaining ratings
   - Documentation best practices
   - Versioning strategy

2. **[CHANGELOG.md](./CHANGELOG.md)** (Version History)
   - Current version features
   - Breaking changes
   - Upgrade guides
   - Migration steps

### For Contributors 🤝

If you want to improve the library:

1. **[CONTRIBUTING.md](./CONTRIBUTING.md)** (Development Guide)
   - Setup instructions
   - Code style guidelines
   - Testing requirements
   - Commit message format
   - Pull request process

2. **[mcp-server/README.md](./mcp-server/README.md)** (MCP Server)
   - AI assistant integration
   - Tool reference
   - Resource documentation

---

## 🎯 Quick Navigation by Task

### "I want to..."

#### Learn Bitcoin/Lightning
→ [GETTING_STARTED.md](./GETTING_STARTED.md#core-concepts-explained)

#### Create my first wallet
→ [GETTING_STARTED.md](./GETTING_STARTED.md#5-minute-quick-start)

#### Create/pay Lightning invoices
→ [DOCUMENTATION.md](./DOCUMENTATION.md#create-an-invoice) or [examples/ai-ready/03_lightning_payments](./examples/ai-ready/03_lightning_payments)

#### Open a Lightning channel
→ [DOCUMENTATION.md](./DOCUMENTATION.md#open-a-lightning-channel) or [examples/ai-ready/04_open_channel](./examples/ai-ready/04_open_channel)

#### Use BOLT12 offers
→ [DOCUMENTATION.md](./DOCUMENTATION.md#bolt12-offers) or [examples/ai-ready/05_bolt12_offers](./examples/ai-ready/05_bolt12_offers)

#### Setup LSP for automatic channels
→ [DOCUMENTATION.md](./DOCUMENTATION.md#lsp-integration) or [examples/ai-ready/10_lsp_integration](./examples/ai-ready/10_lsp_integration)

#### Handle Lightning events properly
→ [DOCUMENTATION.md](./DOCUMENTATION.md#handle-lightning-events) or [examples/ai-ready/08_event_handling](./examples/ai-ready/08_event_handling)

#### Restore a wallet from backup
→ [DOCUMENTATION.md](./DOCUMENTATION.md#restore-wallet-from-mnemonic) or [examples/ai-ready/09_wallet_restore](./examples/ai-ready/09_wallet_restore)

#### Fix an error in my code
→ [DOCUMENTATION.md](./DOCUMENTATION.md#error-handling) or [GETTING_STARTED.md](./GETTING_STARTED.md#common-errors--solutions)

#### Deploy to production
→ [DOCUMENTATION.md](./DOCUMENTATION.md#production-checklist) and [GETTING_STARTED.md](./GETTING_STARTED.md#level-5-advanced-3-hours)

#### Publish to pub.dev
→ [PUB_DEV_GUIDE.md](./PUB_DEV_GUIDE.md#pre-publication-checklist)

#### Contribute to the project
→ [CONTRIBUTING.md](./CONTRIBUTING.md)

---

## 📖 Document Overview

| Document | Purpose | Length | Audience |
|----------|---------|--------|----------|
| **[GETTING_STARTED.md](./GETTING_STARTED.md)** | Quick start & learning path | 10 min | Everyone |
| **[DOCUMENTATION.md](./DOCUMENTATION.md)** | Complete API reference | 30 min | Developers |
| **[AGENTS.md](./AGENTS.md)** | Architecture & patterns | 15 min | Advanced users |
| **[CHANGELOG.md](./CHANGELOG.md)** | Version history | 5 min | Maintainers |
| **[PUB_DEV_GUIDE.md](./PUB_DEV_GUIDE.md)** | Publishing guide | 10 min | Publishers |
| **[CONTRIBUTING.md](./CONTRIBUTING.md)** | Development guide | 15 min | Contributors |
| **[mcp-server/](./mcp-server/)** | AI integration | 5 min | AI users |

---

## 🚀 Getting Started Paths

### Path 1: Absolute Beginner (2 hours)

1. Read [GETTING_STARTED.md](./GETTING_STARTED.md#core-concepts-explained) - Understand concepts (15 min)
2. Follow [Quick Start](./GETTING_STARTED.md#5-minute-quick-start) - Run example (10 min)
3. Follow [Level 1: Basics](./GETTING_STARTED.md#level-1-basics-30-minutes) (30 min)
4. Follow [Level 2: Wallets](./GETTING_STARTED.md#level-2-wallets-1-hour) (1 hour)

**Result**: Working wallet, understand the basics

### Path 2: Experienced Developer (1 hour)

1. Skim [GETTING_STARTED.md - Quick Start](./GETTING_STARTED.md#5-minute-quick-start) (5 min)
2. Review [DOCUMENTATION.md - Core Concepts](./DOCUMENTATION.md#core-concepts) (10 min)
3. Pick 2 examples from [examples/ai-ready/](./examples/ai-ready/) (30 min)
4. Scan [Error Handling](./DOCUMENTATION.md#error-handling) (5 min)
5. Start building (10 min setup)

**Result**: Ready to build your app

### Path 3: Advanced User (30 min)

1. Review [AGENTS.md](./AGENTS.md) - Patterns (10 min)
2. Check [DOCUMENTATION.md - Advanced Topics](./DOCUMENTATION.md#advanced-topics) (10 min)
3. Scan [examples/](./examples/ai-ready/) for relevant patterns (10 min)

**Result**: Ready for production deployment

---

## 🎓 Learning Resources

### Official Documentation

- **[DOCUMENTATION.md](./DOCUMENTATION.md)** - Everything you need to know
- **[AGENTS.md](./AGENTS.md)** - Best practices and patterns
- **[API Reference](./docs/api.md)** - Detailed API reference

### External Resources

- **Bitcoin**: [Bitcoin Wiki](https://en.bitcoin.it/wiki/Main_Page)
- **Lightning**: [Lightning Network Docs](https://lightning.network)
- **LDK**: [LDK Documentation](https://docs.rs/lightning/)
- **BDK**: [BDK Documentation](https://docs.rs/bdk/)
- **Flutter**: [Flutter Docs](https://flutter.dev/docs)

### Examples

All 10 examples in `/examples/ai-ready/`:
- Fully functional, production-ready code
- Extensive comments explaining each part
- Error handling included
- Best practices demonstrated

---

## 🛠️ Tools & Resources

### Development

- **IDE**: VS Code, Android Studio, or IntelliJ
- **Flutter**: [Download Flutter](https://flutter.dev/docs/get-started/install)
- **Dart**: Included with Flutter
- **Git**: [Download Git](https://git-scm.com/)

### Testing

- **Testnet Faucet**: [Bitcoin Testnet Faucet](https://testnet-faucet.mempool.space)
- **Mutinynet Faucet**: [Mutinynet Faucet](https://faucet.mutinynet.com)
- **Testnet Explorer**: [Mempool Testnet](https://testnet.mempool.space)

### Production

- **Mutiny**: [Mutiny Wallet](https://app.mutinywallet.com) - Test real usage
- **Amboss**: [Node Explorer](https://amboss.space)
- **1ML**: [Lightning Stats](https://1ml.com)

---

## ❓ FAQ

### How do I choose testnet vs mutinynet?

- **Testnet** → Traditional Bitcoin learning
- **Mutinynet** → Lightning development (LSP pre-configured)
- **Mainnet** → Production (real money!)

Start with testnet/mutinynet!

### Where do I ask questions?

1. Check relevant docs above
2. Search [GitHub Issues](https://github.com/LtbLightning/ldk_node_flutter/issues)
3. Open new issue with details

### How do I report a bug?

→ [Open GitHub Issue](https://github.com/LtbLightning/ldk_node_flutter/issues/new)

Include:
- What you were doing
- Error message
- Your code
- What you expected

### How do I contribute?

→ [CONTRIBUTING.md](./CONTRIBUTING.md)

### Is this production-ready?

Yes! Built on battle-tested LDK and BDK. Follow security checklist before deploying.

### Can I use mainnet?

Yes, but only after:
1. Testing thoroughly on testnet
2. Following security best practices
3. Reviewing production checklist

### How do I secure my mnemonic?

Use `flutter_secure_storage`, NOT SharedPreferences!

See [DOCUMENTATION.md - Security](./DOCUMENTATION.md#-mnemonic-security)

---

## 📞 Support

### Getting Help

1. **Documentation**: [DOCUMENTATION.md](./DOCUMENTATION.md)
2. **Quick Answers**: [GETTING_STARTED.md](./GETTING_STARTED.md#common-questions)
3. **Code Examples**: [examples/ai-ready/](./examples/ai-ready/)
4. **GitHub**: [Issues](https://github.com/LtbLightning/ldk_node_flutter/issues)

### Report Issues

→ [GitHub Issues](https://github.com/LtbLightning/ldk_node_flutter/issues/new)

Include: Error, code, expected behavior, what you tried

---

## 🤖 For AI Assistants

If you're Claude, ChatGPT, or another AI assistant:

See the AI assistant sections in:
- [DOCUMENTATION.md - For AI Assistants](./DOCUMENTATION.md#-for-ai-assistants)
- [mcp-server/README.md - For AI Assistants](./mcp-server/README.md#-for-ai-assistants)

You have access to:
- Complete API reference
- All code examples
- Best practices and patterns
- Error solutions
- MCP tools for integration

---

## 🏁 Next Steps

1. **Choose your path** above based on experience level
2. **Read the relevant section** for your task
3. **Follow the examples** provided
4. **Build your app** with confidence
5. **Deploy to production** with security checklist

---

## 📄 License

Dual-licensed under MIT and Apache 2.0.

- [MIT License](./LICENSE)
- [Apache 2.0 License](./LICENSE-APACHE)

---

**Happy building! ⚡🔥**

For questions or suggestions, open an issue on [GitHub](https://github.com/LtbLightning/ldk_node_flutter).
