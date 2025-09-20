use crate::api::node::FfiNode;
use crate::api::types::{
    ChainDataSourceConfig, Config, EntropySourceConfig, GossipSourceConfig, LiquiditySourceConfig, LogLevel,
};
use crate::frb_generated::RustOpaque;
use crate::utils::error::FfiBuilderError;
use flutter_rust_bridge::frb;
use std::collections::HashMap;
use std::str::FromStr;

#[derive(Debug, Clone)]
pub struct FfiMnemonic {
    pub seed_phrase: String,
}

impl TryFrom<FfiMnemonic> for ldk_node::bip39::Mnemonic {
    type Error = FfiBuilderError;

    fn try_from(value: FfiMnemonic) -> Result<Self, Self::Error> {
        ldk_node::bip39::Mnemonic::from_str(&value.seed_phrase).map_err(|e| e.into())
    }
}
impl From<ldk_node::bip39::Mnemonic> for FfiMnemonic {
    fn from(value: ldk_node::bip39::Mnemonic) -> Self {
        FfiMnemonic {
            seed_phrase: value.to_string(),
        }
    }
}
impl FfiMnemonic {
    pub fn generate() -> FfiMnemonic {
        ldk_node::generate_entropy_mnemonic().into()
    }
}

#[frb(opaque)]
pub struct FfiBuilder {
    pub opaque: RustOpaque<ldk_node::Builder>,
}

impl FfiBuilder {
    #[frb(sync)]
    pub fn create_builder(
        config: Config,
        chain_data_source_config: Option<ChainDataSourceConfig>,
        entropy_source_config: Option<EntropySourceConfig>,
        gossip_source_config: Option<GossipSourceConfig>,
        liquidity_source_config: Option<LiquiditySourceConfig>,
    ) -> Result<FfiBuilder, FfiBuilderError> {
        let mut builder = ldk_node::Builder::from_config(config.try_into()?);
        if let Some(source) = entropy_source_config {
            match source {
                EntropySourceConfig::SeedFile(e) => {
                    builder.set_entropy_seed_path(e);
                }
                EntropySourceConfig::SeedBytes(e) => {
                    builder.set_entropy_seed_bytes(e);
                }
                EntropySourceConfig::Bip39Mnemonic {
                    mnemonic,
                    passphrase,
                } => {
                    builder.set_entropy_bip39_mnemonic(
                        <FfiMnemonic as TryInto<ldk_node::bip39::Mnemonic>>::try_into(mnemonic)?,
                        passphrase,
                    );
                }
            }
        }

        if let Some(source) = chain_data_source_config {
            match source {
                ChainDataSourceConfig::Esplora {
                    server_url,
                    sync_config,
                } => {
                    builder.set_chain_source_esplora(server_url, sync_config.map(|e| e.into()));
                }
                ChainDataSourceConfig::BitcoindRpc {
                    rpc_host,
                    rpc_port,
                    rpc_user,
                    rpc_password,
                } => {
                    builder.set_chain_source_bitcoind_rpc(
                        rpc_host,
                        rpc_port,
                        rpc_user,
                        rpc_password,
                    );
                }
                ChainDataSourceConfig::Electrum {
                    server_url,
                    sync_config,
                } => {
                    builder.set_chain_source_electrum(server_url, sync_config.map(|e| e.into()));
                }
            }
        }
        if let Some(source) = gossip_source_config {
            match source {
                GossipSourceConfig::P2PNetwork => {
                    builder.set_gossip_source_p2p();
                }
                GossipSourceConfig::RapidGossipSync(e) => {
                    builder.set_gossip_source_rgs(e);
                }
            }
        }
        if let Some(liquidity) = liquidity_source_config {
            builder.set_liquidity_source_lsps2(
                liquidity
                    .lsps2_service
                    .1
                    .try_into()
                    .map_err(|_| FfiBuilderError::InvalidPublicKey)?,
                liquidity.lsps2_service.0.try_into()?,
                liquidity.lsps2_service.2,
            );
        }
        Ok(FfiBuilder {
            opaque: RustOpaque::new(builder),
        })
    }
    pub fn build(self) -> anyhow::Result<FfiNode, FfiBuilderError> {
        match self.opaque.build() {
            Ok(e) => Ok(FfiNode {
                opaque: RustOpaque::new(e),
            }),
            Err(e) => Err(e.into()),
        }
    }
    pub fn build_with_fs_store(self) -> anyhow::Result<FfiNode, FfiBuilderError> {
        match self.opaque.build_with_fs_store() {
            Ok(e) => Ok(FfiNode {
                opaque: RustOpaque::new(e),
            }),
            Err(e) => Err(e.into()),
        }
    }
    pub fn build_with_vss_store(
        &self,
        vss_url: String,
        store_id: String,
        lnurl_auth_server_url: String,
        fixed_headers: HashMap<String, String>,
    ) -> anyhow::Result<FfiNode, FfiBuilderError> {
        match self.opaque.build_with_vss_store(
            vss_url,
            store_id,
            lnurl_auth_server_url,
            fixed_headers,
        ) {
            Ok(e) => Ok(FfiNode {
                opaque: RustOpaque::new(e),
            }),
            Err(e) => Err(e.into()),
        }
    }
    pub fn build_with_vss_store_and_fixed_headers(
        &self,
        vss_url: String,
        store_id: String,
        fixed_headers: HashMap<String, String>,
    ) -> anyhow::Result<FfiNode, FfiBuilderError> {
        match self
            .opaque
            .build_with_vss_store_and_fixed_headers(vss_url, store_id, fixed_headers)
        {
            Ok(e) => Ok(FfiNode {
                opaque: RustOpaque::new(e),
            }),
            Err(e) => Err(e.into()),
        }
    }
    // pub fn build_with_vss_store_and_header_provider(
    //     &self,
    //     vss_url: String,
    //     store_id: String,
    //     //todo; create a callback
    //     header_provider: Opaque
    // ) -> anyhow::Result<FfiNode, FfiBuilderError> {
    //     match
    //         self.opaque.build_with_vss_store_and_header_provider(vss_url, store_id, header_provider)
    //     {
    //         Ok(e) =>
    //             Ok(FfiNode {
    //                 opaque: RustOpaque::new(e),
    //             }),
    //         Err(e) => Err(e.into()),
    //     }
    // }

    #[frb(sync)]
    pub fn set_entropy_seed_bytes(self, seed_bytes: Vec<u8>) -> Result<Self, FfiBuilderError> {
        // Validate the length of the seed bytes
        if seed_bytes.len() != 64 {
            return Err(FfiBuilderError::InvalidSeedBytes);
        }

        // Convert the Vec<u8> into a fixed-size array
        let mut seed_array = [0u8; 64];
        seed_array.copy_from_slice(&seed_bytes);

        // Extract the inner builder, modify it, and wrap it back
        let mut builder = self.opaque.into_inner().ok_or(FfiBuilderError::OpaqueNotFound)?;
        builder.set_entropy_seed_bytes(seed_array);
        Ok(
            FfiBuilder {
                opaque: RustOpaque::new(builder),
            }
        )
    }

    // Configures the Node instance to write logs to the filesystem.
    //
    // The `log_file_path` defaults to 'ldk_node.log' in the configured storage directory if set to `None`.
    // If set, the `max_log_level` sets the maximum log level. Otherwise, defaults to Debug level.
    #[frb(sync)]
    pub fn set_filesystem_logger(
        self,
        log_file_path: Option<String>,
        max_log_level: Option<LogLevel>,
    ) -> Result<Self, FfiBuilderError> {
        let mut builder = self.opaque.into_inner().ok_or(FfiBuilderError::OpaqueNotFound)?;
        
        let ldk_max_log_level = max_log_level.map(|level| level.into());
        builder.set_filesystem_logger(log_file_path, ldk_max_log_level);
        
        Ok(FfiBuilder {
            opaque: RustOpaque::new(builder),
        })
    }

    // Configures the Node instance to write logs to the Rust log facade.
    //
    // This allows integration with existing Rust logging frameworks.
    #[frb(sync)]
    pub fn set_log_facade_logger(self) -> Result<Self, FfiBuilderError> {
        let mut builder = self.opaque.into_inner().ok_or(FfiBuilderError::OpaqueNotFound)?;
    
        builder.set_log_facade_logger();

        Ok(FfiBuilder {
            opaque: RustOpaque::new(builder),
        })
    }
}
