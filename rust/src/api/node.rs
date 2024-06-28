use crate::api::types::*;
use crate::frb_generated::RustOpaque;
pub use ldk_node::io::sqlite_store::SqliteStore;
pub use ldk_node::Node;
pub use std::sync::{ Arc, Mutex };
use crate::api::bolt11::LdkBolt11Payment;
use crate::api::bolt12::LdkBolt12Payment;
use crate::api::graph::LdkNetworkGraph;
use crate::api::on_chain::LdkOnChainPayment;
use crate::api::spontaneous::LdkSpontaneousPayment;
use crate::utils::error::{LdkNodeError};




pub struct LdkNode {
    pub ptr: RustOpaque<Node>,
}
impl LdkNode {
    pub fn start(&self) -> anyhow::Result<(), LdkNodeError> {
        self.ptr.start().map_err(|e| e.into())
    }

    pub fn stop(&self) -> anyhow::Result<(), LdkNodeError> {
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

    pub fn list_balances(&self) -> anyhow::Result<BalanceDetails, LdkNodeError> {
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
    ) -> anyhow::Result<(), LdkNodeError> {
        self.ptr
            .connect(
                node_id.try_into()?,
                address
                    .try_into()
                    .map_err(|_| LdkNodeError::InvalidAddress)?,
                persist,
            )
            .map_err(|e| e.into())
    }

    pub fn disconnect(&self, counterparty_node_id: PublicKey) -> anyhow::Result<(), LdkNodeError> {
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
    ) -> Result<UserChannelId, LdkNodeError> {
        self.ptr
            .connect_open_channel(
                node_id.try_into()?,
                socket_address
                    .try_into()
                    .map_err(|_| LdkNodeError::InvalidAddress)?,
                channel_amount_sats,
                push_to_counterparty_msat,
                channel_config.map(|x| Arc::new(x.into())),
                announce_channel,
            )
            .map_err(|e| e.into())
            .map(|e| e.into())
    }

    pub fn sync_wallets(&self) -> anyhow::Result<(), LdkNodeError> {
        self.ptr.sync_wallets().map_err(|e| e.into())
    }

    pub fn close_channel(
        &self,
        user_channel_id: UserChannelId,
        counterparty_node_id: PublicKey,
    ) -> anyhow::Result<(), LdkNodeError> {
        self.ptr
            .close_channel(&(user_channel_id.try_into()?), counterparty_node_id.try_into()?)
            .map_err(|e| e.into())
    }

    pub fn force_close_channel(
        &self,
        user_channel_id: UserChannelId,
        counterparty_node_id: PublicKey,
    ) -> anyhow::Result<(), LdkNodeError> {
        self.ptr
            .force_close_channel(&(user_channel_id.try_into()?), counterparty_node_id.try_into()?)
            .map_err(|e| e.into())
    }

    pub fn update_channel_config(
        &self,
        user_channel_id: UserChannelId,
        counterparty_node_id: PublicKey,
        channel_config: ChannelConfig
    ) -> anyhow::Result<(), LdkNodeError> {
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

    pub fn remove_payment(&self, payment_id: PaymentId) -> Result<(), LdkNodeError> {
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

    pub fn sign_message(&self, msg: Vec<u8>) -> anyhow::Result<String, LdkNodeError> {
        self.ptr.sign_message(msg.as_slice()).map_err(|e| e.into())
    }
    pub fn network_graph(ptr: Self)-> LdkNetworkGraph {
        ptr.ptr.network_graph().into()
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
    pub fn bolt12_payment(ptr: Self) -> LdkBolt12Payment {
        LdkBolt12Payment{ptr:RustOpaque::new(ptr.ptr.bolt12_payment())}
    }

    pub fn verify_signature(
        &self,
        msg: Vec<u8>,
        sig: String,
        public_key: PublicKey
    ) -> anyhow::Result<bool, LdkNodeError> {
        Ok(self.ptr.verify_signature(msg.as_slice(), sig.as_str(), &public_key.try_into()?))
    }
}

