use crate::api::types::{Bolt11Invoice, PaymentId};
use crate::frb_generated::RustOpaque;
use crate::utils::error::LdkNodeError;

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
    ) -> anyhow::Result<Bolt11Invoice, LdkNodeError> {
        self.ptr
            .receive(amount_msat, description.as_str(), expiry_secs)
            .map_err(|e| e.into())
            .map(|e| e.into())
    }
    pub fn receive_variable_amount(
        &self,
        description: String,
        expiry_secs: u32,
    ) -> anyhow::Result<Bolt11Invoice, LdkNodeError> {
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
    ) -> anyhow::Result<Bolt11Invoice, LdkNodeError> {
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
    ) -> anyhow::Result<Bolt11Invoice, LdkNodeError> {
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


    pub fn send_probes(&self, invoice: Bolt11Invoice) -> anyhow::Result<(), LdkNodeError> {
        self.ptr
            .send_probes(&(invoice.try_into()?))
            .map_err(|e| e.into())
    }


    pub fn send_probes_using_amount(
        &self,
        invoice: Bolt11Invoice,
        amount_msat: u64,
    ) -> Result<(), LdkNodeError> {
        self.ptr
            .send_probes_using_amount(&(invoice.try_into()?), amount_msat)
            .map_err(|e| e.into())
    }

    pub fn send(&self, invoice: Bolt11Invoice) -> Result<PaymentId, LdkNodeError> {
        self.ptr.send(&(invoice.try_into()?)).map_err(|e| e.into()).map(|e| e.into())
    }
    pub fn send_using_amount(
        &self,
        invoice: Bolt11Invoice,
        amount_msat: u64,
    ) -> anyhow::Result<PaymentId, LdkNodeError> {
        self.ptr
            .send_using_amount(&(invoice.try_into()?), amount_msat)
            .map_err(|e| e.into())
            .map(|e| e.into())
    }
}