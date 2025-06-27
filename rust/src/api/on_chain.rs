use crate::api::types::{Address, Txid};
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
    ) -> Result<Txid, FfiNodeError> {
        self.opaque
            .send_to_address(&address.try_into()?, amount_sats)
            .map_err(|e| e.into())
            .map(|e| e.into())
    }
    pub fn send_all_to_address(&self, address: Address) -> Result<Txid, FfiNodeError> {
        self.opaque
            .send_all_to_address(&address.try_into()?)
            .map_err(|e| e.into())
            .map(|e| e.into())
    }
}
