## [0.4.2]
Updated `flutter_rust_bridge` to `2.6.0`.
Updated `ldk-node` to `0.4.2`.
#### APIs added
- Support for multiple chain sources has been added. The `setChainSourceBitcoinRpc` method has been introduced in the Builder class to allow the use of 
  Bitcoin Core RPC.
- Support for sourcing chain and fee estimation data from a Bitcoin Core RPC backed.
- Initial experimental support for an encrypted VSS remote storage backend has been added using `builder.buildWithVssStore` &     
  `builder.buildWithVssStoreAndFixedHeaders` methods.
   - **Caution**: VSS support is in **alpha** and is considered experimental. Using VSS (or any remote persistence) may cause LDK to throw an exception 
     if persistence failures are unrecoverable, i.e., if they remain unresolved after internal retries are exhausted.
- Support for setting the `NodeAlias` in public node announcements using `builder.setNodeAlias` has been added.
- Exposed `node.unifiedQrPayment` & `UnifiedQrPayment` handler for generating and paying unified QR codes.   
- Support for `quantity` and `payerNote` fields when sending or receiving `BOLT12` payments have been added.
- Support for setting `SendingParameters` when sending `BOLT11` payments has been added.
#### API changed
- `node.connectOpenChannel` was split into `openChannel` and `openAnnouncedChannel`.
- The `setEsploraServer` method has been renamed to `setChainSourceEsplora`, and Esplora-specific configuration options can now be provided using 
  `EsploraSyncConfig`.
#### Fixed
- The `ChannelConfig` object has been refactored, now allowing to query the currently applied `MaxDustHTLCExposure` limit.
- The `Node` no longer throws an exception when hitting a persistence failure during event handling. Instead, events will be replayed until successful.
- The `Node` is no longer prohibited from using available confirmed on-chain funds to spend/bump Anchor outputs.

## [0.3.0]
Updated `flutter_rust_bridge` to `2.0.0`.
#### APIs added
- `buildWithFsStore` method is added in the `Builder` class allowing to use the filesystem storage backend.
- Exposed `setLiquiditySourceLsps2` method to `Builder` to configure the `Node` instance to source the inbound liquidity. 
- `nextEventAsync` method is added to `Node` class that allows polling the event queue asynchronously.
- `status` method has been added to `Node` allowing to retrieve information about the Node's status.
- `config` method added to get the config with which the `Node` was initialized.
- The payment APIs have been restructured to use per-type (bolt11, onchain, bolt12) payment handlers which can be accessed via `node.{type}Payment`.
- Support for sourcing inbound liquidity via LSPS2 just-in-time (JIT) channels has been added.
- Support for creating and paying BOLT12 offers and refunds has been added.
- Added `networkGraph` handler method allowing to query the network graph.
- Added `forceCloseChannel` to `Node` class.
#### API changed
- All available balances outside of channel balances are now exposed via a unified `listBalances` interface method.
#### Fixed
Persisted peers are now correctly reconnected after startup.

## [0.2.2-dev]
Updated Rust and Flutter dependencies.
#### APIs added
- Expose `isRunning()` in `Node` class.
#### API changed
- Renamed `waitUntilNextHandled()` to `waitNextHandled`.
- Renamed `listeningAddress()` to `listeningAddresses`.
- Upgraded `BuilderException` to handle invalid `socketAddress` & `trustedPeers.
- Upgraded `NodeException` to handle invalid `txid`.
#### Fixed
- Functions hang indefinitely on iOs devices
- Android support bug resolved
- Thread `frb_workerpool` panic on `SocketAddress`, `PublicKey`, `Address` `Bolt11Invoice`, `Config` and `Txid`.

## [0.2.0]
Updated `Rust` and `Flutter` dependencies.

## [0.1.3]
Updated `Rust` and `Flutter` dependencies.
Invalid `BuilderException` bug resolved
#### APIs added
- Expose  `generate()` in `Mnemonic` class.
#### API changed
- Remove `generateEntropyMnemonic()`.

## [0.1.2]
#### APIs added
- Expose `generateEntropyMnemonic` function - a utility method for generating a BIP39 mnemonic.
- Expose `Node` class's `updateChannelConfig`, `verifySignature`, `signMessage`,  `sendPaymentProbe`, `sendSpontaneousPaymentProbe` methods.
- Add `ChannelConfig?` to node.connectOpenChannel() params - a `ChannelConfig` may now be specified on channel open or updated afterwards.
- Expose `counterpartyNodeId`, `funding_txo` & `channelValueSats` in `ChannelDetails`.
- Expose `trustedPeers0Conf` `probingLiquidityLimitMultiplier`, `logDirPath`, `onchainWalletSyncInterval_secs`, `walletSyncIntervalSecs`, &
  `feeRateCacheUpdateIntervalSecs` in `Config` - allowing inbound trusted 0conf channels. 
- Non-permanently connected peers are now included in node.listPeers().

#### API changed
- node.newFundingAddress renamed to `newOnchainAddress`.
- node.sendToOnChainAddress renamed to `sendToOnchainAddress`.
- node.sendAllToOnChainAddress renamed to `sendAllToOnchainAddress`.
- Remove node.onChainBalance.

## [0.1.1-alpha]
Support `Dart 3` and `Flutter 3.10`

## [0.1.1]
Support `Dart 3` and `Flutter 3.10`

### Fixed
 -  `setEntropyBip39Mnemonic` issue resolved
## [0.1.0]

This is the first release of `ldk_node`. It features support for sourcing chain data via an `Esplora` server, filesystem persistence, gossip sourcing via the `Lightning` peer-to-peer network, and configurble entropy sources for the integrated LDK & BDK-based wallets.

### Functionality Added

`build`- Builds an `Node` instance according to the options previously configured.

`fromConfig`- Creates a new `Builder` instance from an Config.

`setEntropyBip39Mnemonic`- Configures the `Node` instance to source its wallet entropy from a BIP 39 mnemonic.

`setEntropySeedBytes`- Configures the `Node` instance to source its wallet entropy from the given seed bytes.

`setEntropySeedPath`- Configures the `Node` instance to source its wallet entropy from a seed file on disk.

`setEsploraServerUrl`- Sets the `Esplora` server URL. Default: https://blockstream.info/api

`setListeningAddress`- Sets the IP address and TCP port on which Node will listen for incoming network connections. Default: 0.0.0.0:9735

`setNetwork`- Sets the `Bitcoin` network used.

`setStorageDirPath`- Sets the used storage directory path.

`closeChannel`- Close a previously opened channel.

`connect`- Connect to a node on the peer-to-peer network. If permanently is set to true, we’ll remember the peer and reconnect to it on restart

`connectOpenChannel`- Connect to a node and open a new channel. Disconnects and re-connects are handled automatically

`disconnect`- Disconnects the peer with the given `node id`.

`eventHandled`- Confirm the last retrieved event handled.

`listChannels`- Retrieve a list of known channels.

`listPaymentsWithFilter`- Retrieves all payments that match the given predicate.

`listeningAddress`- Returns our own listening address.

`newFundingAddress`- Retrieve a new on-chain/funding address.

`nextEvent`- Blocks until the next event is available.

`nodeId`- Returns our own `node id`.

`onchainBalance`- Retrieve the current on-chain balance.

`payment`- Retrieve the details of a specific payment with the given hash.

`receivePayment`- Returns a payable invoice that can be used to request and receive a payment of the amount given.

`receiveVariableAmountPayment`- Returns a payable invoice that can be used to request and receive a payment for which the amount is to be determined by the user,also known as a `zero-amount` invoice.

`removePayment`- Remove the payment with the given hash from the store.

`sendAllToOnchainAddress`- Send an on-chain payment to the given address, draining all the available funds.

`sendPayment`- Send a payement given an invoice.

`sendPaymentUsingAmount`- Send a payment given an invoice and an amount in millisatoshi.

`sendSpontaneousPayment`- Send a spontaneous, aka. `keysend`, payment.

`sendToOnchainAddress`- Send an on-chain payment to the given address.

`start`- Starts the necessary background tasks, such as handling events coming from user input, `LDK/BDK`, and the peer-to-peer network.

`stop`- Disconnects all peers, stops all running background tasks, and shuts down Node.

`syncWallets`- Sync the `LDK & BDK` wallets with the current chain state.