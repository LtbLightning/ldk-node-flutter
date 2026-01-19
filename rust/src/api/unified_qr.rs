use crate::{frb_generated::RustOpaque, utils::error::FfiNodeError};

use super::types::{PaymentId, RouteParametersConfig, Txid};

pub struct FfiUnifiedQrPayment {
    pub opaque: RustOpaque<ldk_node::payment::UnifiedQrPayment>,
}
impl From<ldk_node::payment::UnifiedQrPayment> for FfiUnifiedQrPayment {
    fn from(value: ldk_node::payment::UnifiedQrPayment) -> Self {
        FfiUnifiedQrPayment {
            opaque: RustOpaque::new(value),
        }
    }
}
impl FfiUnifiedQrPayment {
    /// can always pay using the provided on-chain address, while newer wallets will
    /// typically opt to use the provided BOLT11 invoice or BOLT12 offer.
    ///
    /// # Parameters
    /// - `amount_sats`: The amount to be received, specified in satoshis.
    /// - `description`: A description or note associated with the payment.
    ///   This message is visible to the payer and can provide context or details about the payment.
    /// - `expiry_sec`: The expiration time for the payment, specified in seconds.
    ///
    /// Returns a payable URI that can be used to request and receive a payment of the amount
    /// given. In case of an error, the function throws `:WalletOperationFailed`for on-chain
    /// address issues, `InvoiceCreationFailed` for BOLT11 invoice issues, or
    /// `OfferCreationFailed` for BOLT12 offer issues.
    ///
    /// The generated URI can then be given to a QR code library.
    ///
    /// [BOLT 11]: https://github.com/lightning/bolts/blob/master/11-payment-encoding.md
    /// [BOLT 12]: https://github.com/lightning/bolts/blob/master/12-offer-encoding.md
    pub fn receive_unsafe(
        &self,
        amount_sats: u64,
        message: String,
        expiry_sec: u32,
    ) -> anyhow::Result<String, FfiNodeError> {
        self.opaque
            .receive(amount_sats, message.as_str(), expiry_sec)
            .map_err(|e| e.into())
    }
    ///Sends a payment given a BIP 21 URI.

    ///This method parses the provided URI string and attempts to send the payment. If the URI has an offer and or invoice, it will try to pay the offer first followed by the invoice. If they both fail, the on-chain payment will be paid.
    pub fn send_unsafe(&self, uri_str: String, route_parameters: Option<RouteParametersConfig>) -> anyhow::Result<QrPaymentResult, FfiNodeError> {
        self.opaque
            .send(uri_str.as_str(), route_parameters.map(|e| e.into()))
            .map_err(|e| e.into())
            .map(|e| e.into())
    }
}

/// Represents the result of a payment made using a [BIP 21] QR code.
///
/// After a successful on-chain transaction, the transaction ID ([Txid]) is returned.
/// For BOLT11 and BOLT12 payments, the corresponding [PaymentId] is returned.
///
/// [BIP 21]: https://github.com/bitcoin/bips/blob/master/bip-0021.mediawiki
pub enum QrPaymentResult {
    /// An on-chain payment.
    Onchain {
        /// The transaction ID (txid) of the on-chain payment.
        txid: Txid,
    },
    /// A [BOLT 11] payment.
    ///
    /// [BOLT 11]: https://github.com/lightning/bolts/blob/master/11-payment-encoding.md
    Bolt11 {
        /// The payment ID for the BOLT11 invoice.
        payment_id: PaymentId,
    },
    /// A [BOLT 12] offer payment, i.e., a payment for an [Offer].
    ///
    /// [BOLT 12]: https://github.com/lightning/bolts/blob/master/12-offer-encoding.md
    Bolt12 {
        /// The payment ID for the BOLT12 offer.
        payment_id: PaymentId,
    },
}
impl From<ldk_node::payment::QrPaymentResult> for QrPaymentResult {
    fn from(value: ldk_node::payment::QrPaymentResult) -> Self {
        match value {
            ldk_node::payment::QrPaymentResult::Onchain { txid } => {
                QrPaymentResult::Onchain { txid: txid.into() }
            }

            ldk_node::payment::QrPaymentResult::Bolt11 { payment_id } => QrPaymentResult::Bolt11 {
                payment_id: payment_id.into(),
            },
            ldk_node::payment::QrPaymentResult::Bolt12 { payment_id } => QrPaymentResult::Bolt12 {
                payment_id: payment_id.into(),
            },
        }
    }
}
