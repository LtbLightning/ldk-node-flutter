# Lightning Wallet Configuration System

This app now supports user-configurable node settings with persistent storage.

## Features

### 🔐 **User-Generated Mnemonics**
- Users can generate their own secure mnemonics
- Mnemonics are stored securely using SharedPreferences
- Option to generate new mnemonics (creates new wallet)

### 🏷️ **Custom Node Names**
- Users can set their own node name
- Node name is displayed in the app title
- Stored persistently for future sessions

### 🔌 **Configurable Ports**
- Users can choose from available ports (9735-9740)
- Prevents port conflicts when running multiple emulators
- Port selection is stored and remembered

### 💾 **Persistent Storage**
- All settings are saved using SharedPreferences
- Settings persist across app restarts
- No hardcoded values for production use

## First Run Experience

When users first launch the app, they'll see a beautiful onboarding flow:

1. **Step 1: Generate Mnemonic**
   - Tap "Generate Mnemonic" to create a new wallet
   - Copy the mnemonic to clipboard
   - Warning about keeping it safe

2. **Step 2: Set Node Name**
   - Enter a custom node name
   - This will be visible to other Lightning Network participants

3. **Step 3: Choose Port**
   - Select from available ports (9735-9740)
   - Different ports allow multiple emulators on same machine

## Settings Management

Users can access settings via the settings icon in the app bar:

- **View Current Settings**: See current mnemonic, node name, and port
- **Update Settings**: Change node name or port
- **Generate New Mnemonic**: Create a new wallet (warning about data loss)
- **Copy Mnemonic**: Copy current mnemonic to clipboard

## Multiple Emulator Support

To run multiple emulators on the same machine:

1. **First Emulator**: Use default settings (port 9735)
2. **Second Emulator**: Go to Settings → Change Port to 9736
3. **Additional Emulators**: Use ports 9737, 9738, etc.

Each emulator will have its own:
- Unique port
- Separate storage directory
- Independent wallet

## Technical Implementation

### Files Created/Modified:

- `lib/services/settings_service.dart` - Persistent storage service
- `lib/screens/onboarding_screen.dart` - First-run setup flow
- `lib/screens/settings_screen.dart` - Settings management UI
- `lib/config/node_config.dart` - Updated to use user settings
- `lib/main.dart` - Added startup flow and routing
- `lib/screens/dashboard_screen.dart` - Added settings button

### Dependencies:
- `shared_preferences: ^2.2.3` - For persistent storage
- `google_fonts: ^6.2.1` - For beautiful typography
- `qr_flutter: ^4.1.0` - For QR code display

## Security Notes

- Mnemonics are stored in SharedPreferences (device storage)
- Consider implementing encryption for production use
- Users are warned about keeping mnemonics safe
- Option to generate new mnemonics creates completely new wallets

## Testing Multiple Emulators

1. Start first emulator with default settings
2. Start second emulator and go through onboarding
3. Choose different port (e.g., 9736)
4. Both emulators can run simultaneously without conflicts
5. Each has its own wallet and can connect to each other

## Future Enhancements

- [ ] Encrypt stored mnemonics
- [ ] Add mnemonic validation
- [ ] Support for custom port ranges
- [ ] Backup/restore settings
- [ ] Import existing mnemonics 