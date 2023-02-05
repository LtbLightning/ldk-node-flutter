use std::str::FromStr;
use bitcoin::secp256k1;
use crate::types::{Address, Invoice, Network, PaymentHash, PaymentInfo, PaymentPreimage, PaymentSecret, PaymentStatus, PublicKey};
use serde::{Serialize, Serializer};
use serde::ser::SerializeMap;
use crate::event::Event;
use crate::{ffi, hex_utils};

impl From<Network> for bdk::bitcoin::Network {
    fn from(network: Network) -> Self {
        match network{
            Network::Signet => bdk::bitcoin::Network::Signet,
            Network::Testnet => bdk::bitcoin::Network::Testnet,
            Network::Regtest => bdk::bitcoin::Network::Regtest,
            Network::Bitcoin => bdk::bitcoin::Network::Bitcoin,
        }
    }
}

impl From<Invoice> for lightning_invoice::Invoice {
    fn from(invoice: Invoice) -> Self {
        return  lightning_invoice::Invoice::from_str(invoice.as_string.as_str()).unwrap()
    }
}

impl From<lightning_invoice::Invoice> for Invoice {
    fn from(invoice:lightning_invoice::Invoice) -> Self {
        return  Invoice{as_string:invoice.to_string()};
    }
}
impl From<&lightning::ln::PaymentSecret> for PaymentSecret {
    fn from(payment_secret:&lightning::ln::PaymentSecret) -> Self {
        return  PaymentSecret{
            as_u_array:payment_secret.0
        };
    }
}

impl From<bitcoin::Address> for Address {
    fn from(address: bitcoin::Address) -> Self {
        Address{
            as_string:address.to_string()
        }
    }
}
impl From<Address> for bitcoin::Address {
    fn from(address: Address) -> Self {
        match  bitcoin::Address::from_str(address.as_string.as_str()){
            Ok(e) => e,
            Err(e) =>  panic!("invalid_address {:?}", e)
        }
    }
}
impl From<PublicKey> for secp256k1::PublicKey {
    fn from(key:PublicKey) -> Self {
        match secp256k1::PublicKey::from_str(key.as_string.as_str()){
            Ok(e) => {e}
            Err(e) => panic!("invalid_public_key {:?}", e)
        }
    }
}
impl From<ffi::PaymentInfo> for PaymentInfo {
    fn from(info:ffi::PaymentInfo) -> Self {
       PaymentInfo{
           preimage: Some(PaymentPreimage{ as_u_array: info.secret.unwrap().0 }),
           secret: Some(PaymentSecret{ as_u_array: info.secret.unwrap().0 }),
           status: info.status.into(),
           amount_msat: info.amount_msat
       }
    }
}

impl From<ffi::PaymentStatus> for PaymentStatus {
    fn from(status: ffi::PaymentStatus) -> Self {
        match status{
            ffi::PaymentStatus::Pending => PaymentStatus::Pending,
            ffi::PaymentStatus::Succeeded => PaymentStatus::Succeeded,
            ffi::PaymentStatus::Failed => PaymentStatus::Failed
        }
    }
}
impl From<secp256k1::PublicKey> for PublicKey {
    fn from(key:secp256k1::PublicKey) -> Self {
        PublicKey{ as_string: key.to_string() }
    }
}
impl From<lightning::ln::PaymentHash> for PaymentHash {
    fn from(hash:lightning::ln::PaymentHash) -> Self {
        PaymentHash{ as_string:  hex_utils::to_string(&hash.0), }
    }
}

impl Serialize for Event {
    fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error>
        where
            S: Serializer,
    {
        match *self {
            Event::PaymentSuccessful { payment_hash } => {
                let mut map = serializer.serialize_map(Some(1))?;

                map.serialize_entry(
                    "payment_hash",
                    &hex_utils::to_string(payment_hash.0.as_slice()),
                )
                    .unwrap();
                map.serialize_entry(
                    "event",
                    &"PaymentSuccessful").unwrap();
                map.end()
            }
            Event::PaymentFailed { payment_hash } => {
                let mut map = serializer.serialize_map(Some(1))?;

                map.serialize_entry(
                    "payment_hash",
                    &hex_utils::to_string(payment_hash.0.as_slice()),
                )
                    .unwrap();
                map.serialize_entry(
                    "event",
                    &"PaymentFailed",
                )
                    .unwrap();
                map.end()
            }
            Event::PaymentReceived {
                payment_hash,
                amount_msat,
            } => {
                let mut map = serializer.serialize_map(Some(2))?;
                map.serialize_entry(
                    "payment_hash",
                    &hex_utils::to_string(payment_hash.0.as_slice()),
                )
                    .unwrap();
                map.serialize_entry("amount_msat", &amount_msat.to_string())
                    .unwrap();
                map.serialize_entry(
                    "event",
                    &"PaymentReceived",
                )
                    .unwrap();
                map.end()
            }
            Event::ChannelReady {
                channel_id,
                user_channel_id,
            } => {
                let mut map = serializer.serialize_map(Some(2))?;
                map.serialize_entry("channel_id", &hex_utils::to_string(channel_id.as_slice()))
                    .unwrap();
                map.serialize_entry("user_channel_id", &user_channel_id.to_string())
                    .unwrap();
                map.serialize_entry(
                    "event",
                    &"ChannelReady",
                )
                    .unwrap();
                map.end()
            }
            Event::ChannelClosed {
                channel_id,
                user_channel_id,
            } => {
                let mut map = serializer.serialize_map(Some(2))?;
                map.serialize_entry("channel_id", &hex_utils::to_string(channel_id.as_slice()))
                    .unwrap();
                map.serialize_entry("amount_msat", &user_channel_id.to_string())
                    .unwrap();
                map.serialize_entry(
                    "event",
                    &"ChannelClosed",
                )
                    .unwrap();
                map.end()
            }
        }
    }
}
