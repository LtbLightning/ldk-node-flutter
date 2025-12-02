use crate::api::types::{PaymentHash, PaymentId, PaymentPreimage};
use crate::frb_generated::RustOpaque;
use crate::utils::error::FfiNodeError;
use ldk_node::bitcoin::hashes::{sha256, Hash};
use ldk_node::lightning_invoice::{Bolt11InvoiceDescription, Description};
use std::str::FromStr;

use super::types::SendingParameters;

pub struct FfiBolt11Payment {
    pub opaque: RustOpaque<ldk_node::payment::Bolt11Payment>,
}
impl From<ldk_node::payment::Bolt11Payment> for FfiBolt11Payment {
    fn from(value: ldk_node::payment::Bolt11Payment) -> Self {
        FfiBolt11Payment {
            opaque: RustOpaque::new(value),
        }
    }
}
#[derive(Debug, Clone, PartialEq, Eq)]
///Represents a syntactically and semantically correct lightning BOLT11 invoice.
///
pub struct Bolt11Invoice {
    pub signed_raw_invoice: String,
}

impl TryFrom<Bolt11Invoice> for ldk_node::lightning_invoice::Bolt11Invoice {
    type Error = FfiNodeError;

    fn try_from(value: Bolt11Invoice) -> Result<Self, Self::Error> {
        ldk_node::lightning_invoice::Bolt11Invoice::from_str(value.signed_raw_invoice.as_str())
            .map_err(|_| FfiNodeError::InvalidInvoice)
    }
}
impl From<ldk_node::lightning_invoice::Bolt11Invoice> for Bolt11Invoice {
    fn from(value: ldk_node::lightning_invoice::Bolt11Invoice) -> Self {
        Bolt11Invoice {
            signed_raw_invoice: value.to_string(),
        }
    }
}

impl FfiBolt11Payment {
    pub fn send(
        &self,
        invoice: Bolt11Invoice,
        sending_parameters: Option<SendingParameters>,
    ) -> Result<PaymentId, FfiNodeError> {
        self.opaque
            .send(&invoice.try_into()?, sending_parameters.map(|e| e.into()))
            .map_err(|e| e.into())
            .map(|e| e.into())
    }
    pub fn send_using_amount(
        &self,
        invoice: Bolt11Invoice,
        amount_msat: u64,
        sending_parameters: Option<SendingParameters>,
    ) -> anyhow::Result<PaymentId, FfiNodeError> {
        self.opaque
            .send_using_amount(
                &invoice.try_into()?,
                amount_msat,
                sending_parameters.map(|e| e.into()),
            )
            .map_err(|e| e.into())
            .map(|e| e.into())
    }

    pub fn send_probes(&self, invoice: Bolt11Invoice) -> anyhow::Result<(), FfiNodeError> {
        self.opaque
            .send_probes(&invoice.try_into()?)
            .map_err(|e| e.into())
    }

    pub fn send_probes_using_amount(
        &self,
        invoice: Bolt11Invoice,
        amount_msat: u64,
    ) -> Result<(), FfiNodeError> {
        self.opaque
            .send_probes_using_amount(&invoice.try_into()?, amount_msat)
            .map_err(|e: ldk_node::NodeError| e.into())
    }
    pub fn claim_for_hash(
        &self,
        payment_hash: PaymentHash,
        claimable_amount_msat: u64,
        preimage: PaymentPreimage,
    ) -> anyhow::Result<(), FfiNodeError> {
        self.opaque
            .claim_for_hash(payment_hash.into(), claimable_amount_msat, preimage.into())
            .map_err(|e| e.into())
    }
    pub fn fail_for_hash(&self, payment_hash: PaymentHash) -> anyhow::Result<(), FfiNodeError> {
        self.opaque
            .fail_for_hash(payment_hash.into())
            .map_err(|e| e.into())
    }
    pub fn receive(
        &self,
        amount_msat: u64,
        description: String,
        expiry_secs: u32,
    ) -> anyhow::Result<Bolt11Invoice, FfiNodeError> {
        let description = Bolt11InvoiceDescription::Direct(
            Description::new(description).map_err(|e| FfiNodeError::from(e))?,
        );
        self.opaque
            .receive(amount_msat, &description, expiry_secs)
            .map_err(|e| e.into())
            .map(|e| e.into())
    }

    pub fn receive_for_hash(
        &self,
        payment_hash: PaymentHash,
        amount_msat: u64,
        description: String,
        expiry_secs: u32,
    ) -> anyhow::Result<Bolt11Invoice, FfiNodeError> {
        let description = Bolt11InvoiceDescription::Direct(
            Description::new(description).map_err(|e| FfiNodeError::from(e))?,
        );
        self.opaque
            .receive_for_hash(amount_msat, &description, expiry_secs, payment_hash.into())
            .map_err(|e| e.into())
            .map(|e| e.into())
    }
    pub fn receive_variable_amount(
        &self,
        description: String,
        expiry_secs: u32,
    ) -> anyhow::Result<Bolt11Invoice, FfiNodeError> {
        let description = Bolt11InvoiceDescription::Direct(
            Description::new(description).map_err(|e| FfiNodeError::from(e))?,
        );
        self.opaque
            .receive_variable_amount(&description, expiry_secs)
            .map_err(|e| e.into())
            .map(|e| e.into())
    }
    pub fn receive_variable_amount_via_jit_channel(
        &self,
        description: String,
        expiry_secs: u32,
        max_proportional_lsp_fee_limit_ppm_msat: Option<u64>,
    ) -> anyhow::Result<Bolt11Invoice, FfiNodeError> {
        let description = Bolt11InvoiceDescription::Direct(
            Description::new(description).map_err(|e| FfiNodeError::from(e))?,
        );
        match self.opaque.receive_variable_amount_via_jit_channel(
            &description,
            expiry_secs,
            max_proportional_lsp_fee_limit_ppm_msat,
        ) {
            Ok(e) => Ok(e.into()),
            Err(e) => Err(e.into()),
        }
    }

    pub fn receive_variable_amount_for_hash(
        &self,
        description: String,
        expiry_secs: u32,
        payment_hash: PaymentHash,
    ) -> anyhow::Result<Bolt11Invoice, FfiNodeError> {
        let description = Bolt11InvoiceDescription::Direct(
            Description::new(description).map_err(|e| FfiNodeError::from(e))?,
        );
        match self.opaque.receive_variable_amount_for_hash(
            &description,
            expiry_secs,
            payment_hash.into(),
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
    ) -> anyhow::Result<Bolt11Invoice, FfiNodeError> {
        let description = Bolt11InvoiceDescription::Direct(
            Description::new(description).map_err(|e| FfiNodeError::from(e))?,
        );
        match self.opaque.receive_via_jit_channel(
            amount_msat,
            &description,
            expiry_secs,
            max_total_lsp_fee_limit_msat,
        ) {
            Ok(e) => Ok(e.into()),
            Err(e) => Err(e.into()),
        }
    }
}
