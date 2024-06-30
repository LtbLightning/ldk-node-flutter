use crate::api::types::{PaymentId, PublicKey};
use crate::frb_generated::RustOpaque;
use crate::utils::error::LdkNodeError;

pub struct LdkSpontaneousPayment {
    pub ptr: RustOpaque<ldk_node::payment::SpontaneousPayment>,
}
impl From<ldk_node::payment::SpontaneousPayment> for LdkSpontaneousPayment {
    fn from(value: ldk_node::payment::SpontaneousPayment) -> Self {
        Self {
            ptr: RustOpaque::new(value),
        }
    }
}
impl LdkSpontaneousPayment {
    pub fn send(&self, amount_msat: u64, node_id: PublicKey) -> Result<PaymentId, LdkNodeError> {
        self.ptr
            .send(amount_msat, node_id.try_into()?)
            .map_err(|e| e.into())
            .map(|e| e.into())
    }
    pub fn send_probes(&self, amount_msat: u64, node_id: PublicKey) -> Result<(), LdkNodeError> {
        self.ptr
            .send_probes(amount_msat, node_id.try_into()?)
            .map_err(|e| e.into())
            .map(|e| e.into())
    }
}
