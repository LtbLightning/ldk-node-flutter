use crate::api::types::{PaymentId, PublicKey};
use crate::frb_generated::RustOpaque;
use crate::utils::error::FfiNodeError;

use super::types::SendingParameters;

pub struct FfiSpontaneousPayment {
    pub opaque: RustOpaque<ldk_node::payment::SpontaneousPayment>,
}
impl From<ldk_node::payment::SpontaneousPayment> for FfiSpontaneousPayment {
    fn from(value: ldk_node::payment::SpontaneousPayment) -> Self {
        Self {
            opaque: RustOpaque::new(value),
        }
    }
}
impl FfiSpontaneousPayment {
    pub fn send(
        &self,
        amount_msat: u64,
        node_id: PublicKey,
        sending_parameters: Option<SendingParameters>,
    ) -> Result<PaymentId, FfiNodeError> {
        self.opaque
            .send(
                amount_msat,
                node_id.try_into()?,
                sending_parameters.map(|e| e.into()),
            )
            .map_err(|e| e.into())
            .map(|e| e.into())
    }
    pub fn send_probes(&self, amount_msat: u64, node_id: PublicKey) -> Result<(), FfiNodeError> {
        self.opaque
            .send_probes(amount_msat, node_id.try_into()?)
            .map_err(|e| e.into())
    }
}
