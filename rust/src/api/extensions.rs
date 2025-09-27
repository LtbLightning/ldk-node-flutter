// // EntropySourceConfig constructor functions
// pub mod entropy_source_config {
//     use ldk_adapter::types::EntropySourceConfig;
//     use shared::Mnemonic;

//     pub fn seed_file(seed_path: String) -> EntropySourceConfig {
//         EntropySourceConfig::SeedFile(seed_path)
//     }

//     pub fn seed_bytes(seed_bytes: [u8; 64]) -> EntropySourceConfig {
//         EntropySourceConfig::SeedBytes(seed_bytes)
//     }

//     pub fn bip39_mnemonic(mnemonic: Mnemonic, passphrase: Option<String>) -> EntropySourceConfig {
//         EntropySourceConfig::Bip39Mnemonic { mnemonic, passphrase }
//     }
// }

// // ChainDataSourceConfig constructor functions
// pub mod chain_data_source_config {
//     use ldk_adapter::types::{ChainDataSourceConfig, EsploraSyncConfig};

//     pub fn esplora(server_url: String, sync_config: Option<EsploraSyncConfig>) -> ChainDataSourceConfig {
//         ChainDataSourceConfig::Esplora {
//             server_url,
//             sync_config
//         }
//     }

//     pub fn bitcoind_rpc(rpc_host: String, rpc_port: u16, rpc_user: String, rpc_password: String) -> ChainDataSourceConfig {
//         ChainDataSourceConfig::BitcoindRpc {
//             rpc_host,
//             rpc_port,
//             rpc_user,
//             rpc_password,
//         }
//     }
// }

// // GossipSourceConfig constructor functions  
// pub mod gossip_source_config {
//     use ldk_adapter::types::GossipSourceConfig;

//     pub fn p2p_network() -> GossipSourceConfig {
//         GossipSourceConfig::P2PNetwork
//     }

//     pub fn rapid_gossip_sync(rgs_server_url: String) -> GossipSourceConfig {
//         GossipSourceConfig::RapidGossipSync(rgs_server_url)
//     }
// }