use std::str::FromStr;
use std::sync::Arc;
use ldk_node::lightning::util::ser::Writeable;
use crate::api::types::{ PaymentId};

use crate::frb_generated::RustOpaque;
use crate::utils::error::LdkNodeError;
/// An `Offer` is a potentially long-lived proposal for payment of a good or service.
///
/// An offer is a precursor to an [InvoiceRequest]. A merchant publishes an offer from which a
/// customer may request an [Bolt12Invoice] for a specific quantity and using an amount sufficient
/// to cover that quantity (i.e., at least `quantity * amount`).
///
/// Offers may be denominated in currency other than bitcoin but are ultimately paid using the
/// latter.
///

pub struct Offer{pub s: String }
impl TryFrom<Offer> for ldk_node::lightning::offers::offer::Offer{
    type Error = LdkNodeError;

    fn try_from(value: Offer) -> Result<Self, Self::Error> {
        ldk_node::lightning::offers::offer::Offer::from_str(value.s.as_str()).map_err(|e| e.into())
    }
}
impl From<ldk_node::lightning::offers::offer::Offer> for Offer{
    fn from(value: ldk_node::lightning::offers::offer::Offer) -> Self {
        Offer{s: value.to_string()}
    }
}
///A Refund is a request to send an `Bolt12Invoice` without a preceding `Offer`.
//
// Typically, after an invoice is paid, the recipient may publish a refund allowing the sender to recoup their funds.
// A refund may be used more generally as an “offer for money”, such as with a bitcoin ATM.

pub struct Refund{pub s: String }

impl TryFrom<Refund> for ldk_node::lightning::offers::refund::Refund{
    type Error = LdkNodeError;

    fn try_from(value: Refund) -> Result<Self, Self::Error> {
        ldk_node::lightning::offers::refund::Refund::from_str(value.s.as_str()).map_err(|e| e.into())
    }
}
impl From<ldk_node::lightning::offers::refund::Refund> for Refund{
    fn from(value: ldk_node::lightning::offers::refund::Refund) -> Self {
        Refund{s: value.to_string()}
    }
}


#[derive(Debug, Clone, PartialEq, Eq)]
///A Bolt12Invoice is a payment request, typically corresponding to an Offer or a Refund.
// An invoice may be sent in response to an InvoiceRequest in the case of an offer or sent directly after scanning a refund. It includes all the information needed to pay a recipient.
pub struct Bolt12Invoice {
    pub data: Vec<u8>
}

impl TryFrom<Bolt12Invoice> for ldk_node::lightning::offers::invoice::Bolt12Invoice {
    type Error = LdkNodeError;

    fn try_from(value: Bolt12Invoice) -> Result<Self, Self::Error> {
        ldk_node::lightning::offers::invoice::Bolt12Invoice::try_from(value.data)
            .map_err(|_| LdkNodeError::InvalidInvoice)
    }
}
impl From< ldk_node::lightning::offers::invoice::Bolt12Invoice> for Bolt12Invoice {
    fn from(value:  ldk_node::lightning::offers::invoice::Bolt12Invoice) -> Self {
        Bolt12Invoice {
            data: value.encode(),
        }
    }
}
pub struct LdkBolt12Payment{
    pub ptr: RustOpaque<Arc<ldk_node::payment::Bolt12Payment>>
}
impl LdkBolt12Payment{
   pub fn send(&self, offer:Offer, payer_note: Option<String>)-> Result<PaymentId, LdkNodeError> {
       self.ptr.send(&(offer.try_into()?), payer_note).map_err(|e| e.into()).map(|e| e.into())
   }
    pub fn send_using_amount(
        &self, offer: Offer, payer_note: Option<String>, amount_msat: u64
    ) -> anyhow::Result<PaymentId, LdkNodeError> {
        self.ptr
            .send_using_amount(&(offer.try_into()?), payer_note, amount_msat)
            .map_err(|e| e.into())
            .map(|e| e.into())
    }
    pub fn receive(
        &self,
        amount_msat: u64,
        description: String,
    ) -> anyhow::Result<Offer, LdkNodeError> {
        self.ptr
            .receive(amount_msat, description.as_str())
            .map_err(|e| e.into())
            .map(|e| e.into())
    }
    pub fn receive_variable_amount(
        &self,
        description: String,
    ) -> anyhow::Result<Offer, LdkNodeError> {
        self.ptr
            .receive_variable_amount
            (description.as_str())
            .map_err(|e| e.into())
            .map(|e| e.into())
    }

    pub fn request_refund_payment(
        &self,
        refund: Refund,
    ) -> anyhow::Result<Bolt12Invoice, LdkNodeError> {
        self.ptr
            .request_refund_payment
            (&(refund.try_into()?))
            .map_err(|e| e.into())
            .map(|e| e.into())
    }

    pub fn initiate_refund(
        &self, amount_msat: u64, expiry_secs: u32
    ) -> anyhow::Result<Refund, LdkNodeError> {
        self.ptr
            .initiate_refund
            (amount_msat, expiry_secs)
            .map_err(|e| e.into())
            .map(|e| e.into())
    }


}
