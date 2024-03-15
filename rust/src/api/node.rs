use crate::api::error::{BuilderException, NodeBaseError};
use crate::api::types::*;
use crate::frb_generated::RustOpaque;
pub use ldk_node::io::sqlite_store::SqliteStore;
use ldk_node::lightning::util::ser::Writeable;
use ldk_node::BuildError;
pub use ldk_node::Node;
use std::str::FromStr;
pub use std::sync::{Arc, Mutex};

#[derive(Debug, Clone)]
pub struct MnemonicBase {
    pub seed_phrase: String,
}

impl From<MnemonicBase> for ldk_node::bip39::Mnemonic {
    fn from(value: MnemonicBase) -> Self {
        ldk_node::bip39::Mnemonic::from_str(&value.seed_phrase).expect("Invalid seed phrase")
    }
}
impl From<ldk_node::bip39::Mnemonic> for MnemonicBase {
    fn from(value: ldk_node::bip39::Mnemonic) -> Self {
        MnemonicBase {
            seed_phrase: value.to_string(),
        }
    }
}
impl MnemonicBase {
    pub fn generate() -> MnemonicBase {
        ldk_node::generate_entropy_mnemonic().into()
    }
}

pub fn finalize_builder(
    config: Config,
    chain_data_source_config: Option<ChainDataSourceConfig>,
    entropy_source_config: Option<EntropySourceConfig>,
    gossip_source_config: Option<GossipSourceConfig>,
) -> anyhow::Result<NodeBase, BuilderException> {
    let builder = create_builder(
        config,
        chain_data_source_config,
        entropy_source_config,
        gossip_source_config,
    );
    match builder?.build() {
        Ok(e) => Ok(NodeBase {
            ptr: RustOpaque::new(e),
        }),
        Err(e) => Err(e.into()),
    }
}

fn create_builder(
    config: Config,
    chain_data_source_config: Option<ChainDataSourceConfig>,
    entropy_source_config: Option<EntropySourceConfig>,
    gossip_source_config: Option<GossipSourceConfig>,
) -> Result<ldk_node::Builder, BuildError> {
    let mut builder = ldk_node::Builder::from_config(config.into());
    if let Some(source) = entropy_source_config {
        match source {
            EntropySourceConfig::SeedFile(e) => builder.set_entropy_seed_path(e),
            EntropySourceConfig::SeedBytes(e) => builder.set_entropy_seed_bytes(e.encode())?,
            EntropySourceConfig::Bip39Mnemonic {
                mnemonic,
                passphrase,
            } => builder.set_entropy_bip39_mnemonic(mnemonic.into(), passphrase),
        };
    }
    if let Some(source) = chain_data_source_config {
        match source {
            ChainDataSourceConfig::Esplora(e) => builder.set_esplora_server(e),
        };
    }
    if let Some(source) = gossip_source_config {
        match source {
            GossipSourceConfig::P2PNetwork => builder.set_gossip_source_p2p(),
            GossipSourceConfig::RapidGossipSync(e) => builder.set_gossip_source_rgs(e),
        };
    }
    Ok(builder)
}

pub struct NodeBase {
    pub ptr: RustOpaque<Node<SqliteStore>>,
}
impl NodeBase {
    /// Starts the necessary background tasks, such as handling events coming from user input,
    /// LDK/BDK, and the peer-to-peer network.
    ///
    /// After this returns, the [Node] instance can be controlled via the provided API methods in
    /// a thread-safe manner.
    pub fn start(&self) -> anyhow::Result<(), NodeBaseError> {
        self.ptr.start().map_err(|e| e.into())
    }

    /// Disconnects all peers, stops all running background tasks, and shuts down [Node].
    ///
    /// After this returns most API methods will throw NotRunning Exception.
    pub fn stop(&self) -> anyhow::Result<(), NodeBaseError> {
        self.ptr.stop().map_err(|e| e.into())
    }

    /// Blocks until the next event is available.
    ///
    /// **Note:** this will always return the same event until handling is confirmed via `node.eventHandled()`.
    pub fn event_handled(&self) {
        self.ptr.event_handled()
    }

    /// Confirm the last retrieved event handled.
    ///
    /// **Note:** This **MUST** be called after each event has been handled.
    pub fn next_event(&self) -> Option<Event> {
        match self.ptr.next_event() {
            None => None,
            Some(e) => Some(e.into()),
        }
    }
    /// Returns the next event in the event queue.
    ///
    /// Will block the current thread until the next event is available.
    ///
    /// **Note:** this will always return the same event until handling is confirmed via `node.eventHandled()`.
    ///
    pub fn wait_next_event(&self) -> Event {
        self.ptr.wait_next_event().into()
    }
    /// Returns our own node id
    pub fn node_id(&self) -> PublicKey {
        self.ptr.node_id().into()
    }

    /// Returns our own listening address.
    pub fn listening_addresses(&self) -> Option<Vec<SocketAddress>> {
        self.ptr.listening_addresses().map(|vec_socket_addr| {
            vec_socket_addr
                .into_iter()
                .map(|socket_addr| socket_addr.into())
                .collect()
        })
    }

    /// Retrieve a new on-chain/funding address.
    pub fn new_onchain_address(&self) -> anyhow::Result<Address, NodeBaseError> {
        self.ptr
            .new_onchain_address()
            .map_err(|e| e.into())
            .map(|e| e.into())
    }
    /// Retrieve the currently spendable on-chain balance in satoshis.

    /// Retrieves an overview of all known balances.
    pub fn list_balances(&self) -> anyhow::Result<BalanceDetails, NodeBaseError> {
        Ok(self.ptr.list_balances().into())
    }
    /// Send an on-chain payment to the given address.
    pub fn send_to_onchain_address(
        &self,
        address: Address,
        amount_sats: u64,
    ) -> anyhow::Result<Txid, NodeBaseError> {
        self.ptr
            .send_to_onchain_address(&address.into(), amount_sats)
            .map_err(|e| e.into())
            .map(|e| Txid {
                hash: e.to_string(),
            })
    }

    /// Send an on-chain payment to the given address, draining all the available funds.
    pub fn send_all_to_onchain_address(
        &self,
        address: Address,
    ) -> anyhow::Result<Txid, NodeBaseError> {
        self.ptr
            .send_all_to_onchain_address(&address.into())
            .map_err(|e| e.into())
            .map(|e| e.into())
    }

    ///Retrieve a list of known channels.
    ///
    pub fn list_channels(&self) -> Vec<ChannelDetails> {
        self.ptr.list_channels().iter().map(|x| x.into()).collect()
    }
    /// Connect to a node on the peer-to-peer network.
    ///
    /// If `permanently` is set to `true`, we'll remember the peer and reconnect to it on restart.
    pub fn connect(
        &self,
        node_id: PublicKey,
        address: SocketAddress,
        persist: bool,
    ) -> anyhow::Result<(), NodeBaseError> {
        self.ptr
            .connect(node_id.into(), address.into(), persist)
            .map_err(|e| e.into())
    }

    /// Disconnects the peer with the given node id.
    ///
    /// Will also remove the peer from the peer store, i.e., after this has been called we won't
    /// try to reconnect on restart.
    pub fn disconnect(&self, counterparty_node_id: PublicKey) -> anyhow::Result<(), NodeBaseError> {
        self.ptr
            .disconnect(counterparty_node_id.into())
            .map_err(|e| e.into())
    }

    /// Connect to a node and open a new channel. Disconnects and re-connects are handled automatically
    ///
    /// Disconnects and reconnects are handled automatically.
    ///
    /// If `pushToCounterpartyMsat` is set, the given value will be pushed (read: sent) to the
    /// channel counterparty on channel open. This can be useful to start out with the balance not
    /// entirely shifted to one side, therefore allowing to receive payments from the getgo.
    ///
    /// Returns a temporary channel id.
    pub fn connect_open_channel(
        &self,
        address: SocketAddress,
        node_id: PublicKey,
        channel_amount_sats: u64,
        push_to_counterparty_msat: Option<u64>,
        announce_channel: bool,
        channel_config: Option<ChannelConfig>,
    ) -> Result<UserChannelId, NodeBaseError> {
        self.ptr
            .connect_open_channel(
                node_id.into(),
                address.into(),
                channel_amount_sats,
                push_to_counterparty_msat,
                channel_config.map(|x| Arc::new(x.into())),
                announce_channel,
            )
            .map_err(|e| e.into())
            .map(|e| e.into())
    }

    ///Sync the LDK and BDK wallets with the current chain state.
    // Note that the wallets will be also synced regularly in the background
    pub fn sync_wallets(&self) -> anyhow::Result<(), NodeBaseError> {
        self.ptr.sync_wallets().map_err(|e| e.into())
    }
    /// Close a previously opened channel.
    pub fn close_channel(
        &self,
        user_channel_id: UserChannelId,
        counterparty_node_id: PublicKey,
    ) -> anyhow::Result<(), NodeBaseError> {
        self.ptr
            .close_channel(&user_channel_id.into(), counterparty_node_id.into())
            .map_err(|e| e.into())
    }
    ///Update the config for a previously opened channel.
    ///
    pub fn update_channel_config(
        &self,
        user_channel_id: UserChannelId,
        counterparty_node_id: PublicKey,
        channel_config: ChannelConfig,
    ) -> anyhow::Result<(), NodeBaseError> {
        self.ptr
            .update_channel_config(
                &user_channel_id.into(),
                counterparty_node_id.into(),
                Arc::new(channel_config.into()),
            )
            .map_err(|e| e.into())
    }
    /// Send a payment given an invoice.
    pub fn send_payment(
        &self,
        invoice: Bolt11Invoice,
    ) -> anyhow::Result<PaymentHash, NodeBaseError> {
        self.ptr
            .send_payment(&invoice.into())
            .map_err(|e| e.into())
            .map(|e| e.into())
    }

    /// Send a payment given an invoice and an amount in millisatoshi.
    ///
    /// This will fail if the amount given is less than the value required by the given invoice.
    ///
    /// This can be used to pay a so-called "zero-amount" invoice, i.e., an invoice that leaves the
    /// amount paid to be determined by the user.
    pub fn send_payment_using_amount(
        &self,
        invoice: Bolt11Invoice,
        amount_msat: u64,
    ) -> anyhow::Result<PaymentHash, NodeBaseError> {
        self.ptr
            .send_payment_using_amount(&invoice.into(), amount_msat)
            .map_err(|e| e.into())
            .map(|e| e.into())
    }

    /// Send a spontaneous, aka. "keysend", payment
    pub fn send_spontaneous_payment(
        &self,
        amount_msat: u64,
        node_id: PublicKey,
    ) -> anyhow::Result<PaymentHash, NodeBaseError> {
        self.ptr
            .send_spontaneous_payment(amount_msat, node_id.into())
            .map_err(|e| e.into())
            .map(|e| e.into())
    }

    ///Sends payment probes over all paths of a route that would be used to pay the given invoice.
    /// This may be used to send "pre-flight" probes, i.e., to train our scorer before conducting the actual payment.
    /// Note this is only useful if there likely is sufficient time for the probe to settle before sending out the actual payment,
    /// e.g., when waiting for user confirmation in a wallet UI.
    /// Otherwise, there is a chance the probe could take up some liquidity needed to complete the actual payment.
    /// Users should therefore be cautious and might avoid sending probes if liquidity is scarce and/or they don't expect the probe to return before they send the payment.
    /// To mitigate this issue, channels with available liquidity less than the required amount times Config::probing_liquidity_limit_multiplier won't be used to send pre-flight probes.
    pub fn send_payment_probes(&self, invoice: Bolt11Invoice) -> anyhow::Result<(), NodeBaseError> {
        self.ptr
            .send_payment_probes(&invoice.into())
            .map_err(|e| e.into())
    }

    ///Sends payment probes over all paths of a route that would be used to pay the given amount to the given node_id.
    pub fn send_spontaneous_payment_probes(
        &self,
        amount_msat: u64,
        node_id: PublicKey,
    ) -> anyhow::Result<(), NodeBaseError> {
        self.ptr
            .send_spontaneous_payment_probes(amount_msat, node_id.into())
            .map_err(|e| e.into())
    }

    /// Sends payment probes over all paths of a route that would be used to pay the given
    /// zero-value invoice using the given amount.
    ///
    /// This can be used to send pre-flight probes for a so-called "zero-amount" invoice, i.e., an
    /// invoice that leaves the amount paid to be determined by the user.
    ///
    pub fn send_payment_probes_using_amount(
        &self,
        invoice: Bolt11Invoice,
        amount_msat: u64,
    ) -> Result<(), NodeBaseError> {
        self.ptr
            .send_payment_probes_using_amount(&(invoice.into()), amount_msat)
            .map_err(|e| e.into())
    }
    /// Returns a payable invoice that can be used to request and receive a payment of the amount
    /// given.
    pub fn receive_payment(
        &self,
        amount_msat: u64,
        description: String,
        expiry_secs: u32,
    ) -> anyhow::Result<Bolt11Invoice, NodeBaseError> {
        self.ptr
            .receive_payment(amount_msat, description.as_str(), expiry_secs)
            .map_err(|e| e.into())
            .map(|e| e.into())
    }
    /// Returns a payable invoice that can be used to request and receive a payment for which the
    /// amount is to be determined by the user, also known as a "zero-amount" invoice.
    pub fn receive_variable_amount_payment(
        &self,
        description: String,
        expiry_secs: u32,
    ) -> anyhow::Result<Bolt11Invoice, NodeBaseError> {
        self.ptr
            .receive_variable_amount_payment(description.as_str(), expiry_secs)
            .map_err(|e| e.into())
            .map(|e| Bolt11Invoice {
                signed_raw_invoice: e.to_string(),
            })
    }

    /// Retrieve the details of a specific payment with the given hash.
    ///
    /// Returns `PaymentDetails` if the payment was known and `null` otherwise.
    pub fn payment(&self, payment_hash: PaymentHash) -> Option<PaymentDetails> {
        match self.ptr.payment(&(payment_hash.into())) {
            None => None,
            Some(e) => Some(e.into()),
        }
    }

    /// Remove the payment with the given hash from the store.
    ///
    pub fn remove_payment(&self, payment_hash: PaymentHash) -> anyhow::Result<(), NodeBaseError> {
        self.ptr
            .remove_payment(&(payment_hash.into()))
            .map_err(|e| e.into())
    }

    /// Retrieves all payments that match the given predicate.
    ///
    pub fn list_payments_with_filter(
        &self,
        payment_direction: PaymentDirection,
    ) -> Vec<PaymentDetails> {
        self.ptr
            .list_payments_with_filter(|p| p.direction == payment_direction.into())
            .iter()
            .map(|x| x.to_owned().into())
            .collect()
    }
    /// Retrieves all payments.
    pub fn list_payments(&self) -> Vec<PaymentDetails> {
        self.ptr
            .list_payments()
            .iter()
            .map(|x| x.to_owned().into())
            .collect()
    }
    /// Retrieves a list of known peers.
    pub fn list_peers(&self) -> Vec<PeerDetails> {
        self.ptr
            .list_peers()
            .iter()
            .map(|x| x.to_owned().into())
            .collect()
    }
    /// Creates a digital ECDSA signature of a message with the node's secret key.
    ///
    /// A receiver knowing the corresponding `PublicKey` (e.g. the node’s id) and the message
    /// can be sure that the signature was generated by the caller.
    /// Signatures are EC recoverable, meaning that given the message and the
    /// signature the PublicKey of the signer can be extracted.
    pub fn sign_message(&self, msg: Vec<u8>) -> anyhow::Result<String, NodeBaseError> {
        self.ptr.sign_message(msg.as_slice()).map_err(|e| e.into())
    }

    /// Verifies that the given ECDSA signature was created for the given message with the
    /// secret key corresponding to the given public key.
    pub fn verify_signature(
        &self,
        msg: Vec<u8>,
        sig: String,
        pkey: PublicKey,
    ) -> anyhow::Result<bool, NodeBaseError> {
        Ok(self
            .ptr
            .verify_signature(msg.as_slice(), sig.as_str(), &pkey.into()))
    }
}
