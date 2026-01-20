# Changelog

All notable changes to the ldk_node Flutter MCP Server will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2024-01-20

### Added

- **Initial Release** of ldk_node Flutter MCP Server
- **6 Core Tools**:
  - `search_api_docs` - Search ldk_node API documentation
  - `get_code_example` - Get working code examples (12+ operations)
  - `get_setup_guide` - Network-specific setup guides (testnet/mutinynet/mainnet)
  - `get_error_solution` - Solutions for common errors
  - `get_example_prompt` - Complete AI-ready feature prompts (10 features)
  - `validate_code` - Validate Dart code against best practices
- **8+ Resources**:
  - AGENTS.md - Comprehensive agent instructions and patterns
  - API reference - Complete API documentation in JSON format
  - 10 example prompts - AI-ready templates for common features
- **Code Validation** with 15+ checks:
  - Missing `await` keywords
  - Old vs new API usage (Unsafe suffix pattern)
  - Incorrect property access
  - Security issues (mnemonic storage)
  - Initialization pattern compliance
  - Event handling patterns
  - Unit correctness (sats vs msats)
- **Comprehensive Documentation**:
  - README.md with both developer and AI sections
  - API.md with complete tool/resource reference
  - CONTRIBUTING.md for developers
  - Inline code documentation and docstrings
- **Testing**:
  - Unit tests with pytest
  - Test cases for all tools
  - Coverage reporting
- **Python Project Structure**:
  - pyproject.toml with hatchling build system
  - Professional package organization
  - Development dependencies included
  - Proper entry points for MCP

### Supported Features

- **Payment Types**: BOLT11, BOLT12, On-chain, Keysend, Spontaneous
- **Networks**: Bitcoin Testnet, Signet (Mutinynet with LSP), Mainnet
- **Operations**: 12+ common operations documented with examples
- **Platforms**: Works with any MCP-compatible client (Claude Desktop, others)

### Known Limitations

- Requires Python 3.10+
- Designed for ldk_node v0.7.0+ (Unsafe API pattern)
- Resources are read-only (documentation only)
- No persistent state between sessions

### Dependencies

- mcp ^0.9.0
- pydantic ^2.0.0
- (Development) pytest, pytest-asyncio, black, ruff

## Roadmap

### Planned for v0.2.0

- [ ] More validation checks
- [ ] Additional error solutions
- [ ] Performance optimization
- [ ] Extended example coverage
- [ ] Custom error categories

### Planned for v0.3.0

- [ ] Integration with Dart analyzer
- [ ] Real-time code checking
- [ ] Plugin system for custom tools
- [ ] Documentation generation
- [ ] Multi-language support

## Upgrade Guide

### From Pre-Release to 0.1.0

If you were using a pre-release version:

```bash
# Update installation
pip install --upgrade ldk-node-flutter-mcp

# Or from source
cd mcp-server
git pull
pip install -e .
```

No breaking changes from pre-releases to v0.1.0.

## Contributors

- Initial implementation by LTB Lightning
- Based on ldk_node Flutter package
- MCP protocol specification by Anthropic

## License

Dual-licensed under MIT and Apache 2.0, consistent with ldk_node.
