use crate::api::bolt11::FfiBolt11Payment;
use crate::api::bolt12::FfiBolt12Payment;
use crate::api::graph::FfiNetworkGraph;
use crate::api::on_chain::FfiOnChainPayment;
use crate::api::spontaneous::FfiSpontaneousPayment;
use crate::api::types::*;
use crate::frb_generated::RustOpaque;
use crate::utils::error::FfiNodeError;
pub use ldk_node::io::sqlite_store::SqliteStore;
pub use std::sync::{Arc, Mutex};

use crate::api::unified_qr::FfiUnifiedQrPayment;

pub struct FfiNode {
    pub opaque: RustOpaque<ldk_node::Node>,
}
impl FfiNode {
    pub fn start(&self) -> anyhow::Result<(), FfiNodeError> {
        self.opaque.start().map_err(|e| e.into())
    }

    pub fn stop(&self) -> anyhow::Result<(), FfiNodeError> {
        self.opaque.stop().map_err(|e| e.into())
    }

    pub fn status(&self) -> NodeStatus {
        self.opaque.status().into()
    }
    pub fn config(&self) -> Config {
        self.opaque.config().into()
    }
    pub fn event_handled(&self) -> Result<(), FfiNodeError> {
        self.opaque.event_handled().map_err(|e| e.into())
    }

    pub fn next_event(&self) -> Option<Event> {
        self.opaque.next_event().map(|e| e.into())
    }

    pub fn wait_next_event(&self) -> Event {
        self.opaque.wait_next_event().into()
    }
    pub async fn next_event_async(&self) -> Event {
        self.opaque.next_event_async().await.into()
    }
    pub fn node_id(&self) -> PublicKey {
        self.opaque.node_id().into()
    }

    pub fn listening_addresses(&self) -> Option<Vec<SocketAddress>> {
        self.opaque.listening_addresses().map(|vec_socket_addr| {
            vec_socket_addr
                .into_iter()
                .map(|socket_addr| socket_addr.into())
                .collect()
        })
    }

    pub fn list_balances(&self) -> anyhow::Result<BalanceDetails, FfiNodeError> {
        Ok(self.opaque.list_balances().into())
    }

    pub fn list_channels(&self) -> Vec<ChannelDetails> {
        self.opaque
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
    ) -> anyhow::Result<(), FfiNodeError> {
        self.opaque
            .connect(
                node_id.try_into()?,
                address
                    .try_into()
                    .map_err(|_| FfiNodeError::InvalidAddress)?,
                persist,
            )
            .map_err(|e| e.into())
    }

    pub fn disconnect(&self, counterparty_node_id: PublicKey) -> anyhow::Result<(), FfiNodeError> {
        self.opaque
            .disconnect(counterparty_node_id.try_into()?)
            .map_err(|e| e.into())
    }

    pub fn open_channel(
        &self,
        socket_address: SocketAddress,
        node_id: PublicKey,
        channel_amount_sats: u64,
        push_to_counterparty_msat: Option<u64>,
        channel_config: Option<ChannelConfig>,
    ) -> Result<UserChannelId, FfiNodeError> {
        self.opaque
            .open_channel(
                node_id.try_into()?,
                socket_address
                    .try_into()
                    .map_err(|_| FfiNodeError::InvalidAddress)?,
                channel_amount_sats,
                push_to_counterparty_msat,
                channel_config.map(|x| x.into()),
            )
            .map_err(|e| e.into())
            .map(|e| e.into())
    }

    pub fn sync_wallets(&self) -> anyhow::Result<(), FfiNodeError> {
        self.opaque.sync_wallets().map_err(|e| e.into())
    }

    pub fn open_announced_channel(
        &self,
        socket_address: SocketAddress,
        node_id: PublicKey,
        channel_amount_sats: u64,
        push_to_counterparty_msat: Option<u64>,
        channel_config: Option<ChannelConfig>,
    ) -> Result<UserChannelId, FfiNodeError> {
        self.opaque
            .open_announced_channel(
                node_id.try_into()?,
                socket_address
                    .try_into()
                    .map_err(|_| FfiNodeError::InvalidAddress)?,
                channel_amount_sats,
                push_to_counterparty_msat,
                channel_config.map(|x| x.into()),
            )
            .map_err(|e| e.into())
            .map(|e| e.into())
    }

    pub fn close_channel(
        &self,
        user_channel_id: UserChannelId,
        counterparty_node_id: PublicKey,
    ) -> anyhow::Result<(), FfiNodeError> {
        self.opaque
            .close_channel(
                &user_channel_id.try_into()?,
                counterparty_node_id.try_into()?,
            )
            .map_err(|e| e.into())
    }

    pub fn force_close_channel(
        &self,
        user_channel_id: UserChannelId,
        counterparty_node_id: PublicKey,
    ) -> anyhow::Result<(), FfiNodeError> {
        self.opaque
            .close_channel(
                &user_channel_id.try_into()?,
                counterparty_node_id.try_into()?,
            )
            .map_err(|e| e.into())
    }

    pub fn update_channel_config(
        &self,
        user_channel_id: UserChannelId,
        counterparty_node_id: PublicKey,
        channel_config: ChannelConfig,
    ) -> anyhow::Result<(), FfiNodeError> {
        self.opaque
            .update_channel_config(
                &user_channel_id.try_into()?,
                counterparty_node_id.try_into()?,
                channel_config.into(),
            )
            .map_err(|e| e.into())
    }

    pub fn payment(&self, payment_id: PaymentId) -> Option<PaymentDetails> {
        self.opaque.payment(&payment_id.into()).map(|e| e.into())
    }

    pub fn remove_payment(&self, payment_id: PaymentId) -> Result<(), FfiNodeError> {
        self.opaque
            .remove_payment(&payment_id.into())
            .map_err(|e| e.into())
    }

    pub fn list_payments_with_filter(
        &self,
        payment_direction: PaymentDirection,
    ) -> Vec<PaymentDetails> {
        self.opaque
            .list_payments_with_filter(|p| p.direction == payment_direction.into())
            .iter()
            .map(|x| x.to_owned().into())
            .collect()
    }

    pub fn list_payments(&self) -> Vec<PaymentDetails> {
        self.opaque
            .list_payments()
            .iter()
            .map(|x| x.to_owned().into())
            .collect()
    }

    pub fn list_peers(&self) -> Vec<PeerDetails> {
        self.opaque
            .list_peers()
            .iter()
            .map(|x| x.to_owned().into())
            .collect()
    }

    pub fn sign_message(&self, msg: Vec<u8>) -> String {
        self.opaque.sign_message(msg.as_slice())
    }
    pub fn network_graph(ptr: Self) -> FfiNetworkGraph {
        ptr.opaque.network_graph().into()
    }
    pub fn bolt11_payment(ptr: Self) -> FfiBolt11Payment {
        ptr.opaque.bolt11_payment().into()
    }
    pub fn on_chain_payment(ptr: Self) -> FfiOnChainPayment {
        ptr.opaque.onchain_payment().into()
    }
    pub fn spontaneous_payment(ptr: Self) -> FfiSpontaneousPayment {
        ptr.opaque.spontaneous_payment().into()
    }
    pub fn bolt12_payment(ptr: Self) -> FfiBolt12Payment {
        ptr.opaque.bolt12_payment().into()
    }
    pub fn unified_qr_payment(ptr: Self) -> FfiUnifiedQrPayment {
        ptr.opaque.unified_qr_payment().into()
    }

    pub fn verify_signature(
        &self,
        msg: Vec<u8>,
        sig: String,
        public_key: PublicKey,
    ) -> anyhow::Result<bool, FfiNodeError> {
        Ok(self
            .opaque
            .verify_signature(msg.as_slice(), sig.as_str(), &public_key.try_into()?))
    }
}
