use crate::types::Network;
use bitcoin::Network as BitcoinNetwork;

pub fn config_network(network: Network) -> BitcoinNetwork {
    return match network {
        Network::Signet => BitcoinNetwork::Signet,
        Network::Testnet => BitcoinNetwork::Testnet,
        Network::Regtest => BitcoinNetwork::Regtest,
        Network::Bitcoin => BitcoinNetwork::Bitcoin,
    };
}
