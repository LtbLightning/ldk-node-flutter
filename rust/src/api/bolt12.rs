use crate::api::types::{PaymentId, RouteParametersConfig};
use ldk_node::lightning::util::ser::{Readable, Writeable};
use std::str::FromStr;

use crate::frb_generated::RustOpaque;
use crate::utils::error::FfiNodeError;

pub struct FfiBolt12Payment {
    pub opaque: RustOpaque<ldk_node::payment::Bolt12Payment>,
}
impl From<ldk_node::payment::Bolt12Payment> for FfiBolt12Payment {
    fn from(value: ldk_node::payment::Bolt12Payment) -> Self {
        FfiBolt12Payment {
            opaque: RustOpaque::new(value),
        }
    }
}
impl FfiBolt12Payment {
    pub fn send_unsafe(
        &self,
        offer: Offer,
        quantity: Option<u64>,
        payer_note: Option<String>,
        route_params: Option<RouteParametersConfig>,
    ) -> Result<PaymentId, FfiNodeError> {
        self.opaque
            .send(&offer.try_into()?, quantity, payer_note, route_params.map(|e| e.into()))
            .map_err(|e| e.into())
            .map(|e| e.into())
    }
    
    pub fn send_using_amount_unsafe(
        &self,
        offer: Offer,
        amount_msat: u64,
        quantity: Option<u64>,
        payer_note: Option<String>,
        route_params: Option<RouteParametersConfig>,
    ) -> anyhow::Result<PaymentId, FfiNodeError> {
        self.opaque
            .send_using_amount(&offer.try_into()?, amount_msat, quantity, payer_note, route_params.map(|e| e.into()))
            .map_err(|e| e.into())
            .map(|e| e.into())
    }
    
    pub fn receive_unsafe(
        &self,
        amount_msat: u64,
        description: String,
        expiry_secs: Option<u32>,
        quantity: Option<u64>,
    ) -> anyhow::Result<Offer, FfiNodeError> {
        self.opaque
            .receive(amount_msat, description.as_str(), expiry_secs, quantity)
            .map_err(|e| e.into())
            .map(|e| e.into())
    }
    pub fn receive_variable_amount_unsafe(
        &self,
        description: String,
        expiry_secs: Option<u32>,
    ) -> anyhow::Result<Offer, FfiNodeError> {
        self.opaque
            .receive_variable_amount(description.as_str(), expiry_secs)
            .map_err(|e| e.into())
            .map(|e| e.into())
    }

    pub fn request_refund_payment_unsafe(
        &self,
        refund: Refund,
    ) -> anyhow::Result<Bolt12Invoice, FfiNodeError> {
        self.opaque
            .request_refund_payment(&refund.try_into()?)
            .map_err(|e| e.into())
            .map(|e| e.into())
    }

    pub fn initiate_refund_unsafe(
        &self,
        amount_msat: u64,
        expiry_secs: u32,
        quantity: Option<u64>,
        payer_note: Option<String>,
        route_params: Option<RouteParametersConfig>,
    ) -> anyhow::Result<Refund, FfiNodeError> {
        self.opaque
            .initiate_refund(amount_msat, expiry_secs, quantity, payer_note, route_params.map(|e| e.into()))
            .map_err(|e| e.into())
            .map(|e| e.into())
    }

    pub fn receive_async_unsafe(&self) -> anyhow::Result<Offer, FfiNodeError> {
        self.opaque
            .receive_async()
            .map_err(|e| e.into())
            .map(|e| e.into())
    }

    pub fn set_paths_to_static_invoice_server_unsafe(
        &self,
        paths: Vec<BlindedMessagePath>,
    ) -> anyhow::Result<(), FfiNodeError> {
        let native_paths: Result<Vec<_>, _> = paths.into_iter()
            .map(|p| p.try_into())
            .collect();
        
        self.opaque
            .set_paths_to_static_invoice_server(native_paths?)
            .map_err(|e| e.into())
    }

    pub fn blinded_paths_for_async_recipient_unsafe(
        &self,
        recipient_id: Vec<u8>,
    ) -> anyhow::Result<Vec<BlindedMessagePath>, FfiNodeError> {
        self.opaque
            .blinded_paths_for_async_recipient(recipient_id)
            .map_err(|e| e.into())
            .map(|paths| paths.into_iter().map(|p| p.into()).collect())
    }

}
/// An `Offer` is a potentially long-lived proposal for payment of a good or service.
///
/// An offer is a precursor to an [InvoiceRequest]. A merchant publishes an offer from which a
/// customer may request an [Bolt12Invoice] for a specific quantity and using an amount sufficient
/// to cover that quantity (i.e., at least `quantity * amount`).
///
/// Offers may be denominated in currency other than bitcoin but are ultimately paid using the
/// latter.
///

pub struct Offer {
    pub s: String,
}
impl TryFrom<Offer> for ldk_node::lightning::offers::offer::Offer {
    type Error = FfiNodeError;

    fn try_from(value: Offer) -> Result<Self, Self::Error> {
        ldk_node::lightning::offers::offer::Offer::from_str(value.s.as_str()).map_err(|e| e.into())
    }
}
impl From<ldk_node::lightning::offers::offer::Offer> for Offer {
    fn from(value: ldk_node::lightning::offers::offer::Offer) -> Self {
        Offer {
            s: value.to_string(),
        }
    }
}
///A Refund is a request to send an `Bolt12Invoice` without a preceding `Offer`.
//
// Typically, after an invoice is paid, the recipient may publish a refund allowing the sender to recoup their funds.
// A refund may be used more generally as an “offer for money”, such as with a bitcoin ATM.
pub struct Refund {
    pub s: String,
}

impl TryFrom<Refund> for ldk_node::lightning::offers::refund::Refund {
    type Error = FfiNodeError;

    fn try_from(value: Refund) -> Result<Self, Self::Error> {
        ldk_node::lightning::offers::refund::Refund::from_str(value.s.as_str())
            .map_err(|e| e.into())
    }
}
impl From<ldk_node::lightning::offers::refund::Refund> for Refund {
    fn from(value: ldk_node::lightning::offers::refund::Refund) -> Self {
        Refund {
            s: value.to_string(),
        }
    }
}

#[derive(Debug, Clone, PartialEq, Eq)]
///A Bolt12Invoice is a payment request, typically corresponding to an Offer or a Refund.
// An invoice may be sent in response to an InvoiceRequest in the case of an offer or sent directly after scanning a refund. It includes all the information needed to pay a recipient.
pub struct Bolt12Invoice {
    pub data: Vec<u8>,
}

impl TryFrom<Bolt12Invoice> for ldk_node::lightning::offers::invoice::Bolt12Invoice {
    type Error = FfiNodeError;

    fn try_from(value: Bolt12Invoice) -> Result<Self, Self::Error> {
        ldk_node::lightning::offers::invoice::Bolt12Invoice::try_from(value.data)
            .map_err(|_| FfiNodeError::InvalidInvoice)
    }
}
impl From<ldk_node::lightning::offers::invoice::Bolt12Invoice> for Bolt12Invoice {
    fn from(value: ldk_node::lightning::offers::invoice::Bolt12Invoice) -> Self {
        Bolt12Invoice {
            data: value.encode(),
        }
    }
}

#[derive(Debug, Clone, PartialEq, Eq)]
/// A StaticInvoice is a reusable payment request for Async Payments.
pub struct StaticInvoice {
    pub data: Vec<u8>,
}

impl TryFrom<StaticInvoice> for ldk_node::lightning::offers::static_invoice::StaticInvoice {
    type Error = FfiNodeError;

    fn try_from(value: StaticInvoice) -> Result<Self, Self::Error> {
        ldk_node::lightning::offers::static_invoice::StaticInvoice::try_from(value.data)
            .map_err(|_| FfiNodeError::InvalidInvoice)
    }
}

impl From<ldk_node::lightning::offers::static_invoice::StaticInvoice> for StaticInvoice {
    fn from(value: ldk_node::lightning::offers::static_invoice::StaticInvoice) -> Self {
        StaticInvoice {
            data: value.encode(),
        }
    }
}

#[derive(Debug, Clone, PartialEq, Eq)]
/// A BlindedMessagePath for async payments.
pub struct BlindedMessagePath {
    pub data: Vec<u8>,
}

impl TryFrom<BlindedMessagePath> for ldk_node::lightning::blinded_path::message::BlindedMessagePath {
    type Error = FfiNodeError;

    fn try_from(value: BlindedMessagePath) -> Result<Self, Self::Error> {
        <ldk_node::lightning::blinded_path::message::BlindedMessagePath as Readable>::read(&mut &value.data[..])
            .map_err(|_| FfiNodeError::InvalidBlindedPaths)
    }
}

impl From<ldk_node::lightning::blinded_path::message::BlindedMessagePath> for BlindedMessagePath {
    fn from(value: ldk_node::lightning::blinded_path::message::BlindedMessagePath) -> Self {
        let mut bytes = Vec::new();
        value.write(&mut bytes).expect("Failed to serialize BlindedMessagePath");
        BlindedMessagePath { data: bytes }
    }
}
