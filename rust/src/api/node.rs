use crate::api::error::{ BuilderException, NodeException };
use crate::api::types::*;
use crate::frb_generated::RustOpaque;
pub use ldk_node::io::sqlite_store::SqliteStore;
use ldk_node::lightning::util::ser::Writeable;
pub use ldk_node::Node;
use std::str::FromStr;
pub use std::sync::{ Arc, Mutex };
use flutter_rust_bridge::frb;

#[derive(Debug, Clone)]
pub struct LdkMnemonic {
    pub seed_phrase: String,
}

impl TryFrom<LdkMnemonic> for ldk_node::bip39::Mnemonic {
    type Error = BuilderException;

    fn try_from(value: LdkMnemonic) -> Result<Self, Self::Error> {
        ldk_node::bip39::Mnemonic::from_str(&value.seed_phrase).map_err(|e| e.into())
    }
}
impl From<ldk_node::bip39::Mnemonic> for LdkMnemonic {
    fn from(value: ldk_node::bip39::Mnemonic) -> Self {
        LdkMnemonic {
            seed_phrase: value.to_string(),
        }
    }
}
impl LdkMnemonic {
    pub fn generate() -> LdkMnemonic {
        ldk_node::generate_entropy_mnemonic().into()
    }
}

 #[frb(opaque)]
pub struct NodeBuilder {
    pub builder: RustOpaque<ldk_node::Builder>
}

impl NodeBuilder {
    pub fn create_builder(
        config: Config,
        chain_data_source_config: Option<ChainDataSourceConfig>,
        entropy_source_config: Option<EntropySourceConfig>,
        gossip_source_config: Option<GossipSourceConfig>,
        liquidity_source_config: Option<LiquiditySourceConfig>,
    ) -> Result<NodeBuilder, BuilderException> {
        let mut builder = ldk_node::Builder::from_config(config.try_into()?);
        if let Some(source) = entropy_source_config {
            match source {
                EntropySourceConfig::SeedFile(e) => builder.set_entropy_seed_path(e),
                EntropySourceConfig::SeedBytes(e) => builder.set_entropy_seed_bytes(e.encode())?,
                EntropySourceConfig::Bip39Mnemonic {
                    mnemonic,
                    passphrase,
                } => builder.set_entropy_bip39_mnemonic(<LdkMnemonic as TryInto< ldk_node::bip39::Mnemonic>>::try_into(mnemonic)?, passphrase),
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
                liquidity.lsps2_service.0.try_into()?,
                liquidity.lsps2_service.1.try_into().map_err(|_| BuilderException::InvalidPublicKey)?,
                liquidity.lsps2_service.2,
            );
        }
        Ok(NodeBuilder { builder: RustOpaque::new(builder) })
    }
    pub fn build(
        self
    ) -> anyhow::Result<LdkNode, BuilderException> {

        match self.builder.build() {
            Ok(e) => Ok(LdkNode {
                ptr: RustOpaque::new(e),
            }),
            Err(e) => Err(e.into()),
        }
    }
    pub fn build_with_fs_store(
        self
    ) -> anyhow::Result<LdkNode,BuilderException> {

        match self.builder.build_with_fs_store() {
            Ok(e) => Ok(LdkNode {
                ptr: RustOpaque::new(e),
            }),
            Err(e) => Err(e.into()),
        }
    }
// fn build_with_store(
//     self
// ) -> anyhow::Result<LdkNode,BuilderException> {
//     match self.builder.build_with_store(Arc::new(())) {
//         Ok(e) => Ok(LdkNode {
//             ptr: RustOpaque::new(e),
//         }),
//         Err(e) => Err(e.into()),
//     }
// }
}
    // pub fn build_with_vss_store(
    //     self, url: String, store_id: String
    // ) -> anyhow::Result<LdkNode, LdkBuilderError> {
    //     match self.builder.build_with_vss_store(url, store_id) {
    //         Ok(e) => Ok(LdkNode {
    //             ptr: RustOpaque::new(e),
    //         }),
    //         Err(e) => Err(e.into()),
    //     }
    // }



pub struct LdkNode {
    pub ptr: RustOpaque<Node>,
}
impl LdkNode {
    pub fn start(&self) -> anyhow::Result<(), NodeException> {
        self.ptr.start().map_err(|e| e.into())
    }

    pub fn stop(&self) -> anyhow::Result<(), NodeException> {
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

    pub fn wait_next_event(&self) -> Event {
        self.ptr.wait_next_event().into()
    }
    pub async fn next_event_async(&self) -> Event {
        self.ptr.next_event_async().await.into()
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

    pub fn list_balances(&self) -> anyhow::Result<BalanceDetails, NodeException> {
        Ok(self.ptr.list_balances().into())
    }


    pub fn list_channels(&self) -> Vec<ChannelDetails> {
        self.ptr
            .list_channels()
            .iter()
            .map(|x| x.into())
            .collect()
    }

    pub fn connect(
        &self,
        node_id: PublicKey,
        address: SocketAddress,
        persist: bool,
    ) -> anyhow::Result<(), NodeException> {
        self.ptr
            .connect(
                node_id.try_into()?,
                address
                    .try_into()
                    .map_err(|_| NodeException::InvalidAddress)?,
                persist,
            )
            .map_err(|e| e.into())
    }

    pub fn disconnect(&self, counterparty_node_id: PublicKey) -> anyhow::Result<(), NodeException> {
        self.ptr
            .disconnect(counterparty_node_id.try_into()?)
            .map_err(|e| e.into())
    }

    pub fn connect_open_channel(
        &self,
        socket_address: SocketAddress,
        node_id: PublicKey,
        channel_amount_sats: u64,
        push_to_counterparty_msat: Option<u64>,
        announce_channel: bool,
        channel_config: Option<ChannelConfig>,
    ) -> Result<UserChannelId, NodeException> {
        self.ptr
            .connect_open_channel(
                node_id.try_into()?,
                socket_address
                    .try_into()
                    .map_err(|_| NodeException::InvalidAddress)?,
                channel_amount_sats,
                push_to_counterparty_msat,
                channel_config.map(|x| Arc::new(x.into())),
                announce_channel,
            )
            .map_err(|e| e.into())
            .map(|e| e.into())
    }

    pub fn sync_wallets(&self) -> anyhow::Result<(), NodeException> {
        self.ptr.sync_wallets().map_err(|e| e.into())
    }

    pub fn close_channel(
        &self,
        user_channel_id: UserChannelId,
        counterparty_node_id: PublicKey,
    ) -> anyhow::Result<(), NodeException> {
        self.ptr
            .close_channel(&(user_channel_id.try_into()?), counterparty_node_id.try_into()?)
            .map_err(|e| e.into())
    }

    pub fn update_channel_config(
        &self,
        user_channel_id: UserChannelId,
        counterparty_node_id: PublicKey,
        channel_config: ChannelConfig
    ) -> anyhow::Result<(), NodeException> {
        self.ptr
            .update_channel_config(
                &(user_channel_id.try_into()?),
                counterparty_node_id.try_into()?,
                Arc::new(channel_config.into())
            )
            .map_err(|e| e.into())
    }

    pub fn payment(&self, payment_id: PaymentId) -> Option<PaymentDetails> {
        match self.ptr.payment(&(payment_id.into())) {
            None => None,
            Some(e) => Some(e.into()),
        }
    }

    pub fn remove_payment(&self, payment_id: PaymentId) -> Result<(), NodeException> {
        self.ptr.remove_payment(&(payment_id.into())).map_err(|e| e.into())
    }

    pub fn list_payments_with_filter(
        &self,
        payment_direction: PaymentDirection
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

    pub fn sign_message(&self, msg: Vec<u8>) -> anyhow::Result<String, NodeException> {
        self.ptr.sign_message(msg.as_slice()).map_err(|e| e.into())
    }
    pub fn bolt11_payment(ptr: Self) -> LdkBolt11Payment {
        ptr.ptr.bolt11_payment().into()
    }
    pub fn on_chain_payment(ptr: Self) -> LdkOnChainPayment {
        ptr.ptr.onchain_payment().into()
    }
    pub fn spontaneous_payment(ptr: Self) -> LdkSpontaneousPayment {
        ptr.ptr.spontaneous_payment().into()
    }

    pub fn verify_signature(
        &self,
        msg: Vec<u8>,
        sig: String,
        public_key: PublicKey
    ) -> anyhow::Result<bool, NodeException> {
        Ok(self.ptr.verify_signature(msg.as_slice(), sig.as_str(), &public_key.try_into()?))
    }
}
pub struct LdkSpontaneousPayment {
    pub ptr:RustOpaque<ldk_node::payment::SpontaneousPayment>
}
impl From<ldk_node::payment::SpontaneousPayment> for LdkSpontaneousPayment {
    fn from(value: ldk_node::payment::SpontaneousPayment) -> Self {
        Self{ptr:RustOpaque::new(value)}
    }
}
impl LdkSpontaneousPayment {

}
pub struct LdkBolt11Payment {
    pub ptr:RustOpaque<ldk_node::payment::Bolt11Payment>
}
impl From<ldk_node::payment::Bolt11Payment> for LdkBolt11Payment {
    fn from(value: ldk_node::payment::Bolt11Payment) -> Self {
        LdkBolt11Payment {ptr:RustOpaque::new(value)}
    }
}


impl LdkBolt11Payment {
    pub fn receive(
        &self,
        amount_msat: u64,
        description: String,
        expiry_secs: u32,
    ) -> anyhow::Result<Bolt11Invoice, NodeException> {
        self.ptr
            .receive(amount_msat, description.as_str(), expiry_secs)
            .map_err(|e| e.into())
            .map(|e| e.into())
    }
    pub fn receive_variable_amount(
        &self,
        description: String,
        expiry_secs: u32,
    ) -> anyhow::Result<Bolt11Invoice, NodeException> {
        self.ptr
            .receive_variable_amount
            (description.as_str(), expiry_secs)
            .map_err(|e| e.into())
            .map(|e| e.into())
    }
    pub fn receive_variable_amount_via_jit_channel(
        &self,
        description: String,
        expiry_secs: u32,
        max_proportional_lsp_fee_limit_ppm_msat: Option<u64>,
    ) -> anyhow::Result<Bolt11Invoice, NodeException> {
        match self.ptr.receive_variable_amount_via_jit_channel(
            description.as_str(),
            expiry_secs,
            max_proportional_lsp_fee_limit_ppm_msat,
        ) {
            Ok(e) => Ok(e.into()),
            Err(e) => Err(e.into()),
        }
    }

    pub fn receive_via_jit_channel(
        &self,
        amount_msat: u64,
        description: String,
        expiry_secs: u32,
        max_total_lsp_fee_limit_msat: Option<u64>,
    ) -> anyhow::Result<Bolt11Invoice, NodeException> {
        match self.ptr.receive_via_jit_channel(
            amount_msat,
            description.as_str(),
            expiry_secs,
            max_total_lsp_fee_limit_msat,
        ) {
            Ok(e) => Ok(e.into()),
            Err(e) => Err(e.into()),
        }
    }


    pub fn send_probes(&self, invoice: Bolt11Invoice) -> anyhow::Result<(), NodeException> {
        self.ptr
            .send_probes(&(invoice.try_into()?))
            .map_err(|e| e.into())
    }


    pub fn send_probes_using_amount(
        &self,
        invoice: Bolt11Invoice,
        amount_msat: u64,
    ) -> Result<(), NodeException> {
        self.ptr
            .send_probes_using_amount(&(invoice.try_into()?), amount_msat)
            .map_err(|e| e.into())
    }

    pub fn send(&self, invoice: Bolt11Invoice) -> Result<PaymentId, NodeException> {
        self.ptr.send(&(invoice.try_into()?)).map_err(|e| e.into()).map(|e| e.into())
    }
    pub fn send_using_amount(
        &self,
        invoice: Bolt11Invoice,
        amount_msat: u64,
    ) -> anyhow::Result<PaymentId, NodeException> {
        self.ptr
            .send_using_amount(&(invoice.try_into()?), amount_msat)
            .map_err(|e| e.into())
            .map(|e| e.into())
    }
}
pub struct LdkOnChainPayment {
    pub ptr:RustOpaque<ldk_node::payment::OnchainPayment>
}
impl From<ldk_node::payment::OnchainPayment> for LdkOnChainPayment {
    fn from(value: ldk_node::payment::OnchainPayment) -> Self {
        LdkOnChainPayment {ptr:RustOpaque::new(value)}
    }
}

impl LdkOnChainPayment {
    pub fn new_address(&self) -> Result<Address, NodeException> {
        self.ptr.new_address().map_err(|e| e.into()).map(|e| e.into())
    }
    pub fn send_to_address(
        &self, address: Address, amount_sats: u64,
    ) -> Result<Txid, NodeException> {
        self.ptr.send_to_address(&(address.try_into()?), amount_sats).map_err(|e| e.into()).map(|e| e.into())
    }
    pub fn send_all_to_address(
        &self, address: Address,
    ) -> Result<Txid, NodeException> {
        self.ptr.send_all_to_address(&(address.try_into()?)).map_err(|e| e.into()).map(|e| e.into())
    }


}