# AI Prompt: Wallet Backup & Restore

## Say This to Your AI Assistant:

"Add wallet backup and restore functionality:
1. Show the user's 12 or 24 word recovery phrase
2. Allow restoring a wallet from a mnemonic phrase
3. Verify the mnemonic is valid before restoring
4. Warn about keeping the phrase secure

Use ldk_node's Mnemonic and Builder APIs for seed management."

---

## Expected AI Actions:

1. **Generate a new mnemonic:**
   ```dart
   // Generate a random 12-word mnemonic (default)
   final mnemonic = await ldk.Mnemonic.generate();
   print(mnemonic.seedPhrase); // "abandon ability able about above absent..."
   
   // Generate with specific word count (12 or 24 words)
   // Uses the lower-level API
   import 'package:ldk_node/src/generated/api/builder.dart' as builder;
   
   final mnemonic12 = await builder.FfiMnemonic.generateWithWordCount(wordCount: 12);
   final mnemonic24 = await builder.FfiMnemonic.generateWithWordCount(wordCount: 24);
   ```

2. **Create wallet from existing mnemonic:**
   ```dart
   // Restore from seed phrase
   final mnemonic = ldk.Mnemonic(
     seedPhrase: 'abandon ability able about above absent absorb abstract absurd abuse access accident',
   );
   
   final builder = ldk.Builder.testnet()
     .setEntropyBip39Mnemonic(mnemonic: mnemonic)
     .setStorageDirPath(storagePath);
   
   final node = await builder.build();
   await node.start();
   await node.syncWallets(); // Scan blockchain for existing funds
   ```

3. **Validate mnemonic before using:**
   ```dart
   bool isValidMnemonic(String phrase) {
     try {
       // Will throw if invalid
       final mnemonic = ldk.Mnemonic(seedPhrase: phrase);
       
       // Check word count
       final words = phrase.trim().split(RegExp(r'\s+'));
       if (![12, 15, 18, 21, 24].contains(words.length)) {
         return false;
       }
       
       return true;
     } catch (e) {
       return false;
     }
   }
   ```

4. **Display seed phrase securely:**
   ```dart
   class SeedPhraseDisplay extends StatefulWidget {
     final String seedPhrase;
     
     @override
     Widget build(BuildContext context) {
       final words = seedPhrase.split(' ');
       
       return Column(
         children: [
           // Warning banner
           Container(
             color: Colors.orange,
             padding: EdgeInsets.all(16),
             child: Text(
               '⚠️ Never share your recovery phrase. Anyone with these words can steal your funds.',
               style: TextStyle(fontWeight: FontWeight.bold),
             ),
           ),
           
           // Word grid
           GridView.builder(
             shrinkWrap: true,
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 3,
               childAspectRatio: 2.5,
             ),
             itemCount: words.length,
             itemBuilder: (context, index) {
               return Card(
                 child: Center(
                   child: Text('${index + 1}. ${words[index]}'),
                 ),
               );
             },
           ),
         ],
       );
     }
   }
   ```

5. **Restore flow with verification:**
   ```dart
   Future<ldk.Node?> restoreWallet(String seedPhrase) async {
     // Validate input
     if (!isValidMnemonic(seedPhrase)) {
       throw Exception('Invalid recovery phrase');
     }
     
     // Create mnemonic object
     final mnemonic = ldk.Mnemonic(seedPhrase: seedPhrase.trim());
     
     // Get storage path
     final directory = await getApplicationDocumentsDirectory();
     final storagePath = '${directory.path}/ldk_node_restored';
     
     // Build node with restored seed
     final builder = ldk.Builder.testnet()
       .setEntropyBip39Mnemonic(mnemonic: mnemonic)
       .setStorageDirPath(storagePath);
     
     final node = await builder.build();
     await node.start();
     
     // Full sync to find existing funds/channels
     await node.syncWallets();
     
     return node;
   }
   ```

---

## If AI Gets Stuck:

- **Invalid mnemonic error**: Check word count (12, 15, 18, 21, 24) and valid BIP39 words
- **Funds not showing**: Call `syncWallets()` after restore to scan blockchain
- **Old wallet data**: Clear storage directory before restoring different seed
- **Word list**: Must use BIP39 English word list

---

## Key APIs Used:

| Operation | API Call |
|-----------|----------|
| Generate mnemonic | `await ldk.Mnemonic.generate()` |
| From seed phrase | `ldk.Mnemonic(seedPhrase: phrase)` |
| Set entropy | `builder.setEntropyBip39Mnemonic(mnemonic: m)` |
| Set seed file | `builder.setEntropySeedPath(path)` |
| Set seed bytes | `builder.setEntropySeedBytes(bytes)` |

---

## Entropy Source Options:

```dart
// Option 1: BIP39 Mnemonic (recommended for user backup)
builder.setEntropyBip39Mnemonic(
  mnemonic: ldk.Mnemonic(seedPhrase: '...'),
  passphrase: 'optional passphrase', // BIP39 passphrase, NOT a password
);

// Option 2: Seed file (auto-generated if missing)
builder.setEntropySeedPath('/path/to/seed_file');

// Option 3: Raw seed bytes (64 bytes)
builder.setEntropySeedBytes(U8Array64(seedBytes));
```

---

## BIP39 Word Counts:

| Words | Entropy (bits) | Security Level |
|-------|----------------|----------------|
| 12 | 128 | Standard |
| 15 | 160 | Good |
| 18 | 192 | Better |
| 21 | 224 | High |
| 24 | 256 | Maximum |

For most use cases, 12 words provides sufficient security.

---

## Security Best Practices:

```dart
// 1. Never log or print seed phrase in production
assert(() {
  print(mnemonic.seedPhrase); // Only in debug
  return true;
}());

// 2. Clear clipboard after copy
void copySeedPhrase(String phrase) {
  Clipboard.setData(ClipboardData(text: phrase));
  
  // Clear after 60 seconds
  Future.delayed(Duration(seconds: 60), () {
    Clipboard.setData(ClipboardData(text: ''));
  });
}

// 3. Verify user wrote it down
Future<bool> verifySeedPhrase(String original, List<int> wordIndicesToVerify) async {
  final words = original.split(' ');
  
  // Ask user to enter specific words
  for (final index in wordIndicesToVerify) {
    final userInput = await showWordInputDialog(index + 1);
    if (userInput.toLowerCase().trim() != words[index].toLowerCase()) {
      return false;
    }
  }
  return true;
}

// 4. Use secure storage for seed
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = FlutterSecureStorage();
await storage.write(key: 'wallet_seed', value: mnemonic.seedPhrase);
final restored = await storage.read(key: 'wallet_seed');
```

---

## Restore Flow UI:

```dart
class RestoreWalletScreen extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Restore Wallet')),
      body: Column(
        children: [
          // Word count selector
          DropdownButton<int>(
            value: _wordCount,
            items: [12, 24].map((c) => 
              DropdownMenuItem(value: c, child: Text('$c words'))
            ).toList(),
            onChanged: (v) => setState(() => _wordCount = v!),
          ),
          
          // Word input grid
          GridView.builder(
            itemCount: _wordCount,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (context, index) {
              return TextField(
                controller: _controllers[index],
                decoration: InputDecoration(
                  labelText: 'Word ${index + 1}',
                ),
                autocorrect: false,
              );
            },
          ),
          
          // Restore button
          ElevatedButton(
            onPressed: _restore,
            child: Text('Restore Wallet'),
          ),
        ],
      ),
    );
  }
}
```

---

## Reference:

- Package: https://pub.dev/packages/ldk_node
- GitHub: https://github.com/LtbLightning/ldk-node-flutter
- BIP39: https://github.com/bitcoin/bips/blob/master/bip-0039.mediawiki
