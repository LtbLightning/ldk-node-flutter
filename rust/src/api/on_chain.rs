use crate::api::types::{Address, FeeRate, Txid};
use crate::frb_generated::RustOpaque;
use crate::utils::error::FfiNodeError;

pub struct FfiOnChainPayment {
    pub opaque: RustOpaque<ldk_node::payment::OnchainPayment>,
}
impl From<ldk_node::payment::OnchainPayment> for FfiOnChainPayment {
    fn from(value: ldk_node::payment::OnchainPayment) -> Self {
        FfiOnChainPayment {
            opaque: RustOpaque::new(value),
        }
    }
}

impl FfiOnChainPayment {
    pub fn new_address(&self) -> Result<Address, FfiNodeError> {
        self.opaque
            .new_address()
            .map_err(|e| e.into())
            .map(|e| e.into())
    }
    pub fn send_to_address(
        &self,
        address: Address,
        amount_sats: u64,
        fee_rate: Option<FeeRate>,
    ) -> Result<Txid, FfiNodeError> {
        self.opaque
            .send_to_address(&address.try_into()?, amount_sats, fee_rate.map(|e| e.into()))
            .map_err(|e| e.into())
            .map(|e| e.into())
    }

    /// Please note that if `retain_reserves` is set to `false` this will **not** retain any on-chain reserves, which might be potentially
    /// dangerous if you have open Anchor channels for which you can't trust the counterparty to
    /// spend the Anchor output after channel closure. If `retain_reserves` is set to `true`, this
    /// will try to send all spendable onchain funds, i.e.,
    pub fn send_all_to_address(
        &self,
        address: Address,
        retain_reserves: bool,
        fee_rate: Option<FeeRate>,
    ) -> Result<Txid, FfiNodeError> {
        self.opaque
            .send_all_to_address(&address.try_into()?, retain_reserves, fee_rate.map(|e| e.into()))
            .map_err(|e| e.into())
            .map(|e| e.into())
    }
}
