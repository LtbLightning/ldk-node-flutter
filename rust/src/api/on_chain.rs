use crate::api::types::{Address, Txid};
use crate::frb_generated::RustOpaque;
use crate::utils::error::LdkNodeError;

pub struct LdkOnChainPayment {
    pub ptr: RustOpaque<ldk_node::payment::OnchainPayment>,
}
impl From<ldk_node::payment::OnchainPayment> for LdkOnChainPayment {
    fn from(value: ldk_node::payment::OnchainPayment) -> Self {
        LdkOnChainPayment {
            ptr: RustOpaque::new(value),
        }
    }
}

impl LdkOnChainPayment {
    pub fn new_address(&self) -> Result<Address, LdkNodeError> {
        self.ptr
            .new_address()
            .map_err(|e| e.into())
            .map(|e| e.into())
    }
    pub fn send_to_address(
        &self,
        address: Address,
        amount_sats: u64,
    ) -> Result<Txid, LdkNodeError> {
        self.ptr
            .send_to_address(&(address.try_into()?), amount_sats)
            .map_err(|e| e.into())
            .map(|e| e.into())
    }
    pub fn send_all_to_address(&self, address: Address) -> Result<Txid, LdkNodeError> {
        self.ptr
            .send_all_to_address(&(address.try_into()?))
            .map_err(|e| e.into())
            .map(|e| e.into())
    }
}
