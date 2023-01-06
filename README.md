**LDK-Node(Flutter)**, a Flutter library for **Lightning Development Kit(LDK)**

API implemented from **`Ldk-Node`** and available in this flutter library:

- `setListeningAddress`,
- `setNetwork`
- `setEsploraServerUrl` 
- `setStorageDirPath` 
- `fromConfig` 
- `build` 
- `start` 
- `stop`
- `eventHandled` 
- `listeningAddress`
- `connectOpenChannel` 
- `closeChannel`

**The methods which are different from `Ldk Node`**

- `paymentInfo` - Returns a PaymentStaus in the Flutter side, but PaymentInfo in ldk-lite
- `sendSpontaneousPayment` - Returns a hash string in the Flutter side, but a PaymentHash object in ldk-lite
- `sendPayment` - Returns a hash string in the Flutter side, but a PaymentHash object in ldk-lite
- `newFundingAddress` - Returns a string in the Flutter side, but an Address object in ldk-lite
- `nodeId` - Returns a string in the Flutter side, but a PublicKey object in ldk-lite
- `nextEvent` - Returns a string in the Flutter side, but an Event object in ldk-lite

**Helper methods added to flutter library but not present in `Ldk Node`**

- `_toLdkConfig`,
- `_setLdkLiteInstance`
- `onChainBalance`
- `syncWallet`
- `getNodeInfo`
- `getChannelId`

**Methods which will be useful to add to `Ldk Node`**

- `syncWallet`
- `getNodeInfo`
- `onChainBalance`
- More error parameters in Error enum inside error.rs, to cover most of the bdk errors or  a message variable inside WalletOperationFailed to show the bdk's error message

