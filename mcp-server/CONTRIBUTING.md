# Contributing to LDK Node Flutter MCP Server

Thank you for your interest in contributing! This document provides guidelines and instructions for contributing.

## Code of Conduct

Be respectful, inclusive, and constructive. We're all here to learn and build great tools together.

## Getting Started

### Prerequisites

- Python 3.10+
- pip
- git

### Development Setup

1. **Fork and clone**
   ```bash
   git clone https://github.com/YOUR_USERNAME/ldk_node_flutter.git
   cd ldk_node_flutter/mcp-server
   ```

2. **Install in editable mode with dev dependencies**
   ```bash
   pip install -e ".[dev]"
   ```

3. **Verify setup**
   ```bash
   python -c "from ldk_node_mcp.server import LdkNodeMcpServer; print('✅ Ready')"
   pytest --version
   black --version
   ruff --version
   ```

## Making Changes

### Code Style

We follow PEP 8 with a line length of 100 characters.

**Format your code:**
```bash
black src/ tests/
```

**Lint your code:**
```bash
ruff check src/ tests/
ruff check --fix src/ tests/  # Auto-fix common issues
```

### Testing

Write tests for new functionality.

**Run all tests:**
```bash
pytest
```

**Run with coverage:**
```bash
pytest --cov=src/ldk_node_mcp tests/
```

**Run specific test:**
```bash
pytest tests/test_server.py::test_specific_function
```

**Test file template:**
```python
import pytest
from ldk_node_mcp.server import LdkNodeMcpServer

@pytest.mark.asyncio
async def test_my_feature():
    server = LdkNodeMcpServer()
    result = await server._my_method("test")
    assert result is not None
```

### Commit Messages

Follow conventional commits:

```
feat: Add new validation check for async methods
fix: Correct PACKAGE_ROOT path resolution
docs: Add AI assistant section to README
test: Add tests for code validation
refactor: Simplify resource reading logic
chore: Update dependencies
```

## Pull Request Process

1. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make your changes**
   - Keep commits logical and atomic
   - Update tests
   - Update documentation if needed

3. **Test everything**
   ```bash
   pytest
   black src/ tests/
   ruff check src/ tests/
   ```

4. **Push and create PR**
   ```bash
   git push origin feature/your-feature-name
   ```
   Then open a PR on GitHub with:
   - Clear description of changes
   - Reference to any related issues
   - Screenshots if UI changes

5. **Address feedback**
   - We'll review your PR
   - Make requested changes
   - Push updates (no need to close/reopen)

## Areas for Contribution

### High Priority

- [ ] Additional code validation checks
- [ ] More example patterns
- [ ] Integration with other MCP servers
- [ ] Documentation improvements
- [ ] Error message enhancements

### Medium Priority

- [ ] Performance optimizations
- [ ] Additional test coverage
- [ ] API reference completeness
- [ ] Developer experience improvements

### Low Priority

- [ ] Code refactoring
- [ ] Type hint improvements
- [ ] Comment clarity

## Building Documentation

### Local Preview

Documentation is in `README.md`. To view formatted:

```bash
# Install grip (GitHub README preview)
pip install grip

# Preview README
grip README.md

# Open http://localhost:6419 in browser
```

### Making Changes

- Keep documentation clear and concise
- Use examples liberally
- Include code snippets where helpful
- Test all command examples before committing
- Update the AI assistant section if changing tool behavior

## Testing Your Changes

### Test a Tool

```python
import asyncio
from ldk_node_mcp.server import LdkNodeMcpServer

async def test():
    server = LdkNodeMcpServer()
    result = await server._search_api_docs("invoice")
    print(result[0].text)

asyncio.run(test())
```

### Test Resource Reading

```python
from ldk_node_mcp.server import LdkNodeMcpServer

async def test_resource():
    server = LdkNodeMcpServer()
    content = await server.server.read_resource("ldk_node://agents")
    print(content[:200])  # First 200 chars
```

## Debugging Tips

### Enable Debug Logging

```python
import logging
logging.basicConfig(level=logging.DEBUG)

# Then run your code
```

### Print Debugging

```python
import sys
print(f"Debug: {variable}", file=sys.stderr)
```

### Common Issues

**Import errors?**
```bash
pip install -e .
python -m pytest  # Not just pytest
```

**Path issues?**
```bash
cd mcp-server
python -m ldk_node_mcp.server
```

**Dependencies out of date?**
```bash
pip install --upgrade --upgrade-strategy eager -e ".[dev]"
```

## Release Process

(For maintainers)

1. Update version in `pyproject.toml`
2. Update `CHANGELOG.md` (create if needed)
3. Run full test suite
4. Tag release: `git tag v0.2.0`
5. Push: `git push origin v0.2.0`
6. Publish: `python -m build && twine upload dist/*`

## Questions?

- Check existing issues for similar questions
- Create a new discussion for broader questions
- For security issues, email maintainers privately

## Thank You!

Your contributions make this project better for everyone. We appreciate your time and effort!
