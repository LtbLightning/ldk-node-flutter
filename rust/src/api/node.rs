use crate::api::error::{BuilderError, NodeBaseError};
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
    liquidity_source_config: Option<LiquiditySourceConfig>,
) -> anyhow::Result<NodeBase, BuilderError> {
    let builder = create_builder(
        config,
        chain_data_source_config,
        entropy_source_config,
        gossip_source_config,
        liquidity_source_config
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
    liquidity_source_config: Option<LiquiditySourceConfig>,
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
    if let Some(liquidity) = liquidity_source_config {
        builder.set_liquidity_source_lsps2(
            liquidity.lsps2_service.0.into(),
            liquidity.lsps2_service.1.into(),
            liquidity.lsps2_service.2,
        );
    }
    Ok(builder)
}

pub struct NodeBase {
    pub ptr: RustOpaque<Node<SqliteStore>>,
}
impl NodeBase {
    pub fn start(&self) -> anyhow::Result<(), NodeBaseError> {
        self.ptr.start().map_err(|e| e.into())
    }

    pub fn stop(&self) -> anyhow::Result<(), NodeBaseError> {
        self.ptr.stop().map_err(|e| e.into())
    }

    pub fn status(&self) -> NodeStatus {
        self.ptr.status().into()
    }

    pub fn config(&self) -> Config {
        self.ptr.config().into()
    }

    pub fn event_handled(&self) {
        self.ptr.event_handled()
    }

    pub fn next_event(&self) -> Option<Event> {
        match self.ptr.next_event() {
            None => None,
            Some(e) => Some(e.into()),
        }
    }

    pub async fn next_event_async(&self) -> Event {
        self.ptr.next_event_async().await.into()
    }

    pub fn wait_next_event(&self) -> Event {
        self.ptr.wait_next_event().into()
    }

    pub fn node_id(&self) -> PublicKey {
        self.ptr.node_id().into()
    }

    pub fn listening_addresses(&self) -> Option<Vec<SocketAddress>> {
        self.ptr.listening_addresses().map(|vec_socket_addr| {
            vec_socket_addr
                .into_iter()
                .map(|socket_addr| socket_addr.into())
                .collect()
        })
    }

    pub fn new_onchain_address(&self) -> anyhow::Result<Address, NodeBaseError> {
        self.ptr
            .new_onchain_address()
            .map_err(|e| e.into())
            .map(|e| e.into())
    }

    pub fn list_balances(&self) -> anyhow::Result<BalanceDetails, NodeBaseError> {
        Ok(self.ptr.list_balances().into())
    }

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

    pub fn send_all_to_onchain_address(
        &self,
        address: Address,
    ) -> anyhow::Result<Txid, NodeBaseError> {
        self.ptr
            .send_all_to_onchain_address(&address.into())
            .map_err(|e| e.into())
            .map(|e| e.into())
    }

    pub fn list_channels(&self) -> Vec<ChannelDetails> {
        self.ptr.list_channels().iter().map(|x| x.into()).collect()
    }

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

    pub fn disconnect(&self, counterparty_node_id: PublicKey) -> anyhow::Result<(), NodeBaseError> {
        self.ptr
            .disconnect(counterparty_node_id.into())
            .map_err(|e| e.into())
    }

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

    pub fn sync_wallets(&self) -> anyhow::Result<(), NodeBaseError> {
        self.ptr.sync_wallets().map_err(|e| e.into())
    }

    pub fn close_channel(
        &self,
        user_channel_id: UserChannelId,
        counterparty_node_id: PublicKey,
    ) -> anyhow::Result<(), NodeBaseError> {
        self.ptr
            .close_channel(&user_channel_id.into(), counterparty_node_id.into())
            .map_err(|e| e.into())
    }

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

    pub fn send_payment(
        &self,
        invoice: Bolt11Invoice,
    ) -> anyhow::Result<PaymentHash, NodeBaseError> {
        self.ptr
            .send_payment(&invoice.into())
            .map_err(|e| e.into())
            .map(|e| e.into())
    }

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

    pub fn send_payment_probes(&self, invoice: Bolt11Invoice) -> anyhow::Result<(), NodeBaseError> {
        self.ptr
            .send_payment_probes(&invoice.into())
            .map_err(|e| e.into())
    }

    pub fn send_spontaneous_payment_probes(
        &self,
        amount_msat: u64,
        node_id: PublicKey,
    ) -> anyhow::Result<(), NodeBaseError> {
        self.ptr
            .send_spontaneous_payment_probes(amount_msat, node_id.into())
            .map_err(|e| e.into())
    }

    pub fn send_payment_probes_using_amount(
        &self,
        invoice: Bolt11Invoice,
        amount_msat: u64,
    ) -> Result<(), NodeBaseError> {
        self.ptr
            .send_payment_probes_using_amount(&(invoice.into()), amount_msat)
            .map_err(|e| e.into())
    }

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

    pub fn receive_variable_amount_payment_via_jit_channel(
        &self,
        description: String,
        expiry_secs: u32,
        max_proportional_lsp_fee_limit_ppm_msat: Option<u64>,
    ) -> anyhow::Result<Bolt11Invoice, NodeBaseError> {
        match self.ptr.receive_variable_amount_payment_via_jit_channel(
            description.as_str(),
            expiry_secs,
            max_proportional_lsp_fee_limit_ppm_msat,
        ) {
            Ok(e) => Ok(e.into()),
            Err(e) => Err(e.into()),
        }
    }

    pub fn receive_payment_via_jit_channel(
        &self,
        amount_msat: u64,
        description: String,
        expiry_secs: u32,
        max_total_lsp_fee_limit_msat: Option<u64>,
    ) -> anyhow::Result<Bolt11Invoice, NodeBaseError> {
        match self.ptr.receive_payment_via_jit_channel(
            amount_msat,
            description.as_str(),
            expiry_secs,
            max_total_lsp_fee_limit_msat,
        ) {
            Ok(e) => Ok(e.into()),
            Err(e) => Err(e.into()),
        }
    }

    pub fn payment(&self, payment_hash: PaymentHash) -> Option<PaymentDetails> {
        match self.ptr.payment(&(payment_hash.into())) {
            None => None,
            Some(e) => Some(e.into()),
        }
    }

    pub fn remove_payment(&self, payment_hash: PaymentHash) -> anyhow::Result<(), NodeBaseError> {
        self.ptr
            .remove_payment(&(payment_hash.into()))
            .map_err(|e| e.into())
    }

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

    pub fn list_payments(&self) -> Vec<PaymentDetails> {
        self.ptr
            .list_payments()
            .iter()
            .map(|x| x.to_owned().into())
            .collect()
    }

    pub fn list_peers(&self) -> Vec<PeerDetails> {
        self.ptr
            .list_peers()
            .iter()
            .map(|x| x.to_owned().into())
            .collect()
    }

    pub fn sign_message(&self, msg: Vec<u8>) -> anyhow::Result<String, NodeBaseError> {
        self.ptr.sign_message(msg.as_slice()).map_err(|e| e.into())
    }

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
