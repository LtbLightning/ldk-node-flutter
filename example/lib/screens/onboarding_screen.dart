import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/settings_service.dart';
import 'package:flutter/services.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  String? _generatedMnemonic;
  final TextEditingController _nodeNameController = TextEditingController();
  int _selectedPort = 9735;
  bool _isGenerating = false;
  bool _isSaving = false;
  String? _errorMessage;

  final List<int> _availablePorts = [9735, 9736, 9737, 9738, 9739, 9740];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _nodeNameController.text = 'my-node';
  }

  @override
  void dispose() {
    _tabController.dispose();
    _nodeNameController.dispose();
    super.dispose();
  }

  Future<void> _generateMnemonic() async {
    setState(() {
      _isGenerating = true;
      _errorMessage = null;
    });

    try {
      final mnemonic = await SettingsService.generateMnemonic();
      setState(() {
        _generatedMnemonic = mnemonic;
        _isGenerating = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to generate mnemonic: $e';
        _isGenerating = false;
      });
    }
  }

  Future<void> _saveSettings() async {
    if (_generatedMnemonic == null) {
      setState(() {
        _errorMessage = 'Please generate a mnemonic first';
      });
      return;
    }

    if (_nodeNameController.text.trim().isEmpty) {
      setState(() {
        _errorMessage = 'Please enter a node name';
      });
      return;
    }

    setState(() {
      _isSaving = true;
      _errorMessage = null;
    });

    try {
      await SettingsService.saveUserSettings(
        mnemonic: _generatedMnemonic!,
        nodeName: _nodeNameController.text.trim(),
        port: _selectedPort,
      );
      await SettingsService.markFirstRunComplete();

      if (mounted) {
        Navigator.of(context).pushReplacementNamed('/dashboard');
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to save settings: $e';
        _isSaving = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1A73E8), Color(0xFF0D47A1)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Icon(
                      Icons.flash_on,
                      size: 64,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Welcome to Cypherpunk\nLightning Wallet',
                      style: GoogleFonts.montserrat(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Set up your Lightning node',
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              // Tab Bar
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelColor: const Color(0xFF1A73E8),
                  unselectedLabelColor: Colors.white,
                  labelStyle:
                      GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                  tabs: const [
                    Tab(text: '1. Mnemonic'),
                    Tab(text: '2. Node Name'),
                    Tab(text: '3. Port'),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Tab Content
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildMnemonicTab(),
                      _buildNodeNameTab(),
                      _buildPortTab(),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMnemonicTab() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Generate Your Mnemonic',
            style: GoogleFonts.montserrat(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A73E8),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'This is your wallet\'s backup phrase. Write it down and keep it safe!',
            style: GoogleFonts.nunito(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 24),
          if (_generatedMnemonic == null) ...[
            Center(
              child: ElevatedButton.icon(
                onPressed: _isGenerating ? null : _generateMnemonic,
                icon: _isGenerating
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.refresh),
                label:
                    Text(_isGenerating ? 'Generating...' : 'Generate Mnemonic'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A73E8),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  textStyle: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ] else ...[
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Your Mnemonic',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF1A73E8),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Clipboard.setData(
                                ClipboardData(text: _generatedMnemonic!),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Mnemonic copied to clipboard!'),
                                ),
                              );
                            },
                            icon: const Icon(Icons.copy),
                            tooltip: 'Copy to clipboard',
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      SelectableText(
                        _generatedMnemonic!,
                        style: GoogleFonts.nunito(
                          fontSize: 16,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange[200]!),
              ),
              child: Row(
                children: [
                  Icon(Icons.warning, color: Colors.orange[700]),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Write this down and keep it safe! You\'ll need it to recover your wallet.',
                      style: GoogleFonts.nunito(
                        color: Colors.orange[700],
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (_errorMessage != null) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red[200]!),
              ),
              child: Text(
                _errorMessage!,
                style: GoogleFonts.nunito(
                  color: Colors.red[700],
                  fontSize: 14,
                ),
              ),
            ),
          ],
          const Spacer(),
          _buildNavigationButtons(),
        ],
      ),
    );
  }

  Widget _buildNodeNameTab() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Choose Your Node Name',
            style: GoogleFonts.montserrat(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A73E8),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'This will be your node\'s identifier on the Lightning Network',
            style: GoogleFonts.nunito(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 24),
          TextFormField(
            controller: _nodeNameController,
            decoration: InputDecoration(
              labelText: 'Node Name',
              hintText: 'e.g., my-lightning-node',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: const Icon(Icons.tag),
            ),
            style: GoogleFonts.nunito(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue[200]!),
            ),
            child: Row(
              children: [
                Icon(Icons.info, color: Colors.blue[700]),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Choose a unique name that represents your node. This will be visible to other Lightning Network participants.',
                    style: GoogleFonts.nunito(
                      color: Colors.blue[700],
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          _buildNavigationButtons(),
        ],
      ),
    );
  }

  Widget _buildPortTab() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Your Port',
            style: GoogleFonts.montserrat(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A73E8),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Choose a port for your Lightning node to listen on',
            style: GoogleFonts.nunito(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Available Ports:',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: _availablePorts.length,
              itemBuilder: (context, index) {
                final port = _availablePorts[index];
                final isSelected = port == _selectedPort;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedPort = port;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF1A73E8)
                          : Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFF1A73E8)
                            : Colors.grey[300]!,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Port $port',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          color: isSelected ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.green[200]!),
            ),
            child: Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green[700]),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Port $_selectedPort is selected. Make sure this port is available on your system.',
                    style: GoogleFonts.nunito(
                      color: Colors.green[700],
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildNavigationButtons(),
        ],
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Row(
      children: [
        if (_tabController.index > 0)
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                _tabController.animateTo(_tabController.index - 1);
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Previous',
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        if (_tabController.index > 0) const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: _isSaving
                ? null
                : () {
                    if (_tabController.index < 2) {
                      _tabController.animateTo(_tabController.index + 1);
                    } else {
                      _saveSettings();
                    }
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1A73E8),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              textStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: _isSaving
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(_tabController.index == 2 ? 'Complete Setup' : 'Next'),
          ),
        ),
      ],
    );
  }
}
