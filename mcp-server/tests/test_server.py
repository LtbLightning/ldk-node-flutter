"""Tests for the ldk_node MCP server."""

import pytest
from pathlib import Path
from ldk_node_mcp.server import LdkNodeMcpServer, PACKAGE_ROOT


def test_package_root_exists():
    """Test that PACKAGE_ROOT points to the correct directory."""
    assert PACKAGE_ROOT.exists()
    assert (PACKAGE_ROOT / "AGENTS.md").exists()
    assert (PACKAGE_ROOT / "examples" / "ai-ready").exists()


def test_server_initialization():
    """Test that the server can be initialized."""
    server = LdkNodeMcpServer()
    assert server.server is not None
    assert server.server.name == "ldk-node-flutter"


@pytest.mark.asyncio
async def test_validate_code_async_await():
    """Test code validation catches missing await."""
    server = LdkNodeMcpServer()
    
    bad_code = """
    final node = await builder.build();
    node.start();  // Missing await!
    """
    
    result = await server._validate_code(bad_code)
    assert len(result) > 0
    assert "await" in result[0].text.lower()


@pytest.mark.asyncio
async def test_validate_code_old_api():
    """Test code validation catches old API usage."""
    server = LdkNodeMcpServer()
    
    bad_code = """
    final bolt11 = await node.bolt11Payment();
    await bolt11.receive(amountMsat: amount);  // Should be receiveUnsafe
    """
    
    result = await server._validate_code(bad_code)
    assert len(result) > 0
    assert "Unsafe" in result[0].text or "receiveUnsafe" in result[0].text


@pytest.mark.asyncio
async def test_validate_code_secure_storage():
    """Test code validation catches insecure mnemonic storage."""
    server = LdkNodeMcpServer()
    
    bad_code = """
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('mnemonic', mnemonic.seedPhrase);  // INSECURE!
    """
    
    result = await server._validate_code(bad_code)
    assert len(result) > 0
    text = result[0].text.lower()
    assert "never" in text or "secure" in text or "sharedpreferences" in text


@pytest.mark.asyncio
async def test_get_code_example():
    """Test getting code examples."""
    server = LdkNodeMcpServer()
    
    result = await server._get_code_example("initialize_node", True)
    assert len(result) > 0
    assert "Builder" in result[0].text
    assert "start()" in result[0].text


@pytest.mark.asyncio
async def test_get_setup_guide():
    """Test getting setup guides for different networks."""
    server = LdkNodeMcpServer()
    
    for network in ["testnet", "mutinynet", "mainnet"]:
        result = await server._get_setup_guide(network)
        assert len(result) > 0
        assert network.title() in result[0].text or network.upper() in result[0].text


def test_api_reference_generation():
    """Test API reference generation."""
    server = LdkNodeMcpServer()
    api_ref = server._generate_api_reference()
    
    assert "version" in api_ref
    assert api_ref["version"] == "0.7.0"
    assert "core_apis" in api_ref
    assert "Node" in api_ref["core_apis"]
    assert "Builder" in api_ref["core_apis"]
    assert "Bolt11Payment" in api_ref["core_apis"]
    assert "critical_notes" in api_ref
